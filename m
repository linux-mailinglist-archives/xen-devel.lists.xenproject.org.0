Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3177C7D43AD
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 02:09:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621647.968319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qv4yh-00035z-Lv; Tue, 24 Oct 2023 00:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621647.968319; Tue, 24 Oct 2023 00:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qv4yh-000345-J9; Tue, 24 Oct 2023 00:08:59 +0000
Received: by outflank-mailman (input) for mailman id 621647;
 Tue, 24 Oct 2023 00:08:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vYl/=GG=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qv4yf-00033z-K2
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 00:08:57 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2040.outbound.protection.outlook.com [40.107.13.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84839ffc-7201-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 02:08:54 +0200 (CEST)
Received: from AS9PR06CA0620.eurprd06.prod.outlook.com (2603:10a6:20b:46e::18)
 by AS4PR08MB8143.eurprd08.prod.outlook.com (2603:10a6:20b:58e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.29; Tue, 24 Oct
 2023 00:08:23 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:20b:46e:cafe::e) by AS9PR06CA0620.outlook.office365.com
 (2603:10a6:20b:46e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.34 via Frontend
 Transport; Tue, 24 Oct 2023 00:08:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.15 via Frontend Transport; Tue, 24 Oct 2023 00:08:23 +0000
Received: ("Tessian outbound 028b72acc2da:v215");
 Tue, 24 Oct 2023 00:08:23 +0000
Received: from 3d3a02004033.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2265D6E5-BA3A-4681-87B0-4EC741619B2B.1; 
 Tue, 24 Oct 2023 00:08:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3d3a02004033.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Oct 2023 00:08:12 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB7899.eurprd08.prod.outlook.com (2603:10a6:150:5e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 00:08:07 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9%4]) with mapi id 15.20.6907.030; Tue, 24 Oct 2023
 00:08:06 +0000
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
X-Inumbo-ID: 84839ffc-7201-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qtt2Ym8yYpbLcf+MBHn9KIKgNN6/ijo6Sx1q9WHR1Xg=;
 b=XbnmNHZQ35HIf85kyIIadjqj0Nt/k4TDu4i43pdTrbzR/3/91+0XdEXoQVvN2xHAkekxxOJlcBWBtgC0vFptcs79JkZKCMcHPdvrOUusGT2VQKcNe7khCvkgHKagpKx00LpKNH5+CAk/f+Lm34L33HNtr0EkJ3Ox3/Pcw6f+DWk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: defb67429599c558
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsK+b+bVL8cJaoLFYc55HH4Uyk3P5Kp2K+PuGZXCkdV7Ilz6AFqS45e+00/6fUGCMhr4ZQKHi2zPndFqf5unzWy2LDyPjwG9CQhxMx0eGjB/KuBgRjskbfbG0kkD0q31pUi3FOZGAPZ0GjTVu7tHJRLTz/OMUv/051v0zNyzICqxQJF1RfICyEPdiZTzjdgfpC8X0tQbmKn+1nafGN4PDcktmX8okAFQRclawrfDLT2PQn0ahsx8/JDGxFnETT+2jYowVk3lK9t+YEt1fBrBk0jKEMa48kUay01jGjEhyi4DqVAXSwnSqWQayLO+yC95srjL6eETL0QV7pW9UmiZyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qtt2Ym8yYpbLcf+MBHn9KIKgNN6/ijo6Sx1q9WHR1Xg=;
 b=SRbQrOg8ERmQovio0vbL6A9692VXH4fNqkWfol/sXA4Cyu/eS5EdO1xSnKf6j/WlzEhpL8uaYPTBuxzW1GkaAs1g/h7reRuD/t9DN3V5lB5GVOnzNGIuaKKwWpu1o3ksEPg5agz+pLqatRmdijgC68wWhwYO3z0PARyQJ++S80y1nOu7Y7KNXw9T3m27DRadlGlyNk/7uFVGKm1XSWbt3fd/HrAVMSG6CUUjh4dopeqHQf3/RjPWsaRqqzprRO2aGmyL/HuuZ8geOhHvMjm30EwxBih3al3SVag7qGjS7fHqssMesepo+ZngPZWvY+kVrH+HqkxyDpSuD7q+F3S0ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qtt2Ym8yYpbLcf+MBHn9KIKgNN6/ijo6Sx1q9WHR1Xg=;
 b=XbnmNHZQ35HIf85kyIIadjqj0Nt/k4TDu4i43pdTrbzR/3/91+0XdEXoQVvN2xHAkekxxOJlcBWBtgC0vFptcs79JkZKCMcHPdvrOUusGT2VQKcNe7khCvkgHKagpKx00LpKNH5+CAk/f+Lm34L33HNtr0EkJ3Ox3/Pcw6f+DWk=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] MAINTAINERS: make Michal Orzel ARM Maintainer
Thread-Topic: [PATCH] MAINTAINERS: make Michal Orzel ARM Maintainer
Thread-Index: AQHaBfOEiTnKVfFBkkm1wAY7kpk1UrBYEF+A
Date: Tue, 24 Oct 2023 00:08:05 +0000
Message-ID: <DBF0F3A9-9B99-4C9C-806D-E463255A2640@arm.com>
References:
 <alpine.DEB.2.22.394.2310231356210.3516@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310231356210.3516@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB7899:EE_|AMS0EPF000001A2:EE_|AS4PR08MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: edc7512c-3fde-4ad0-7a50-08dbd425569c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eHsfh14fmSSCEi71ExoQaVwpS1GyB85yC+yT3L1Ob40a8yF/rWXYXHFC6QgiFFXvz7IuFlgtJgdofJC9B+pLmiLqiG/VQLDOOYqhWoJKPQhsHJ4qcgUcaDrfE1bFmzPga6EyNSW+7CsnWwo58Cu7DDfEicjdc1822H4893Bj/8s4zMwmmkf5J3FHfR5JkM9BQkYnI/hktGR36hLQ/YGXVBJBpGX3HMsrXl1F/kc3R3Qpwa7bneH3A/YQfsHeqvWPioqe/NqA8w7Z4esBNHlbq10b4hw7wvDjfelulxexV8Vup3be/BlrVr3H/LSigSwIX53v9Buj9m5+M5ROUmHpGIH+8wFUxmrnJjtrrQAe+ACAyPux9an9SRyxqgnrJtUzPhkHISe2b+g0ZZQqEVDjTc1lGK8ed5Y62EYH5sQ/zznkTbz1SwgPwXbi+0kG8CleYlhQ/snfzHg58AJ2JQcGBQayr9vUpvuj4BsfwDtSL4GLu1Aq7WEBx12QNTRhB7603U5+CtHjp7Gm+ZSKehfrOLaUicpFsIRHlnxtVh4681CDMq9yXqEP1Xpv/dqOWJn6+3WtGsoTlyQvohk1luSaV2tUTzx3xokmuDct7p2ufQlWOV9XM2EDH5w6hhuPu8651B+PGEmhqwhdQLwuXbhDCQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(366004)(346002)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(38070700009)(26005)(38100700002)(41300700001)(2906002)(4744005)(86362001)(36756003)(5660300002)(8676002)(8936002)(4326008)(33656002)(6506007)(2616005)(478600001)(91956017)(71200400001)(66556008)(66946007)(122000001)(66476007)(54906003)(6916009)(76116006)(316002)(66446008)(64756008)(6486002)(6512007)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B4C7A7AA8EFC614FA863E428EA859BEA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7899
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2693afce-fd21-4710-0228-08dbd4254c18
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SlwIqsyJIGdtY/kodJREm4J9XIuHZ4OFmuiYW/Z7cFv7mM4xkRcazQPLzmdVywUseVM5ojV3s/vnRADjQeMI7vtO4ym89138xT9h8dUaZO2ho0nCNl5nC9gj/BN7U8HEfsQGqZMNLr/mrp+swtePBvqDk3xWvWww9e3ezihD3+hTA2mb+gYgwH5YNBn2w5Ee04u6gFXMF8LilAfBMHa6Tgv2nWYqmhKG4V09m9ZIyRDcom4KiANznsqMNK45YnXihCH4bFbXGnsil/B5oko6eDRazbNI04QmTARK/IG8ok8ElK4eQRh0slIVlMMmkKTbxBcqOxAUktoV9OK421Xn7xRmi/v7LyxZSja3Vyu4U3SGvYbSj1DNphrcGaGLWjuFZCf+PiQZ3Y5kDleuJ4zpxgO5eFKG8vqDHBv1uKDRl99/JnflPMXcXryBJWfEGyEMfO6I7CbibxKi4i08hh35Dbawqs77m+97ONGdF56kEpreC/65M6G4pmUkysKSSzKfWKG78nzGbB8O9A9hFa+8dcsoZ/3gv+08s6heAcJDDiFLhArVQB4WFdyS0YaSb699pULCrFlC7ydN5FNL1oFitP+Q7hHJLRNIw9/L/+3mfcVhgAPpE393MnnNKmtBDr5uiz+5FrvbNrEZPM7m8xzX1iCMo9OZhYAOtV1Nr91X49J3LZNmn8CsZg1JzabTLiG0WavvXt9uqdypyBu3mAQxj+iB00tyZoPSbv2AirnqEeW8TOTxtakE/j/kINa1rMf7
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(82310400011)(36840700001)(40470700004)(46966006)(4744005)(41300700001)(2906002)(54906003)(81166007)(70206006)(53546011)(82740400003)(316002)(107886003)(70586007)(478600001)(6506007)(336012)(40480700001)(6486002)(6512007)(47076005)(36860700001)(40460700003)(5660300002)(86362001)(6862004)(4326008)(33656002)(2616005)(36756003)(8936002)(8676002)(356005)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 00:08:23.4562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edc7512c-3fde-4ad0-7a50-08dbd425569c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8143

Hi Stefano,

> On Oct 24, 2023, at 04:56, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

I saw I was CCed so:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

> ---
> MAINTAINERS | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f61b5a32a1..a5a5f2bffb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -246,6 +246,7 @@ ARM (W/ VIRTUALISATION EXTENSIONS) ARCHITECTURE
> M: Stefano Stabellini <sstabellini@kernel.org>
> M: Julien Grall <julien@xen.org>
> M: Bertrand Marquis <bertrand.marquis@arm.com>
> +M: Michal Orzel <michal.orzel@amd.com>
> R: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> S: Supported
> L: xen-devel@lists.xenproject.org
> --=20
> 2.25.1
>=20


