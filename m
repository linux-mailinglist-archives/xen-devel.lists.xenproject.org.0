Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C49C51D6A0
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 13:26:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322941.544429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmw5m-0000wl-S0; Fri, 06 May 2022 11:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322941.544429; Fri, 06 May 2022 11:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmw5m-0000tA-Oq; Fri, 06 May 2022 11:25:50 +0000
Received: by outflank-mailman (input) for mailman id 322941;
 Fri, 06 May 2022 11:25:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qjQo=VO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nmw5l-0000t4-KY
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 11:25:49 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46994dfa-cd2f-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 13:25:47 +0200 (CEST)
Received: from AM6P191CA0099.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::40)
 by VI1PR08MB5453.eurprd08.prod.outlook.com (2603:10a6:803:132::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 6 May
 2022 11:25:44 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::a9) by AM6P191CA0099.outlook.office365.com
 (2603:10a6:209:8a::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18 via Frontend
 Transport; Fri, 6 May 2022 11:25:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Fri, 6 May 2022 11:25:44 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Fri, 06 May 2022 11:25:43 +0000
Received: from ec58c580f8c0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 85A57C7F-F104-49F0-9479-1E36873D6502.1; 
 Fri, 06 May 2022 11:25:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ec58c580f8c0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 May 2022 11:25:32 +0000
Received: from VI1PR08MB3967.eurprd08.prod.outlook.com (2603:10a6:803:df::16)
 by DB7PR08MB3690.eurprd08.prod.outlook.com (2603:10a6:10:77::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 11:25:28 +0000
Received: from VI1PR08MB3967.eurprd08.prod.outlook.com
 ([fe80::d529:a34d:5df0:47ae]) by VI1PR08MB3967.eurprd08.prod.outlook.com
 ([fe80::d529:a34d:5df0:47ae%3]) with mapi id 15.20.5206.028; Fri, 6 May 2022
 11:25:28 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 46994dfa-cd2f-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=D5Qq/iqscHstFEly7eQkcPDv8y37VtMvkZdC7JfF94ixLyLPJdsmJeBrrUGRgSYKuY0b+R3d27RT1dj/ANBDKGwtYgiwesg5Z/4XI8Gnn2B11+rA5QCIO+TACMc8Dp1UjK+BAgQOgLbeXLlvMgylAsPIYwhu1xUCq8DW5qI+YMl27eAEwLhZ/KcG+q4txFnbIXLUXcSapG/phy3bNbRhq/Ky0pft4W20JwSs1EzcbQrr0iGtTLyg13fUzd7YALb8M7qcNLDJUwgfKdMKYIMcivPhsYLlUzuhz+QCPYhSfMAkUUvTPCI5+iLI2BhJa/sywE+WetJyds8RAnpXLOjO6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jDlgMdK0c13yFMcIYkbpv9Ytu+wtPg74tMKt6JOgsA=;
 b=D9Zmqa07N5xK2SrgFx+5yU+3yHu+GPxz59lFwno3uoUSxjbKivtDe6qxNaARqhyDWPKYxrwjYya2ZnMLj2TvG/HuWVpAABEP9Cnbqat8nVhdRNtINeWmKeU/RcCS+fwnm8bsGJKd1baj3ruRFkizAKQO+UzuqhuIh1UisFEL6ZflM2VT0L1BfmCsX/44QI5eUbwmW7d7Y89Sr0PjsWdHxz/QaLHv9mQdcLidLm9pDmDs0yO1pl0XIE+vGiJZhNGCgy+hw6Hdk+dr5+4/m1Y16T6+cF8G4qH3ZfiJ/HIhnkEHagaG3xrBf/61kDcJzb26otYk9CJylzcVvVtzwiQZSg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jDlgMdK0c13yFMcIYkbpv9Ytu+wtPg74tMKt6JOgsA=;
 b=sKin7I0oMiQDmPMueJdidyJY81QFrCpPDufSXNR3+/fZ3DoKORLMNl4WppYeVjENzkACQTDmXFCwDpDXX5IXDpKpo06w539yc8KP32cu5DRh4VvWNTHode/ZHpjfL8+3X2Hyte0HfiyNtp1kxYFwZVU5MogoiPsc0W1W6RWsQ20=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 642b9b04e2d45376
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzubadFKfvxMLFYEG6lGWpbNDL/Ezk5600FosEjzNyuMLI79J9djfgfU/+JVEOhSNmlXHs2y8sACpSvYuMr9DnlHq22HoMDQT2NcVD7ApoUgu6P0mNOIr/XsQbamSdwubb7Vgg8F+WxkZcenIkuPHfLXUIVCZ+6xbhSLSM2HpLNA4jggnfn4lHpnngyDzYpAV4ytcd7Wwv7+/qMFIkukQk8Qep435U/FTu/V9GoEp4EFbi4j7ss8pVLEJFBT1sWbS8jKUeIWdi/5VqNkTK8aIkSYn+Ilm2PhGnJQhSLnXlcIVBpUaqSFI7yp2QNV/YPAiFmnEJW7vatP36p0JMjTrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jDlgMdK0c13yFMcIYkbpv9Ytu+wtPg74tMKt6JOgsA=;
 b=QJ2gnGfSJXC+0x4QdkWFUjX4MYyzT16GPPPOCB2kfmZwLpZfrsX5iOSI0Pj41vKAQZebHrm6l9NYFPzzbghZ/JeMvvbm1IhFY32ZJb/Z7nzMCG5sUFE6uXR1DRhFIm5A8UAs+s5SzQWy1ZNbOkeUIIrWkKyhurljbZs0VgW6cYZmaGQUye7+lg3gJp+Q9zO7jZShPSnHkxcMRHzqvayXJ9a3HpeoJGbPA48ZABe3IoM9NrQJ/W05JhGAXmlAeUKd/KOvzmWcKsm/BFjgtQETdeh8R6y1mBD2lBPKR0KTbsFNnQIaDq+INxUL5MUtEdrh3ToUlaoql3UQNgVoiY3vMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jDlgMdK0c13yFMcIYkbpv9Ytu+wtPg74tMKt6JOgsA=;
 b=sKin7I0oMiQDmPMueJdidyJY81QFrCpPDufSXNR3+/fZ3DoKORLMNl4WppYeVjENzkACQTDmXFCwDpDXX5IXDpKpo06w539yc8KP32cu5DRh4VvWNTHode/ZHpjfL8+3X2Hyte0HfiyNtp1kxYFwZVU5MogoiPsc0W1W6RWsQ20=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: xen-devel <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v8 0/7] Boot time cpupools
Thread-Topic: [PATCH v8 0/7] Boot time cpupools
Thread-Index: AQHYVVhdzvmSbSkA9kKhcVjYQ/ksyq0RzUeA
Date: Fri, 6 May 2022 11:25:28 +0000
Message-ID: <0EA6F35B-89E9-45AC-9274-567F86E67C6E@arm.com>
References: <20220421081645.40235-1-luca.fancellu@arm.com>
In-Reply-To: <20220421081645.40235-1-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0b0cd7ea-cc8d-4f2b-7e9d-08da2f5328eb
x-ms-traffictypediagnostic:
	DB7PR08MB3690:EE_|AM5EUR03FT027:EE_|VI1PR08MB5453:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB5453692EF46E8BC2A25FBC75E4C59@VI1PR08MB5453.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 q36mS1ve368yZK/S8X51YoN+iy+tobr2ukT3Eli1cS3fq6SAs1S+ZZOqGaHGeFzLTwAMdB1BFVRchhOfqPk7UHPn4W0U5lXn0Yi9z7l0Mx9rzgkLG89iHzfUnnjKJkGh4KBhC3oj165b7t196lZEtUODy6dznjDo9V3byh6e4LXVoYX/p8/a0QwO80OVnXNoQN+pPyevd7F6I/EjGQV3n/jW0MctygdnPu7BQ8H1BFl/igaT1L3fkqgKvm/JK/nTwIIteizIalb1RM0R/4FzpHHLWha3S+gcjqgPK42qSAccZ17Vpl8gjRSqXZbIqZP+W6aeOEIAeRN+kDIZeQ8X/+Hb75kh79Vhn3XUMBS95dYr65JW2SCZ0YT8b/nUqszikEuqlO6hn16RmwQkifZGr1Ip6McLkUj4TEA23bo5B4GjA/0yPj6V5aLanSn8pnLK+92T4ioG3H7ClqLJWFqQyPifkmic0+P3XyvdkpBvQcmK8OYJJi7V8jnxJuw4dAFcLbjEvNTaXXmfkK6CMIdtVS5+elw/vXwgbbeQfA+Yydk0hrA/4wgCChQs8hkyMiLgG+tChwbijGBobiYQS/K48mEA1Vp0JIbUXwycdIz/44kEeHeFcG/LXuKZm4kIzjjVwIPPxHPEPujU7k4fUpyaP3ve+y8dqfRSALIMbF7PsFafauxPuJdnnDWMDgxYczEhLGxSLSHLlRm96Ua1yZBdXpiWnSyrXy0rBhGr+rxv/xjLYqZ1WiCN2iB/ZFvcuzbp55F340yhAVVOfZRLVKZvmyrvhUA4AanIDkNzZPaiRD9/lp1lOYjy+5UArowVWyyWtny0vAhoowCOhondkQM22Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3967.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(2616005)(186003)(83380400001)(6512007)(26005)(33656002)(2906002)(54906003)(6916009)(316002)(91956017)(76116006)(5660300002)(6506007)(508600001)(64756008)(66446008)(66476007)(8676002)(66946007)(66556008)(38100700002)(8936002)(38070700005)(86362001)(6486002)(122000001)(966005)(4326008)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <78CEBBFDFD70FF4DBAD6E604FB738CDC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3690
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fb2a4167-ee2f-42ea-928b-08da2f531f6c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	22f5GuglIz9dDFXu8A6sUjpRWHxrVnt2wAL7DaxdagpvoijgbU1Yc/4oXuOpNXHvNjfoj4Dt8UdNsTzIPMy1Mx5ZMTEediLlC+nscNKty5PibIfpZYVEoav+H/oc6N/jC+yIrMJIGgoiz/yPEEBo/OIzHO4wjf2JuhQtcgF4BIT1XrmcAOrC+Xpt0R/SdgvD7VeydQAxLZtGxgbqLiN7sGdjGtRB6//X1RY/ME+yDt+kPIe0z91+E3Nzx/Q5xD7G3b7JMTdj68bocodueeYBQXw7QJpJGDO7AZ+qRjCsAX7mbYAtaV7WTCsRyCGaBLva7ljPdSr0uagTwNXTJ0dirwMkhEhI4g7EefkNqtCPzYmRC1rxjyhv8okaOEkM8CXVYf0SS06PSR2ucGdPOBk9g338+Uo/+T+xl+ZfRTEhcWWOP8Na2BlOrLtafR7qxRBTkojDTtwmYhh7Sn1QW1VJcf7RicH3QUXgSJbOiE7yWP7zrHGHJLqfzyoFk4i/IugZds9MrQ8acn2BGK6oQ9YFJv9XxCvjqDM4JkiwsdiQg1e3cBjeHHBwsj0qXGrz/6pZr7C39yeZD46Z5gxvEtbCRxmSOgEFI4pIJtEOxnKHr2JUCHKcEvkeGiHklRm7I9GsdfHDMzYoIhfk+XxSnmoTukAofENg5zr1JwgsVeC9pWUpTCZzMjxQ0iQVtNZkC/unUPg9HvwmyUUVsIK5+M99xcCyVmr0xTAcfDSQEx1Jnm2Eb+wVFvggR6XcskWFy8XqZT/ML0PyNyKtMX9mG5v0QQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(47076005)(336012)(356005)(81166007)(186003)(316002)(8936002)(4326008)(36756003)(83380400001)(70586007)(8676002)(36860700001)(54906003)(86362001)(33656002)(40460700003)(6916009)(5660300002)(508600001)(2616005)(966005)(6486002)(82310400005)(6506007)(6512007)(26005)(2906002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 11:25:44.1034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0cd7ea-cc8d-4f2b-7e9d-08da2f5328eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5453


> The example DT is instructing Xen to have two cpu pools, one having two p=
hisical
> cpus and the one having 4 phisical cpus, the last mentioned cpu pool uses=
 the
> null scheduler and from the /chosen node we can see that a dom0less guest=
 will
> be started on that cpu pool.
>=20
> In this particular case Xen must boot with different type of cpus, so the
> boot argument hmp_unsafe must be enabled.
>=20
> Luca Fancellu (7):
>  tools/cpupools: Give a name to unnamed cpupools
>  xen/sched: create public function for cpupools creation
>  xen/sched: retrieve scheduler id by name
>  xen/cpupool: Create different cpupools at boot time
>  xen/cpupool: Don't allow removing cpu0 from cpupool0
>  arm/dom0less: assign dom0less guests to cpupools
>  xen/cpupool: Allow cpupool0 to use different scheduler
>=20
> MAINTAINERS                            |   2 +-
> docs/misc/arm/device-tree/booting.txt  |   5 +
> docs/misc/arm/device-tree/cpupools.txt | 140 +++++++++++++++
> tools/helpers/xen-init-dom0.c          |  37 +++-
> tools/libs/light/libxl_utils.c         |   3 +-
> xen/arch/arm/domain_build.c            |  19 +-
> xen/arch/arm/include/asm/smp.h         |   3 +
> xen/common/domain.c                    |   2 +-
> xen/common/sched/Kconfig               |   7 +
> xen/common/sched/Makefile              |   1 +
> xen/common/sched/boot-cpupool.c        | 234 +++++++++++++++++++++++++
> xen/common/sched/core.c                |  40 +++--
> xen/common/sched/cpupool.c             |  43 ++++-
> xen/include/public/domctl.h            |   5 +-
> xen/include/xen/sched.h                |  53 ++++++
> 15 files changed, 563 insertions(+), 31 deletions(-)
> create mode 100644 docs/misc/arm/device-tree/cpupools.txt
> create mode 100644 xen/common/sched/boot-cpupool.c
>=20
> --=20
> 2.17.1
>=20

Ping?

The v8 seems to be reviewed for all patch

https://patchwork.kernel.org/project/xen-devel/list/?series=3D634064

Any other thought about that?

Cheers,
Luca


