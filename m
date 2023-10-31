Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B82A7DD08F
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 16:33:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625904.975677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxqjd-0004pi-6q; Tue, 31 Oct 2023 15:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625904.975677; Tue, 31 Oct 2023 15:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxqjd-0004nC-3r; Tue, 31 Oct 2023 15:32:53 +0000
Received: by outflank-mailman (input) for mailman id 625904;
 Tue, 31 Oct 2023 15:32:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1/u=GN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qxqjb-0004n6-OQ
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 15:32:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7d00::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf5836d9-7802-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 16:32:49 +0100 (CET)
Received: from AS9PR05CA0233.eurprd05.prod.outlook.com (2603:10a6:20b:494::27)
 by AS8PR08MB8248.eurprd08.prod.outlook.com (2603:10a6:20b:520::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 15:32:44 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:494:cafe::59) by AS9PR05CA0233.outlook.office365.com
 (2603:10a6:20b:494::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27 via Frontend
 Transport; Tue, 31 Oct 2023 15:32:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Tue, 31 Oct 2023 15:32:44 +0000
Received: ("Tessian outbound 26ee1d40577c:v228");
 Tue, 31 Oct 2023 15:32:43 +0000
Received: from 55805f4701a4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6C2BA6EA-8C58-4406-81AB-88DEBBF428EB.1; 
 Tue, 31 Oct 2023 15:32:06 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 55805f4701a4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Oct 2023 15:32:06 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAWPR08MB9123.eurprd08.prod.outlook.com (2603:10a6:102:343::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Tue, 31 Oct
 2023 15:32:04 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866%3]) with mapi id 15.20.6933.022; Tue, 31 Oct 2023
 15:32:04 +0000
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
X-Inumbo-ID: bf5836d9-7802-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MdmZTs8AQcPK43aBmBOP8ELjMC0e+TbK6s90qrFsUX0DQSAbW5EM8nrXB7nQf7bDgSP0uBk+omyIZLI2PKEZ8E8njxn781IUOV+LJD2N8ercOIMpdwujVIUfgOY4TwlSPFfClWp2AJpHCDmwPpERca5GvkYPYObodMid7a0jDnK9WA2sCiL+VJbpSM/DldDBcN625+dgZu8xakn9UKy+DI7m1VEuA+Q1exHenTBK8sgRDugL+sgkalplbqtOcRiOwGit6cilp/41PWhJSAbt3XyE9U0Vmn2NS7i6he5ZdzTd/szs0ene8lzHqZI08Z9p7SpLYzhKq6O96tFo6XkjRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZzbHOT2qCzMwKZUwrYP3dtWMS6I52qgRrM4GzH4grA=;
 b=lR6EXqplKhu7sB2A5Tjk3BsDcaU3iYt/hzCYv+OOHNUlSayUMNjEG2/fEJS+O32ymXCf+/tjGnyuGMgtqE9OUErWwFlxFyurykXRa3iQ7SzJbKEab/s9bI8UiTFfrSCQYPvU8Xb13GOfz3nDEmParbioa0BTgHWfqbXEQF2nGpf+I66JS7yTqAYX/9PaK5s2eJ5GYo33ytGR3oJy7hSeGdDm6IhbGbbNzSuLGXXquL7K+Cs4QWWdY6Bj1hppuO83zwQogeGhjRujsHNvpAbTjjgeEU3WGlUMQYg3+JlCfenxsD6RSAYcGMTzNfEtEj+Ehft6A4u3NiPR1dwmArXQLA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZzbHOT2qCzMwKZUwrYP3dtWMS6I52qgRrM4GzH4grA=;
 b=2vu0mPkC7GdSeH0SbHboE0/2gmcrIRLKefj+B07LeMkVRf6r2bAXoYAPdmqqGDu53GA+xYHCX6xH4nI7kHelU3eFk38r98g9JnF8Lh5b9smVI8uS/CEcc/1iz7yIqLBMTEw6E3EQVwnbnW+cHRQfqmrW9CE6VeO5xKqClQnGpP8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: dfee45a71f157df6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uwnv5f7g7jZsalwOzTaxS5udRS6CO8FDexsHTumVPPSaG/aXdQf+W4rs1i3EcKxw4hDFLWTPBNnV6dECIUnW5dj1qDYRx3rdmPDO9ujxp+0kNE+944GUJSD1B7mx+BIfCNFh497eWTd/Rtk27/scad9LooPO8xlZvI3EgFtKoWaLnzdeU4zneUzMcvXANjkRj22E26QrqyS82W7UfE2tvj3GBP40Nb0yYPgT+e4MVPYK4MxITaMoMPeyaAERzYHvhoQD5AlJMwcnrmVTz3Ckvk7+OE68g0CWKy7PVLjVVY2/lG1tgS8hLV0i/LJqU81kgY27J9y86qyIxvCR7hdciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZzbHOT2qCzMwKZUwrYP3dtWMS6I52qgRrM4GzH4grA=;
 b=bBfqqFEs5eVJdNH78OZ4uNwcAjXYx/M90udsw8Bspzx98S3DWSSaXPtybeyU/tV+SsQUU3auUAuTmi4pnds4n3xBPFsoBDd7O7tbiyBJAHwLEv6FK2etj2UrRV2ze99o+0p73+QXReEx3HuyFfdEhYDQseqMpFajfZM04SoyXL2/WkQQCXTbw095PhOJ3kfStQj6Pdvl/4fAxv0ad1ojhfmx7sPR15VzeZT7peHyUlH+J05qvKb/oYrGbnsiiVPJhDZzRU1HFOxLTV6VcIfI/VOQS3vWCtvgNJuqpsCi8c+Z8W/86TiJ4ObsO+zCZCTxIssJCLQDIw7idW+MgwrGkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZzbHOT2qCzMwKZUwrYP3dtWMS6I52qgRrM4GzH4grA=;
 b=2vu0mPkC7GdSeH0SbHboE0/2gmcrIRLKefj+B07LeMkVRf6r2bAXoYAPdmqqGDu53GA+xYHCX6xH4nI7kHelU3eFk38r98g9JnF8Lh5b9smVI8uS/CEcc/1iz7yIqLBMTEw6E3EQVwnbnW+cHRQfqmrW9CE6VeO5xKqClQnGpP8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, "xenia.ragiadakou@amd.com"
	<xenia.ragiadakou@amd.com>, "ayan.kumar.halder@amd.com"
	<ayan.kumar.halder@amd.com>, "consulting@bugseng.com"
	<consulting@bugseng.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, Simone Ballarin
	<simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v5] xen: Add deviations for MISRA C:2012
 Rule 7.1
Thread-Topic: [XEN PATCH][for-4.19 v5] xen: Add deviations for MISRA C:2012
 Rule 7.1
Thread-Index: AQHaC/4b2xNoaiIkmUiyfHAuabY8yrBj8OgAgAAP5gCAAACVgIAABCCAgAABQIA=
Date: Tue, 31 Oct 2023 15:32:04 +0000
Message-ID: <F121A82D-3D86-4923-9E6E-C520F57E8DAA@arm.com>
References:
 <0c86b50a796ba2aaab01e30935ed559ab719d33a.1698418578.git.nicola.vetrini@bugseng.com>
 <98da41d4-f818-44c7-bd3c-b3e3b224ff0d@xen.org>
 <alpine.DEB.2.22.394.2310301544460.1625118@ubuntu-linux-20-04-desktop>
 <ee3c415d-bedd-432e-bf31-6e806b9cf976@xen.org>
 <DFC25ACE-FFBE-43CF-9CE2-90671D122CEC@arm.com>
 <2201cad3353f5deb567f929e91e90fd2@bugseng.com>
 <E0FA2717-D06B-4C51-9E9A-DBD72CE35963@arm.com>
 <e958d555-3075-467b-b3cf-1e5c6ad78405@xen.org>
In-Reply-To: <e958d555-3075-467b-b3cf-1e5c6ad78405@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAWPR08MB9123:EE_|AMS0EPF000001A5:EE_|AS8PR08MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: bef68dcd-2e5f-4d68-2b46-08dbda26a0b5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2pxD8lLcU5v231NMXf6hOxCsylCXg4XD4zf0TksIvwT/e4vy2xcGEkKmFC/kuj3NurqEWlOQc1vGqEg3fiUawEULH1p7DB4+m8ak+hvjuTtDHl+HReqrJiVvgVHOdYGUKSHAyE4Ts2uiCUzknkorox1+PJwcR5F+rizMl7W7jPCg5XC5+eZcKk1NmuFZy2hiexVzixMSbJShja019ERO2pQntlC+46aPs35jkrdPfDwpuhNPts7EeI9GU4N2XHSG4FVrbqwPGaV96NoSQ6BP/c4/FWsGPMoK1vjTA5E3cSRS5Nn+aX/VGs3CHViEc5oOLT4pG7G1hY58+yjNUMKG+Ns9ebgqdc/fFVVM0G8GGjPjEUTpKoktLT10VrfaMcsgVQm5K2GuOs61IuzoMkkAn4eS587D1v3n4p576gDf9wWKI8j6z0kTHAuPVWQNhU4JWKqy2XhBiT5R5azi1QjxczTLkRcBwpo5CBM+zyIVkUapCftGo9wBoXY8WIPwdlRfmbfXDuZWrJ/dGHxHTyC676ApUGZauqvw//9oB+/+Sl742JC+AKgKhxRTp6lTODwOUQGpEP6/VwzX232cuDNyibZFOUCXV1dwOOos3sQ0TC3HxHLNfiSUYvtj1k0YHSR5
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(396003)(366004)(376002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(8676002)(76116006)(54906003)(64756008)(66946007)(2906002)(66446008)(6916009)(66476007)(91956017)(316002)(66556008)(5660300002)(7416002)(6486002)(966005)(4001150100001)(478600001)(41300700001)(8936002)(4326008)(71200400001)(53546011)(6512007)(2616005)(6506007)(26005)(83380400001)(38070700009)(122000001)(36756003)(33656002)(86362001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9E81E895449194BB317CE401D2BD670@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9123
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e3a2055f-d5f7-42fd-9e72-08dbda2688cd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4InQVTapQJf446IN4KsmRiKfngWynweux7kNXMcOo0+bp7+UNqIwEEWglK8Yxt99IU1lvTDjF8CWAm5ttdHkCRNHVDhsDF4XMhkSITRFoS5Z+i5wqgjrDZFUFQj6hbxjKygl8cm+nt2rHCXBP2RjIp9Dte5j+hxCdSn7bdmNvc6PKDS2JEaqbw0XFNimN0KzBJ21I4wN6655VKqtO5cZ9Ul7ZuGo6uSeVZ8vnpDp5TJfkMO+qG+qSr7+PADTAMZWR/snKEYdocYKfXtsacSO6xkWYrhJbOS7NJo7YkiNnk2ldcNHJX61f3wTlYbqVdNrn8gDzr3XBnVUx4At2lSjZHwBEfWmVqN7TkP9/3F4mpAiM+lgrNrzMw85fpmTZMXebqpGEPUdff2UsVRVR2cQrosacx4Ug2mqxWJEY/LL5tGQBTa00iS3M5qWVDBamZngwZD9njRsVm09pTJdpssx1ZKK7CAj7bZcNcrUYffc/2NmgfiFBKRjl8Hh3cPwLCGRmNpFizt7AqQgvlYbyCn54KY90IiN0rgOR3LpjMb2+6MOjzI+sKl2xMZf4FG8ztsFIVe+j+1r0OPQ/Gd74FDMk4VkvDpd5vYJ+2/DOTna6Vkasw2HlwHhnQuS2yRvMmXlPr1cHlM2QFqUuTiC7TO2QojEepqqfg/clTRbwXPc2IkGVaoRSCYo7T3fp/C1e8Jc9E2OkLoIQCOUTFnqc2WqIp1v3uRIuhnXYCoC9vzCkw8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(82310400011)(1800799009)(64100799003)(451199024)(186009)(46966006)(40470700004)(36840700001)(41300700001)(316002)(54906003)(8936002)(8676002)(6862004)(70206006)(70586007)(5660300002)(4326008)(40480700001)(40460700003)(82740400003)(81166007)(356005)(47076005)(83380400001)(478600001)(2906002)(966005)(6486002)(26005)(53546011)(6506007)(36756003)(336012)(33656002)(6512007)(2616005)(86362001)(36860700001)(4001150100001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 15:32:44.2272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bef68dcd-2e5f-4d68-2b46-08dbda26a0b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8248

DQoNCj4gT24gMzEgT2N0IDIwMjMsIGF0IDE1OjI3LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMzEvMTAvMjAyMyAxNToxMiwgTHVjYSBG
YW5jZWxsdSB3cm90ZToNCj4+PiBPbiAzMSBPY3QgMjAyMywgYXQgMTU6MTAsIE5pY29sYSBWZXRy
aW5pIDxuaWNvbGEudmV0cmluaUBidWdzZW5nLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gMjAy
My0xMC0zMSAxNToxMywgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4+IE9uIDMxIE9jdCAyMDIz
LCBhdCAxMzoyNywgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+PiBI
aSBTdGVmYW5vLA0KPj4+Pj4gT24gMzAvMTAvMjAyMyAyMjo0OSwgU3RlZmFubyBTdGFiZWxsaW5p
IHdyb3RlOg0KPj4+Pj4+IE9uIE1vbiwgMzAgT2N0IDIwMjMsIEp1bGllbiBHcmFsbCB3cm90ZToN
Cj4+Pj4+Pj4gSGkgTmljb2xhLA0KPj4+Pj4+PiBPbiAyNy8xMC8yMDIzIDE2OjExLCBOaWNvbGEg
VmV0cmluaSB3cm90ZToNCj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kb2NzL21pc3JhL2RldmlhdGlv
bnMucnN0IGIvZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdA0KPj4+Pj4+Pj4gaW5kZXggODUxMWEx
ODkyNTNiLi44YWFhYTE0NzNmYjQgMTAwNjQ0DQo+Pj4+Pj4+PiAtLS0gYS9kb2NzL21pc3JhL2Rl
dmlhdGlvbnMucnN0DQo+Pj4+Pj4+PiArKysgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+
Pj4+Pj4+PiBAQCAtOTAsNiArOTAsMTMgQEAgRGV2aWF0aW9ucyByZWxhdGVkIHRvIE1JU1JBIEM6
MjAxMiBSdWxlczoNCj4+Pj4+Pj4+ICAgICAgICAgICAtIF9fZW11bGF0ZV8yb3AgYW5kIF9fZW11
bGF0ZV8yb3Bfbm9ieXRlDQo+Pj4+Pj4+PiAgICAgICAgICAgLSByZWFkX2RlYnVncmVnIGFuZCB3
cml0ZV9kZWJ1Z3JlZw0KPj4+Pj4+Pj4gICsgICAqIC0gUjcuMQ0KPj4+Pj4+Pj4gKyAgICAgLSBJ
dCBpcyBzYWZlIHRvIHVzZSBjZXJ0YWluIG9jdGFsIGNvbnN0YW50cyB0aGUgd2F5IHRoZXkgYXJl
IGRlZmluZWQNCj4+Pj4+Pj4+ICsgICAgICAgaW4gc3BlY2lmaWNhdGlvbnMsIG1hbnVhbHMsIGFu
ZCBhbGdvcml0aG0gZGVzY3JpcHRpb25zLiBTdWNoIHBsYWNlcw0KPj4+Pj4+Pj4gKyAgICAgICBh
cmUgbWFya2VkIHNhZmUgd2l0aCBhIC9cKiBvY3RhbC1vayBcKi8gaW4tY29kZSBjb21tZW50LCBv
ciB3aXRoIGENCj4+Pj4+Pj4+IFNBRg0KPj4+Pj4+Pj4gKyAgICAgICBjb21tZW50IChzZWUgc2Fm
ZS5qc29uKS4NCj4+Pj4+Pj4gUmVhZGluZyB0aGlzLCBpdCBpcyB1bmNsZWFyIHRvIG1lIHdoeSB3
ZSBoYXZlIHR3byB3YXlzIHRvIGRldmlhdGUgdGhlIHJ1bGUNCj4+Pj4+Pj4gcjcuMS4gQW5kIG1v
cmUgaW1wb3J0YW50ZWx5LCBob3cgd291bGQgdGhlIGRldmVsb3BwZXIgZGVjaWRlIHdoaWNoIG9u
ZSB0byB1c2U/DQo+Pj4+Pj4gSSBhZ3JlZSB3aXRoIHlvdSBvbiB0aGlzIGFuZCB3ZSB3ZXJlIGRp
c2N1c3NpbmcgdGhpcyB0b3BpYyBqdXN0IHRoaXMNCj4+Pj4+PiBtb3JuaW5nIGluIHRoZSBGVVNB
IGNvbW11bml0eSBjYWxsLiBJIHRoaW5rIHdlIG5lZWQgYSB3YXkgdG8gZG8gdGhpcw0KPj4+Pj4+
IHdpdGggdGhlIFNBRiBmcmFtZXdvcms6DQo+Pj4+Pj4gaWYgKHNvbWUgY29kZSB3aXRoIHZpb2xh
dGlvbikgLyogU0FGLXh4LXNhZmUgKi8NCj4+Pj4+PiBUaGlzIGRvZXNuJ3Qgd29yayB0b2RheSB1
bmZvcnR1bmF0ZWx5LiBJdCBjYW4gb25seSBiZSBkb25lIHRoaXMgd2F5Og0KPj4+Pj4+IC8qIFNB
Ri14eC1zYWZlICovDQo+Pj4+Pj4gaWYgKHNvbWUgY29kZSB3aXRoIHZpb2xhdGlvbikNCj4+Pj4+
PiBXaGljaCBpcyBub3QgYWx3YXlzIGRlc2lyYWJsZS4gb2N0YWwtb2sgaXMganVzdCBhbiBhZC1o
b2Mgc29sdXRpb24gZm9yDQo+Pj4+Pj4gb25lIHNwZWNpZmljIHZpb2xhdGlvbiBidXQgd2UgbmVl
ZCBhIGdlbmVyaWMgd2F5IHRvIGRvIHRoaXMuIEx1Y2EgaXMNCj4+Pj4+PiBpbnZlc3RpZ2F0aW5n
IHBvc3NpYmxlIHdheXMgdG8gc3VwcG9ydCB0aGUgcHJldmlvdXMgZm9ybWF0IGluIFNBRi4NCj4+
Pj4+IFdoeSBjYW4ndCB3ZSB1c2Ugb2N0YWwtb2sgZXZlcnl3aGVyZSBmb3Igbm93PyBNeSBwb2lu
dCBoZXJlIGlzIHRvIG1ha2Ugc2ltcGxlIGZvciB0aGUgZGV2ZWxvcHBlciB0byBrbm93IHdoYXQg
dG8gdXNlLg0KPj4+Pj4+IEkgdGhpbmsgd2Ugc2hvdWxkIHRha2UgdGhpcyBwYXRjaCBmb3Igbm93
IGFuZCBoYXJtb25pemUgaXQgb25jZSBTQUYgaXMNCj4+Pj4+PiBpbXByb3ZlZC4NCj4+Pj4+IFRo
ZSBkZXNjcmlwdGlvbiBvZiB0aGUgZGV2aWF0aW9uIG5lZWRzIHNvbWUgaW1wcm92ZW1lbnQuIFRv
IGdpdmUgYW4gZXhhbXBsZSwgd2l0aCB0aGUgY3VycmVudCB3b3JkaW5nLCBvbmUgY291bGQgdGhl
eSBjYW4gdXNlIG9jdGFsLW9rIGV2ZXJ5d2hlcmUuIEJ1dCBhYm92ZSwgeW91IGFyZSBpbXBseWlu
ZyB0aGF0IFNBRi14eC1zYWZlIHNob3VsZCBiZQ0KPj4+Pj4gcHJlZmVycmVkLg0KPj4+Pj4gSSB3
b3VsZCBzdGlsbCBzdHJvbmdseSBwcmVmZXIgaWYgd2UgdXNlIG9jdGFsLW9rIGV2ZXJ5d2hlcmUg
YmVjYXVzZSB0aGlzIGlzIHNpbXBsZSB0byByZW1lbWJlci4gQnV0IGlmIHRoZSBvdGhlciBhcmUg
aGFwcHkgdG8gaGF2ZSBib3RoIFNBRi1YWCBhbmQgb2N0YWwtb2ssIHRoZW4gdGhlIGRlc2NyaXB0
aW9uIG5lZWRzIHRvIGJlIGNvbXBsZXRlbHkgdW5hbWJpZ3VvdXMgYW5kIHRoZSBwYXRjaCBzaG91
bGQgY29udGFpbiBzb21lIGV4cGxhbmF0aW9uIHdoeSB3ZSBoYXZlIHR3byBkaWZmZXJlbnQgd2F5
cyB0byBkZXZpYXRlLg0KPj4+PiBXb3VsZCBpdCBiZSBvayB0byBoYXZlIGJvdGgsIGZvciBleGFt
cGxlOiAvKiBTQUYtWFgtc2FmZSBvY3RhbC1vayAqLw0KPj4+PiBTbyB0aGF0IHRoZSBzdXBwcmVz
c2lvbiBlbmdpbmUgZG8gd2hhdCBpdCBzaG91bGQgKGN1cnJlbnRseSBpdCBkb2VzbuKAmXQgc3Vw
cHJlc3MgdGhlIHNhbWUgbGluZSwgYnV0IHdlIGNvdWxkIGRvIHNvbWV0aGluZyBhYm91dCBpdCkg
YW5kIHRoZSBkZXZlbG9wZXINCj4+Pj4gaGFzIGEgd2F5IHRvIHVuZGVyc3RhbmQgd2hhdCBpcyB0
aGUgdmlvbGF0aW9uIGhlcmUgd2l0aG91dCBnb2luZyB0byB0aGUganVzdGlmaWNhdGlvbiBkYXRh
YmFzZS4NCj4+PiANCj4+PiBJIGd1ZXNzLiBJdCBjb3VsZCBvdmVyZmxvdyB0aGUgODAtY2hhciBs
aW1pdCBpbiB4ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uaCwgdGhvdWdoLg0KPj4gWWVhaCwgYnV0
IHdlIGNvdWxkIHJ1bGUgb3V0IHNvbWV0aGluZyBpbiBjb2RlX3N0eWxlIHRvIGFsbG93IG9ubHkg
dGhpcyBraW5kIG9mIHRyYWlsaW5nIGNvbW1lbnRzIHRvIGV4Y2VlZCB0aGUgODAgY2hhcnMNCj4g
DQo+IEluIHRoZSBwYXN0IEkgZXhwcmVzc2VkIGNvbmNlcm5lZCB3aXRoIHRoaXMga2luZCBvZiB0
aGUgcnVsZSBiZWNhdXNlIGl0IGlzIG5vdCBlbnRpcmVseSBjbGVhciBob3cgYW4gYXV0b21hdGlj
IGZvcm1hdHRlciB3aWxsIGJlIGFibGUgdG8gY2hlY2sgaXQuDQo+IA0KPiBDYW4geW91IGNsYXJp
Znkgd2hldGhlciBjbGFuZy1mb3JtYXQgd291bGQgYmUgYWJsZSB0byBoYW5kbGUgeW91ciBwcm9w
b3NlZCBydWxlPw0KDQpTbywgeWVzdGVyZGF5IEJlcnRyYW5kIHBvaW50ZWQgb3V0IGEgU3RhY2tP
dmVyZmxvdyB0aHJlYWQgZm9yIHRoaXMgaXNzdWUgYW5kIGlmIHdlIHVzZSBSZWZsb3dDb21tZW50
czogZmFsc2Ugd2Ugc2hvdWxkDQpiZSBhYmxlIHRvIGxldCB0aGUgbGluZSBhcyBpdCBpcyAobm90
IHRlc3RlZCkuDQoNCmh0dHBzOi8vY2xhbmcubGx2bS5vcmcvZG9jcy9DbGFuZ0Zvcm1hdFN0eWxl
T3B0aW9ucy5odG1sI3JlZmxvd2NvbW1lbnRzDQoNCg0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAt
LSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

