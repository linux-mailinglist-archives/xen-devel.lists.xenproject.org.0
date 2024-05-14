Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3518C4D55
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 09:54:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721180.1124375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6myk-0004V5-Fe; Tue, 14 May 2024 07:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721180.1124375; Tue, 14 May 2024 07:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6myk-0004TQ-AU; Tue, 14 May 2024 07:53:42 +0000
Received: by outflank-mailman (input) for mailman id 721180;
 Tue, 14 May 2024 07:53:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zXVB=MR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s6myi-0004TI-Q4
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 07:53:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1307f4cf-11c7-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 09:53:39 +0200 (CEST)
Received: from AS9PR06CA0673.eurprd06.prod.outlook.com (2603:10a6:20b:49c::17)
 by AM9PR08MB6004.eurprd08.prod.outlook.com (2603:10a6:20b:285::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 07:53:36 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:49c:cafe::b0) by AS9PR06CA0673.outlook.office365.com
 (2603:10a6:20b:49c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.25 via Frontend
 Transport; Tue, 14 May 2024 07:53:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7587.21
 via Frontend Transport; Tue, 14 May 2024 07:53:35 +0000
Received: ("Tessian outbound 85e363419cbe:v315");
 Tue, 14 May 2024 07:53:35 +0000
Received: from c7385488fda6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 210C976F-8B3D-4D5E-AE48-470CFC71CFA3.1; 
 Tue, 14 May 2024 07:53:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c7385488fda6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 14 May 2024 07:53:29 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB7887.eurprd08.prod.outlook.com (2603:10a6:20b:52b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 07:53:26 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 07:53:25 +0000
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
X-Inumbo-ID: 1307f4cf-11c7-11ef-909d-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UwWLz3powiR/h0Zc8Q+iUoO6al6BDbD84Bj3cLhbaRCGGs3J1JN31p2VbKraVY/Vm42C5DVUNq+X09IVzI/N8iz0kRd7cuUe/FKUPjMMMpoJJ+85Tj4acNY6Agnp+0/b0HXgU6iku2hFgPU1lIGVekVIFCuoXp1FlRwogDijLrFiJYhDv06Pcgar8hOZV8bjAYOXW4v5YOfz2m6YEt2mp3K+Z8iGEJvsfBfVv89wD6RoIKxyPxTaFWj/vYrw+Pv+3rWrrtyFdLx9KdKrNGMwWILbCt11dd524nTDXTNS8LIXl0bMpp/N9Cju7pdraNFtlHw3rKxRA3mS/K4IEkg9Fg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DERBBdoj0rOaglpD1IoOe+rXZPnkfSDKmKH3vSPMDQ0=;
 b=hr6koaKMspYWWXBmP2xanTBxDluxpsnrBkYgfoz6qD8e6YanC9Vr0yEQXFC1su+NzA/fGDqGmDYgMs+qE8vWe33NvtQsWwcDjiLdkYDp5xtt0IP0XZ3u4uCpx99436o+921H3dRHzDM/9FVOTlYFy7YJo8sN3K78ePOCW8T1H3bdOabrVputbbsmXMRbi0jc3B/LLJeRvnvLT5gTUGseVf2yEGemsD1lhZdfDtBZR+ycT6ICfsAeqvGmPdly9c+jdBjecN7l4UVl7mVpCHHtwXhgXDj5/q/ptEPSkMQf8qSjVJlwoDRPIBCXOMDG+WffuS7aOQdQfa9hs0I9F/tOtQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DERBBdoj0rOaglpD1IoOe+rXZPnkfSDKmKH3vSPMDQ0=;
 b=OmP3BnVb3R+FS5rJfXwFgX5f5IFZFDvfvkIvq3b7G0eBdZqcPY0jcE+G/QEZAzT40UejYI1qUku6Xgobu94yXJyBGAfbYppPAZ5vhAmV56dSwwBvT6uykJRzy8upx3CofwFU37S2G4oWaq2HWJCmxeOMQmuvqdqhOV9DgtnyPfg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d8aa948aacce0b8f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCGRiinJqNTgTPLBV1XUSjs+HhWlSEv6qGi7z1KQSGvChM5Niu1tRbLNzHQll64e08TAP88egeHc9tDyT407nvi3ltJgPaYE2gaDcnwxMizTT1+Ow7zWST2Vfwcb7FnZA7opJwGv+mYHzm+EGk8rXZcKiDhud7qlNi/kwy53aJOcEQORXoXLushuSQ90bYi0nTbSeF0CI8GkDCrzSnVqvms6Ov/jIy+V3gsE0zqn9D4Z05M9hdTEd6Z0GcU5CM6FSCxGRTq8fAOA3qzoDoGzEd7LTHE/yZDq+/6Jo1+HdDAqNW1M8RrTxt4moWWxvdIJ5vDYUCdI0bX6KbycKqYzXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DERBBdoj0rOaglpD1IoOe+rXZPnkfSDKmKH3vSPMDQ0=;
 b=ZFO/BOxW/muvEJ2shs5ijqmJCAd+Y9p8SBKTJ3B+JYIaz3wHXBMFe4AaiZDZi2XUfXUcBhzYjHdzylPLoYJmcXlkx3DtMeHcotWs1mjSsvhmhALn72Ynzf7vdWoo6PMq8UYkLe+hAywFZ07eyWTWX+yDHzG81eCQWGp5cYagwFQrTgJzfbUSR0RzEYLD6HCReXeeJCBk+AswGfCHMQjQh3PqOSXR2qShfLUAYpSFo20V8ehpdR+hdnYZq1ZB4E1q4KHqx1MqJdCJyhBX+i/k7Z3WjvZVi/Zm909Y/aK2f+J90k1nNdAgvH2LYEGUbarebfinmxarKIx8drLKmbGzcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DERBBdoj0rOaglpD1IoOe+rXZPnkfSDKmKH3vSPMDQ0=;
 b=OmP3BnVb3R+FS5rJfXwFgX5f5IFZFDvfvkIvq3b7G0eBdZqcPY0jcE+G/QEZAzT40UejYI1qUku6Xgobu94yXJyBGAfbYppPAZ5vhAmV56dSwwBvT6uykJRzy8upx3CofwFU37S2G4oWaq2HWJCmxeOMQmuvqdqhOV9DgtnyPfg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH 1/2] xen/arm: Add DT reserve map regions to
 bootinfo.reserved_mem
Thread-Topic: [RFC PATCH 1/2] xen/arm: Add DT reserve map regions to
 bootinfo.reserved_mem
Thread-Index: AQHalxIi36RR5t8uSEeoUslJ6d4QpLGV0j4AgACnKQA=
Date: Tue, 14 May 2024 07:53:25 +0000
Message-ID: <0A931CEA-59CA-4B1F-A8E4-A4CB990C0476@arm.com>
References: <20240425131119.2299629-1-luca.fancellu@arm.com>
 <20240425131119.2299629-2-luca.fancellu@arm.com>
 <a9629975-87d1-457b-b6aa-cbeb91fd4854@xen.org>
In-Reply-To: <a9629975-87d1-457b-b6aa-cbeb91fd4854@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB7887:EE_|AMS1EPF00000045:EE_|AM9PR08MB6004:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b942e59-bd24-48e3-3167-08dc73eaf57d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NDFDVzhjcWwrQW8yeFU4ekgxM2xyNjg3YUsrUHdkU2pXS1FjdjJLM1lZeC9E?=
 =?utf-8?B?MjJuZlpqTVFCd2Z1M0tjRmtNWWUvMWgzYitUSVBIV2NDRjFOR3NtRzBaSEVR?=
 =?utf-8?B?TE5MWXN1Q1gzTTMwcjdvYmJxUGIvMkRjdmVzdlA3eDV5bWdSN0F5S3hSaXlJ?=
 =?utf-8?B?emVhcHZESitSKytFTDZmaEJIZ2JGY3paSWo5Q3Bwd3RHcWZpNURreEZzWDNP?=
 =?utf-8?B?aGhRQnVHK2xhbDVVM29ETG90RjNkWExET1ZhbW9XQWdKRnVUb2tvZ2RLOGpw?=
 =?utf-8?B?aVFWOXVVUnA0dGo5N3o5bUpUd0FpMmF4NFVwN2RzY3dLWEljb28zSzNQWkoy?=
 =?utf-8?B?OXJGR25wZDN3M2dUd282dGxaQWlrQlYrd2E4UGdpUzJOK2N2V2JvcDg2Zzlq?=
 =?utf-8?B?RElVSUtnZ01ybVZBV1FrdGUyWGlGdUFyejI4dWRzMldGVll2cC9EU3B6d1Vp?=
 =?utf-8?B?YThVcCtWZkV3TW5HSjRZT3dtOHdKemZIcldTaWVpcnJ2Z0NPSS9BYnpxSEhr?=
 =?utf-8?B?d2RScGZ4VFo1Mk1sckxjZ0xrNDdsWHFKN3FRaGtLejAvemlmc2hvUHgxVGZQ?=
 =?utf-8?B?WmhyRXpFbmszRlppQUUydVhwMDBTN1laRjI1d24vT0lhRUovVWpWVnpOSTNB?=
 =?utf-8?B?ODg2dENpYXNEalVlTzVmOExJOXozSFRVUmVJSDBVWUhRbElSUFhsbjZ4UzIv?=
 =?utf-8?B?ZEFEdDhMZUM3dW1WUmhSYTJiMkNmbitQenlqR25kTGxyVktpcEoxZDVURTFS?=
 =?utf-8?B?NE9JNkkwMjNoYk9HNjZ3T1pBMis4MURwQytlNnNzTlE3WWZiSG5DejROb3RR?=
 =?utf-8?B?ajhSRGJ0WHVYekpSOXlmVXgxTjlneWttODZtZ1QrNVpqbjBpNEFiU2FGRVJZ?=
 =?utf-8?B?Y1lpRUVUcHBDOVdHZzg2Z0l3MjZmQVhDVHhPSmlNOFo4QTBoWjFpZmpqd3Bh?=
 =?utf-8?B?UTNLck52dmwrR1J3MmpTS3YrcU5TWk5UTHZKUC94dUFVMzl2SzdtZHdGR0ZK?=
 =?utf-8?B?S0g2R0xOdGZXV0swVkhWYTFlVHpuL2tpZEsyVCtxczNUMUs2alRhcjBEc01Q?=
 =?utf-8?B?eXMzRTAvNmVsRVlLT0kzRG93aFVPSmVtSm9NOHBrWHNkTDIvZUV3UUlYY3BV?=
 =?utf-8?B?bDRwSm1YMittQlVLYi9kQytsaFgvMWFpWnBnSERkMUVkQ2x0RzRPbkx5REQr?=
 =?utf-8?B?STZKdGs2RUQ2MC9yRnZzUFN4RmMzUG92QXdsQkZlaXc1VEJud3F6cUlNMVhF?=
 =?utf-8?B?MWlXbFdJaHJ1dVdzVWxnK2RvSDRUaG0yT0lFTnhvS3c5Q2NMSlRYNStNVkZ5?=
 =?utf-8?B?OFVrZWE5emxNeVVoekNYZUNRU201VXdyMmM4aVc1ZUljdXVQV3djYkZaQyt3?=
 =?utf-8?B?UG1BZU9SRStzdUErTnhIVlNZYTlET0pCc2F1Q2xKcVhhZWhQVVh4NVNxanhv?=
 =?utf-8?B?Y29EQVJqUzhKME10bllvS2s5S0VJdjVzZnA2MjJEbTdRdkg1bTBVOHhKSXlM?=
 =?utf-8?B?OURoeWExSVRHT1p6cFBielhGd2tCdFdRZDdBWW1WQ01RTUJ6QVlZc01QT05B?=
 =?utf-8?B?WERNckZ2UWI1SlhDTUw5d1dIVklMOG5tank1T05UU2J1T2NQQkNZTUhHdE12?=
 =?utf-8?B?WXhRTGN4UEFQdG1KY2o1dW4zeUUwM1VrOXR2WnNiU1lFck1vVWdJQ3pBSVBD?=
 =?utf-8?B?QTVFakxGd1puYytrdTRKeWJCdVYwNVdyQ1FYd2dnblpqVUt5L2w0dWM5WDFJ?=
 =?utf-8?B?QUhwcklKdUdmQVBuQmsxY1lmZnJIczJ6d2xhaFB3VnVsZmhuclFZTG84cWpJ?=
 =?utf-8?B?dkMyUFpVbFc4V2p2WkQ1Zz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <457B5DA159A60F44A8F84A1DF7F7AD03@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7887
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bbf2beed-2072-4e25-6ea0-08dc73eaef99
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|82310400017|1800799015|35042699013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVJMMVZJYmVrSW43TXF2aUJHMjdpL1ZMNElFMEFtT0RUb2pWN2RPanA3OTda?=
 =?utf-8?B?UE1RdXlnZkcwVUZ4T0JvUUxsTmhmRjk3NW5tY2QyWDZWelE1WWRDR2RNQnkv?=
 =?utf-8?B?bWthQjg4RWVDODJqTWRiRXp3MlRMdXloSnFCamIxRU5DYUMzQ055VWdNb29l?=
 =?utf-8?B?YWp4QnVldFFtZGxaYkMvVU96c2J5VjhwYUQ2RDJHcnlITjhFMlZWUmtGd1dK?=
 =?utf-8?B?R3ExSGNPV2NBMWptTUhlTWdHU0VndjJYYmR1MnlNUXJMTitWQjdsbm1zK1JJ?=
 =?utf-8?B?ZEdvRTZjR0k4aU1DUUlTZGg1WSt3TTZxWXFoMjU0OEFGTDVlR1prQWt5TWs4?=
 =?utf-8?B?eFZsVWVTSDNEUDZuTkJPSVQ4aVh1TzAzZnp1dS95RkJYVXBXRzdCYTlINFQ4?=
 =?utf-8?B?SUJvQzNkTGJraTc3aEE2MGdSSGJQalJTQkllTnZDY3EySUNGVXJldXJQNERZ?=
 =?utf-8?B?R3Y3a2ZMeStnTnIwL013R2ZxRmZocS8xS09oNUY5ZWIyY2JTNHNBSk1ETFJi?=
 =?utf-8?B?aVdORVo1VzJKNTZZT1JIOGoxVGQ4NTE4MStEcTBXTjk5bHpJKzRRRVAxTHNY?=
 =?utf-8?B?RktkV3hYOHRRSFJrSnppd2t6R3BtWWpLdUNsUjZpYTNGYi9YNDNidjZ5WHZq?=
 =?utf-8?B?SURlZXhvTkpCK1dDTUIrMFI5aWFKTDNUK3lQbFhkN1hETkVQUTE3Tkw4ME96?=
 =?utf-8?B?S0w2NTZ5SGQ4eDNVQzMreWpHMUNIYWo2ZE05RVcrTmExZmtlL1FGYkw4cWp6?=
 =?utf-8?B?OFBWeXBZM2tZeG9pQnFUaE9mMUxRKzJrVGg2d0JsaUNsckEwQWs3NTBNSWlU?=
 =?utf-8?B?MUZwbHBEd3dyejYra1AwTFZqVkdURjFBMi8xYUNwMWUzWEhqdVFFTTd3RGgr?=
 =?utf-8?B?RXZlSWR0ZWprelRPdVE0YUw1eGthVjQ4a1N2VjVORGxYMWh1bFI2WjVQVjVz?=
 =?utf-8?B?bmd6WGZiV0RMZGxRc0RHR2s1cGEvSktzdzdUcEpsaEtyNEVTZGFDRzk1eGNZ?=
 =?utf-8?B?WWY4emtOdGhqZzdPbXpXZGRnVU9yYlo0NFliRzFhRjdiUVhIS3hPbDRmOVlT?=
 =?utf-8?B?VVR1RzhtdGdUcU1TZXJYNGpVUXNQdmNBTzhBVmpsb0NSd3FKWFlpSS84MTMz?=
 =?utf-8?B?Q01VNWJ3SnQ5VVliK3o0Z2Z4aU5vV2xpK2JTVXhORkJpQ01ra1RTb1RVd0dU?=
 =?utf-8?B?TFJDSkxlVXJkQUFwNUpIc0xIUkdxRUV3L0lnOUtaYVdhU0pDN3NweXkydHV5?=
 =?utf-8?B?bVNiRmxiY2dKbmFqYXp3dXI4M3p6d1pHZFZDbUl5U3hRd2pvRnR4djFmdWc0?=
 =?utf-8?B?ZFkvQVdjTjZVWWhQYk53amlIVGE0WVdSN2NiTlJsejgxMm01UnNqVVlsa1Fj?=
 =?utf-8?B?cWxlWVMzWlFncXNRd3VBblBhZlRneXhuRFFhQ0VacUpCTEhIL3hZNXlHdFBl?=
 =?utf-8?B?emFEVVBSMHMzZkhrSU84RTM0U2s1QjljQ0JrNlM1NU5aRzJoL0RYSUp2Zmpq?=
 =?utf-8?B?TU1IUzJ6K0JUUklkcnhNcVJsQzhlMkZOTG9uaWRFMEFZeVlSR3RIamdNVzlI?=
 =?utf-8?B?RUEyNlNnbHgyclJGVURqendJR0hSVFFNSVZEc2xKZktKSGlaK3ZBUm1DLzRp?=
 =?utf-8?B?T2VwdnpKUGp1VGpxUDlpSHZiY2xTUHpSU2k2bVdPRXJ1Y3o2YVRoL3RDdEcr?=
 =?utf-8?B?L0d3bGZjMTZ3eEgxRnM0SFRxNDFjZHBDUG84QTYwZ0gwTlpLZmVxUkZuQVho?=
 =?utf-8?B?ZWVxM3VlQzQyVjFKaWVpUWZEeExXUW5UQTE4RUwxcUMvSFBFVUlJRkFxRVl1?=
 =?utf-8?B?SE5qbGs1WmdjbnVCMGZBUmdTRjR4NzJXNXp6YTA3RTgrNzVQdGVGaVhkSXNj?=
 =?utf-8?Q?tBMsrLlgS7NRD?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015)(35042699013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 07:53:35.7306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b942e59-bd24-48e3-3167-08dc73eaf57d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6004

SGkgSnVsaWVuLA0KDQpUaGFua3MgZm9yIGhhdmluZyBhIGxvb2sgb24gdGhlIHBhdGNoLA0KDQo+
IE9uIDEzIE1heSAyMDI0LCBhdCAyMjo1NCwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4g
d3JvdGU6DQo+IA0KPiBIaSBMdWNhLA0KPiANCj4gT24gMjUvMDQvMjAyNCAxNDoxMSwgTHVjYSBG
YW5jZWxsdSB3cm90ZToNCj4+IEN1cnJlbnRseSB0aGUgY29kZSBpcyBsaXN0aW5nIGRldmljZSB0
cmVlIHJlc2VydmUgbWFwIHJlZ2lvbnMNCj4+IGFzIHJlc2VydmVkIG1lbW9yeSBmb3IgWGVuLCBi
dXQgdGhleSBhcmUgbm90IGFkZGVkIGludG8NCj4+IGJvb3RpbmZvLnJlc2VydmVkX21lbSBhbmQg
dGhleSBhcmUgZmV0Y2hlZCBpbiBtdWx0aXBsZSBwbGFjZXMNCj4+IHVzaW5nIHRoZSBzYW1lIGNv
ZGUgc2VxdWVuY2UsIGNhdXNpbmcgZHVwbGljYXRpb24uIEZpeCB0aGlzDQo+PiBieSBhZGRpbmcg
dGhlbSB0byB0aGUgYm9vdGluZm8ucmVzZXJ2ZWRfbWVtIGF0IGVhcmx5IHN0YWdlLg0KPiANCj4g
RG8gd2UgaGF2ZSBlbm91Z2ggc3BhY2UgaW4gYm9vdGluZm8ucmVzZXJ2ZWRfbWVtIGZvciB0aGVt
Pw0KDQpTbyB3ZSBoYXZlIDI1NSBiYW5rcywgaW4gbXkgZXhwZXJpZW5jZSBJIHdvdWxkIHNheSBJ
4oCZdmUgbmV2ZXIgc2F3IHRvbyBtYW55IHJlc2VydmVkIHJlZ2lvbnMNCmluIHRoZSBEVCwgbWF5
YmUgYSBjb3VwbGUsIGJ1dCBJ4oCZdmUgYWx3YXlzIGhhZCB0byBkZWFsIHdpdGggZW1iZWRkZWQg
cGxhdGZvcm1zLg0KDQpJ4oCZdmUgdGVzdGVkIHRoaXMgb25lIHdpdGggQURMSU5LIEFWQSBib2Fy
ZCwgbjFzZHAsIEp1bm8sIHJhc3BiZXJyeSBwaSwgcWVtdSwgZnZwLg0KDQpJbiB5b3VyIGV4cGVy
aWVuY2UsIGhhdmUgeW91IHNlZW4gYW55IG51bWJlcnMgdGhhdCBjb3VsZCBiZSBjb25jZXJuaW5n
PyANCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

