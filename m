Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FD957F83C
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 04:29:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374350.606387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFnqN-0001oK-JI; Mon, 25 Jul 2022 02:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374350.606387; Mon, 25 Jul 2022 02:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFnqN-0001lR-EU; Mon, 25 Jul 2022 02:29:15 +0000
Received: by outflank-mailman (input) for mailman id 374350;
 Mon, 25 Jul 2022 02:29:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oKoM=X6=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oFnqL-0001lL-T1
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 02:29:14 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10076.outbound.protection.outlook.com [40.107.1.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90e04bf8-0bc1-11ed-924f-1f966e50362f;
 Mon, 25 Jul 2022 04:29:10 +0200 (CEST)
Received: from DB8PR06CA0003.eurprd06.prod.outlook.com (2603:10a6:10:100::16)
 by AM0PR08MB3587.eurprd08.prod.outlook.com (2603:10a6:208:dd::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Mon, 25 Jul
 2022 02:29:08 +0000
Received: from DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::d1) by DB8PR06CA0003.outlook.office365.com
 (2603:10a6:10:100::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18 via Frontend
 Transport; Mon, 25 Jul 2022 02:29:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT004.mail.protection.outlook.com (100.127.142.103) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Mon, 25 Jul 2022 02:29:08 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Mon, 25 Jul 2022 02:29:08 +0000
Received: from aac1fafe8fa5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3F2ECD2C-CE9F-4069-B76F-2B7053D50ED5.1; 
 Mon, 25 Jul 2022 02:29:01 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aac1fafe8fa5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 25 Jul 2022 02:29:01 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS8PR08MB6839.eurprd08.prod.outlook.com (2603:10a6:20b:352::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 02:29:00 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%7]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 02:29:00 +0000
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
X-Inumbo-ID: 90e04bf8-0bc1-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LRDpEtbquqbKlZP6CJIrdW2BhesLKbM1i86l/Hzm5jej2LVUQ9v5FoSHn6KTlMb5X6x7ehF1IbtCH5xfJUPpONdlWgGi23l9iQ4zlKvjhgIBJOZ9XYO088/VkJwrqNXQI85KMVcfvdOHftmZtPeN/DmIuQWbHlkYzrFlnHbaOUs9tT9gQrIGjtGqcemUbAsuWUkr4vPJrrDqQWJ+gD+ugk+tajibajqY8cFqYIKK1Yhu76qnr06viDM36WD/ZEPboSGq+4X5pFGNVniMLV0RB2FDmYintSkD0VzaOIUVBDzWbi6oMwcjjNbKctwBcTkA3pSpaQn91Md9xT5zxR+0dA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLuCzy+cN/I3v4U/f4R0TTbIF/bAwTpA+wkmXDvyB98=;
 b=bIdSH680XTuglP2vxSVM4eOn7/NWln1xYzaEb7qnJgHgs1sl3xtsRuG3ApuQVxFYyCAruRda83NStorRBUBWZv+flbaYfr1gmnVa9HFJq88sOftR5PWs7GLpxZxOVk7Heggeb/6zrhT/yh4vcJsUZvknPRVaNjQ3JtKhRGk7keyCFNrn/QsEcinlbvL3dnS87qf6L7j2M5caIgbRfyG4foJ70goTF1KBBBczQayVxACbH1fDRVDh8gGcZBKSzTZjDV6ofIyHAkLAaSN0Y7R0uCqgbxxnJQdIixqKWLXKQYoZnYvbypVSG88zrb2euCRKGMbiWbIsr6ayxtMxNNTRlg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLuCzy+cN/I3v4U/f4R0TTbIF/bAwTpA+wkmXDvyB98=;
 b=R2+/q+k2GuLPpNZCqXDmxX1G6lDovcMZZnAEsj9GysutEN1X/4pQzqLlwP4AQsVYdryiOwuePAqPS5creEHKCgZYOKwQNDHTWvsCnlNEmdJG9ZJ6CVMsat1bCd7Kg2uCjz2hAlMLbczPxNBNeSV5L3OQqXQiAvq99Sknbb/D0G0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e8fe19ef822afd2d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m91sS+XV/fgIZp2OCDH2FPK81Rb6MEcwqaC0hmBIVjuzFOrDQlzG4nOIIqmRTx9MjLV03dwcHli9SvMfNTCT3Ilfx2LOIZKXcK8fPSt8XwQDdCfp+WeWOPZ/xaLXss8054dd0sICn0zMI0BGxFAP/pWzxt0tkQyci6htdKyoYZKwsxf8A8UuEKUE9uHLEuFm47Jk0CtTn1z+YHh1p59A6UDWlUi4BI5Gs66KEINysquXkTsCmGrEpCdoNgKDBkZA5d8iFiXM/4AHKV1VUSUopLcukjU5/qNJHPruLaxz+8shm90p1Y7rV10w6ILyXcWsDd4VzZS7Ixd8Vl9sxqKG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLuCzy+cN/I3v4U/f4R0TTbIF/bAwTpA+wkmXDvyB98=;
 b=HTZ7go/UBUReQ/U3nv5fvBdZUSHngfCdBvoSz7S/eGWVSwhNCZLzoyjg/rBhLFpewS3QjwnuffhetJ2ojR7v1SPWxuP5nyMuCdlrueDPP7COfh+Nwcj/MIPY4PTFn9oHD55hPtk1rN3iz6dEJ7Av111dZXU9cBEbHxY94sXGSj2RLwIf5GfFSf5nDmht7dkJ725a7qp+kv/3wXJeM1508ZIaXXpGW+hVhb/wzMpqKhf01ZMAyzuW7SZKPBAPIqyfN0wy5VTevxGOQMbN6ou4O1NwFylOvSFU5nZV1FuhPE1yyw+D5Kj8J9Ime3yoDrKrwn1hp54xjQecQCyXPEcltw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLuCzy+cN/I3v4U/f4R0TTbIF/bAwTpA+wkmXDvyB98=;
 b=R2+/q+k2GuLPpNZCqXDmxX1G6lDovcMZZnAEsj9GysutEN1X/4pQzqLlwP4AQsVYdryiOwuePAqPS5creEHKCgZYOKwQNDHTWvsCnlNEmdJG9ZJ6CVMsat1bCd7Kg2uCjz2hAlMLbczPxNBNeSV5L3OQqXQiAvq99Sknbb/D0G0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <c1ee9d77-5e35-1cd7-86e5-2880c4b2bf9b@arm.com>
Date: Mon, 25 Jul 2022 10:28:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/9] xen/x86: Use enumerations to indicate NUMA status
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-3-wei.chen@arm.com>
 <aff4a02b-6700-8b5e-5c2e-bf419a9e1b82@suse.com>
 <PAXPR08MB742028368F9F42899E876F759E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <a0ffb1e5-1052-1f8c-355c-5a3acf7f9da8@suse.com>
 <PAXPR08MB7420F531ECCE4106BE8227D49E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <f263956a-aa5b-e71a-ed96-c8f50ebe0d1b@suse.com>
 <PAXPR08MB7420ACF437B10A32BF09689E9E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <66b4ce65-037c-a8cc-ce17-adfce7828a2f@suse.com>
 <41876fdf-862d-bb6a-7a34-0d1db9183716@suse.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <41876fdf-862d-bb6a-7a34-0d1db9183716@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0046.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::15)
 To PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 1108af7c-de7e-4b24-6a54-08da6de57399
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB6839:EE_|DBAEUR03FT004:EE_|AM0PR08MB3587:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 n4D1nNRSkTMfUB1iiP4bSAvJozGiDRaZPiZPXuf0YNKKz9KNMcTZVIODllXlg9Ez/2pxRV8duqn0lr0X/sIH7NKoT25CDGKrHJiNPi1BS7CmPnhZpYGvWEMcLnlk/AUWcxlygJIoJf1jHQtopw2fHJzW7bZJqTHWPrnX43GV2RfTHD/2vvJ6ri+DSooQ7Yvx+d2Yu4yKOHOAnyg2YMAa9y4hG+xN+Vme5rFx8zwbvREmqQLms378cZv6PFioj9rhvK5dBHGQ73m5+tKvBR4CTvvhQ422Ds1HgrJVEILE3QJrRsupWhduhWozmuG60HTkApWqvVWCrpvfD83Z0XvjlLbHelq6dc7EWoZ79ai6PT7MqoEFJ6qHzkdkM8GnWZnKPt8ZYy9mJQLdX9vE+E0123hhRU3BMjYpe6UWX5PUXMtTJiJ2Oe5y4WmBahM4uzBGdQEJvTU9+MAxh1dOkswmj/xPO+ZlT09o3qciqy0JEehRpcyejvf1Rp6K9QVOZiFf5bYsSou/03mw1F1QvhTi84VKxKDO3Tb9nP6n5BYDwEtVaOlo6AkRD1a50dMZcKnecDFBz5Y+EfAtX8eHtm3BDzoo/08ZW7aMQDizGKyCpIcO45g9D1bAq9r5LDIyEPo42gniotXFX8aU0nXTWYEKiUldfZyOF2YlhF/mHqs1dZgvlFj0eDEFEW0pVbhnUZzrTx1qMlL/LahDfsroAsO8K9vgg2w8NJ+uTuoiIG0xlyURtFS5/bUXR7ULPIJfhQyTGMmuUfXVpow8o8UW7HyBZkYo8C4icQhxwUswKY3csXerZZzAJ2IExWfnBE7Y/yRKMSny/IGgd5/JTO9NLrY8cw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(86362001)(31696002)(38100700002)(478600001)(6486002)(8936002)(5660300002)(316002)(6916009)(54906003)(8676002)(66946007)(4326008)(186003)(2616005)(83380400001)(6506007)(6666004)(53546011)(41300700001)(2906002)(26005)(6512007)(36756003)(66556008)(66476007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6839
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	81821316-2ed6-4737-7cef-08da6de56e87
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	chl/YPWhG1N+dtJ5Xl5VtPCtY7YKXEH502y/q48PldxMnxTY4V8Jy/hvokY2px+N3WRvMPqBHqc1FtYQkJ5WbxF0yfFtzpCdXRzpQ88ytsrfeAjIdj9eV+Z4ICc5Rpi75ZN+EOzbUuDaVjgN//RB9tvc4/Fudqjnbdy7RhZ/2ujkYtWxdqGt6METwb0uLE5IINtNefCr1NbiSXNCrA985Kr8MLH3dmF9uHru5iksHPCHSQNhuWa6VxhQzaB5iKO6mn956avc6znwo+nCSiD0zUY/hzCvbdsWz0glciQgQY0t9NMudZ2DDP5UI8zWLFB+HlJvHcchMS13jeOOPkKuFTS3GdSlSbenKhtqFDpMzdMI7+SECOGw80CFqdGR+1HpPyVdk3hibGwTEkQ/4SRf3qqJ0zwDlCNEvyDWW9+Bzvql5W8CKR8jq30h2cbIL9AlfoUoCUr4fqhjDtJttR14WxiMu2jiH4NkTu+8NrQY6BAAlkcaUVYw4cfLIas5HQy3iZw0UyDvNfRQgI0CE2amff27NMehuDdsQRNT+hqLmOPBL81En1H30j40CTdkMPKDD7q9/S7ZxTPvPsVNJzHAwzAVAEOQ+8+ogVth03Xi80EgQuwxpoPz4UrKjWqyetfd/jCt3rRDAU7NkVR8RDzwD6YtMRM3preLB/PdNWCQ0+WhzKojk9nbiL7TRDPHMe4whnvnkBMrlXQfJD62W/IykmAUlvdsxXHUmd1S9MPbd6ZZs99R2Ae1+pD4w/Z6/A9e8d/VQqgYcZhtcOZOSPk6gwsqgcV1NpPApGW8NRsMNwfGp9bS4AhuwleektgeV3Ma
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(376002)(136003)(46966006)(36840700001)(4326008)(8936002)(70206006)(6862004)(82310400005)(8676002)(40480700001)(2616005)(6666004)(5660300002)(36860700001)(36756003)(6512007)(2906002)(31696002)(86362001)(83380400001)(356005)(6486002)(26005)(336012)(82740400003)(478600001)(81166007)(54906003)(70586007)(316002)(41300700001)(47076005)(186003)(31686004)(53546011)(6506007)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 02:29:08.0718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1108af7c-de7e-4b24-6a54-08da6de57399
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3587

Hi Jan,

On 2022/7/14 18:51, Jan Beulich wrote:
>>>
>>> No matter how many separate "numa=" parameters have been parsed from
>>> Command line, the values of these original variables are determined
>>> after parsing the command line. So the determined status can be mapped
>>> to the new one variable from above table.
>>
>> Hmm, I was partly wrong - the initial values of both variables are
>> indeed set from just the single "numa=" parsing. But later on they
>> "evolve" independently, and multiple "numa=" on the command line
>> can also have "interesting" effects. I'm afraid I still can't
>> convince myself that the new mapping fully represents all originally
>> possible combinations (nor can I convince myself that in the existing
>> code everything is working as intended).
> 
> Maybe the solution is to make numa_off common but keep acpi_numa
> arch-specific? Then e.g. the replacement of srat_disabled() could
> be
> 
> int numa_disabled(void)
> {
>      return numa_off || arch_numa_disabled();
> }
> 
> with arch_numa_disabled() evaluating acpi_numa on x86.
> 

While I am working on the new version, I think this may be not enough,
we may need another helper like arch_handle_numa_param to prevent direct
accessing of acpi_numa in numa_setup.

Cheers,
Wei Chen

> Jan

