Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E99BA706597
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 12:51:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535863.833927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzEjm-00076X-Oi; Wed, 17 May 2023 10:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535863.833927; Wed, 17 May 2023 10:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzEjm-00074e-Kl; Wed, 17 May 2023 10:50:30 +0000
Received: by outflank-mailman (input) for mailman id 535863;
 Wed, 17 May 2023 10:50:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cMB/=BG=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pzEjk-00074H-Mi
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 10:50:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1b864b5-f4a0-11ed-b229-6b7b168915f2;
 Wed, 17 May 2023 12:50:26 +0200 (CEST)
Received: from AM4PR0501CA0055.eurprd05.prod.outlook.com
 (2603:10a6:200:68::23) by AS2PR08MB10265.eurprd08.prod.outlook.com
 (2603:10a6:20b:62c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Wed, 17 May
 2023 10:50:23 +0000
Received: from AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:200:68:cafe::ca) by AM4PR0501CA0055.outlook.office365.com
 (2603:10a6:200:68::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Wed, 17 May 2023 10:50:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT016.mail.protection.outlook.com (100.127.140.106) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.15 via Frontend Transport; Wed, 17 May 2023 10:50:23 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Wed, 17 May 2023 10:50:23 +0000
Received: from c4181ce8af37.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5C3AB009-1C46-4A2D-BB27-AB838D802112.1; 
 Wed, 17 May 2023 10:50:16 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c4181ce8af37.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 May 2023 10:50:16 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DBAPR08MB5846.eurprd08.prod.outlook.com (2603:10a6:10:1b0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 10:50:14 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%6]) with mapi id 15.20.6387.032; Wed, 17 May 2023
 10:50:14 +0000
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
X-Inumbo-ID: a1b864b5-f4a0-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSq0NZmxvBCKts1XtcwpXIE078eEUbe1goYAV1VZhBA=;
 b=9HK9LRoyust42/6wxjVBncfDNjy5vyH5sCMe94OcXfY7CR65uNjEUo+ZmQV0KrRPbPs/XATjvNG9HYYl+2WbNlxCjo9mYAcxxyKZkiJx9DnneElxaQ4rvozw3NoTFfDjm2yWj3ebJxh9Z63JIkFDf/L404m5MBQP8+2KR2u7aIk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 424a2b75fe8f5081
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Odf10QGJ2ILhd0JOUUYe0d9zEyGykyDYDBe39tAs0bTrs+vRSWYcoHrzrt9Gfw54QW4kuesbHlM4o7s494G4lRnXVsCeKlXMG1isQfFJSC9hwm9joEbkv5HkZ09bZz5aRQAvIBQ0GOS0nLmlWkUyYOBmO5uUzBw+ZpQ7UvP2GyxPTEY9b/Q4P/80zBdZrb4FFQ0YnHrHWHso34AbBa7korsve9QjdL45aBk5xp3nXGtzDANTGNfsUrCSp2i2EO+3Ub3fiV93eun6lx8khU+Wxac+vlPEhTzyNCgukO2LHMnQk/6ZoU4hM53+cy6W0SQU30Oii1WACxAsnEFuhGmKxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSq0NZmxvBCKts1XtcwpXIE078eEUbe1goYAV1VZhBA=;
 b=Z0Mpf29aGcr9tJvpTiGJzUBNMmYhodC555LxNqVyKDsEGnxJuM5LJsNAFvzNhFaBtGEF3Vuoe+AxTw6LCZj3LtGFZqzySGi2bjA6O1NamMSlL/x2zzPIARqQgHJeEO5vVOEebBZox1Bpk6Ke4t7YqC3og8uiFNl3EnXbP5lIbzjbFfgOe3CTEmXxKyf1hQ8W3iVWvs+KOKiOcAldCLEzjau3PB0AYa3qFFqopwPuoqa3nknWsPIeDzhxE+G07jecAMi+Hhn+V3D+O1HP0MqqaC9KcZ2+wVHubpMT9t3B+1YOO7F4M5H46iIy35uyNiQdP2QeiyJTou1XkbcwUekXVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSq0NZmxvBCKts1XtcwpXIE078eEUbe1goYAV1VZhBA=;
 b=9HK9LRoyust42/6wxjVBncfDNjy5vyH5sCMe94OcXfY7CR65uNjEUo+ZmQV0KrRPbPs/XATjvNG9HYYl+2WbNlxCjo9mYAcxxyKZkiJx9DnneElxaQ4rvozw3NoTFfDjm2yWj3ebJxh9Z63JIkFDf/L404m5MBQP8+2KR2u7aIk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 1/2] xen/misra: add diff-report.py tool
Thread-Topic: [PATCH 1/2] xen/misra: add diff-report.py tool
Thread-Index: AQHZfpRaHhveqUOI3U+Goaz/TE5FAK9dwC0AgACdVYA=
Date: Wed, 17 May 2023 10:50:14 +0000
Message-ID: <9A9ABE94-957D-4E95-934F-3D09C58CF742@arm.com>
References: <20230504142523.2989306-1-luca.fancellu@arm.com>
 <20230504142523.2989306-2-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2305161826460.128889@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2305161826460.128889@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DBAPR08MB5846:EE_|AM7EUR03FT016:EE_|AS2PR08MB10265:EE_
X-MS-Office365-Filtering-Correlation-Id: 93db34f0-e0a1-4fda-6710-08db56c48453
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8HdLWY/68DGmVCHAuLQ/3RuT+FBoN0n232pL7EENEsB6hHtdrezBiOa3UBcORWKi7+hoGUTpHwz+2G9SgAXENFwdI2VxJVq+aCPkdRd/w9sLhxaqIBW0F2UFzu3DwZwGqqLqQRebNOdhLn9PJHPp+dvFDFNsgGNfiFbp8CLS6y/gJ/iSQM/9bs5ELgcvRbSmbjTnJ8l1I8goDRsI/rO6UfLRtdz2LkdtBpkXCufH7asoh1MXVTW+tqn76BBH7GPN+oRJ/OyDhNUo/pnDYpQyoHXo+C8rfQxczlKg7+7qDi84VLygGM1ZDZH1VM46gIJNLR5YOtxa1OQ+RTwUaiJ5JrvCiMJCkb4bwLxEAxzVSJS7QrbpZHCQU4WRn5aCPLOt7DwjMC6hnf5S9nsYYknh/tEfOAsheUnPozd7LszDtGup61n2FVkGyNfQj+zUO3cIN5Uj/vNP9iJa3xwePgxiVWOZfC/Qayfunhz4oTE1Tdq30VAKuDIpYNYZaXq/VyAF6bjv3EVcTC1FotmouWpqqm0dCyrzcxrZ00VVRXkMIHfk+dhS2WdQrGXJZ56+9Q2DvvSiKhkuvnYn5sJgyICnbjxELjyJ5HEkzLL/IBuONzCMKs/mSOJDBjVc8PyTDUQYZrhrUhU6vox7/DgAGHsMFw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(451199021)(91956017)(478600001)(6486002)(71200400001)(54906003)(2616005)(53546011)(6512007)(6506007)(26005)(186003)(2906002)(4744005)(8936002)(8676002)(5660300002)(36756003)(122000001)(33656002)(41300700001)(6916009)(38100700002)(4326008)(66476007)(66556008)(66946007)(66446008)(64756008)(76116006)(86362001)(316002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3C4464FD16DCC649827C156E51E1A03E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5846
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	481de357-04eb-4c14-c011-08db56c47ec4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DxNKD92tAiMyfJHmJH64V/qlwCk9pVDgUzt/iexXuszis7krfmYawDW/m/Vqvsb/L8p67HtfuPtg01Dc/kUVhY4KrH2b625rHkdw5NPceyk4HKcDCtkhCWrs8KSrfEahNcVueTxZpniIaxP01x4LQ0M8BRzJIfOrb4zfnfKdZgr1MgOxGqJ5yo1m8r7Qe2A8RHwLtouKjMMieXzDXYkA8BsmFDjoUop1o958Dc3vzJN2rNVyra+gWwWx2P8Y3ieW4sUtKVRFW4xUHFncn5w9xUhM5FCgvuNwaEpjZaxkp1Gluvt37HcujFPiJ/1BkKPD92gnKbHLc/8sDwqzfUv/QTPBw48VXSIeYDULO54chl+18vIQ+3qIg3tbpAZhsbv3i6eT0G7fU19WJf2EKlheNCo0iib99syJVxHU3ntA6kEjnI5xdoH/DE0285i2q8gKOOqe+dvuqjxVYgCFtW9iLHkGzDWRf/aquU2GSZQt7xEaitk5OSoNCnq+PTK+yH6IYspUBuIH3E3dF0II+TaWs+jqq2KD4OsHwYnHqI5SpgE4IQwxa09IeL7I7xkoRWei+JX4AGoC27dej01QrkYRs4DBQlDAs+z0GTMmC0zaNlAniQzOlkYqEeJqdl4CEe6RYeDGlufQtVKNIXxTYbIWVRFRCTT6BdLy5fECYQhbzVEnhjs2KMJmz8ot3aq4PDfoiFBe+95gCa786pSH5cJCabkYrMZO0d0NCCX8mpgoDnJ+UeIhgTnJNJVcxcJlI4Ix
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199021)(46966006)(36840700001)(40470700004)(316002)(8936002)(8676002)(6862004)(5660300002)(336012)(82310400005)(47076005)(53546011)(86362001)(6506007)(356005)(6512007)(186003)(81166007)(2616005)(36860700001)(26005)(82740400003)(40460700003)(41300700001)(6486002)(54906003)(33656002)(40480700001)(70206006)(70586007)(478600001)(36756003)(4326008)(4744005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 10:50:23.6225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93db34f0-e0a1-4fda-6710-08db56c48453
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10265



> On 17 May 2023, at 02:26, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Thu, 4 May 2023, Luca Fancellu wrote:
>> Add a new tool, diff-report.py that can be used to make diff between
>> reports generated by xen-analysis.py tool.
>> Currently this tool supports the Xen cppcheck text report format in
>> its operations.
>>=20
>> The tool prints every finding that is in the report passed with -r
>> (check report) which is not in the report passed with -b (baseline).
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>=20
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>

Thank you Stefano for taking the time to review and test it, I will push
the new version of the serie with the stale functions removed and I will
add your A-by and T-by.

Cheers,
Luca



