Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0F153B1AA
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 04:19:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340817.565937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwaQF-0002hc-N8; Thu, 02 Jun 2022 02:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340817.565937; Thu, 02 Jun 2022 02:18:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwaQF-0002f1-JZ; Thu, 02 Jun 2022 02:18:51 +0000
Received: by outflank-mailman (input) for mailman id 340817;
 Thu, 02 Jun 2022 02:18:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ifcq=WJ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nwaQD-0002ev-W7
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 02:18:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55d21a54-e21a-11ec-837f-e5687231ffcc;
 Thu, 02 Jun 2022 04:18:48 +0200 (CEST)
Received: from AM6PR0502CA0039.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::16) by AM0PR08MB4577.eurprd08.prod.outlook.com
 (2603:10a6:208:fe::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Thu, 2 Jun
 2022 02:18:45 +0000
Received: from VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::c8) by AM6PR0502CA0039.outlook.office365.com
 (2603:10a6:20b:56::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13 via Frontend
 Transport; Thu, 2 Jun 2022 02:18:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT056.mail.protection.outlook.com (10.152.19.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Thu, 2 Jun 2022 02:18:44 +0000
Received: ("Tessian outbound e40990bc24d7:v120");
 Thu, 02 Jun 2022 02:18:44 +0000
Received: from cd60b10cd450.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F17ABFF4-8732-4516-A114-F69D7D8700A2.1; 
 Thu, 02 Jun 2022 02:18:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd60b10cd450.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Jun 2022 02:18:33 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM9PR08MB6817.eurprd08.prod.outlook.com (2603:10a6:20b:2ff::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Thu, 2 Jun
 2022 02:18:31 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::ccd5:23df:33bc:1b]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::ccd5:23df:33bc:1b%9]) with mapi id 15.20.5314.012; Thu, 2 Jun 2022
 02:18:31 +0000
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
X-Inumbo-ID: 55d21a54-e21a-11ec-837f-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nPB2BJYWdFQT5pi+7NxcY6XUzI2IQ4unNxd4QXB9Ydz36v6myuuIS0pyd9qtLK85ZLeOtxMglmkctYLdRO6LlqadCdD1xLJ4qDFWm/VkeLC2gGh8rcI5z59vrHtrbW7LmPLSqhK6ORzImmG/TtwGinkw0YeMCMktF9p1ZUmV9YnC4gSyIF2pcwk/YlCSneb7KwrtpuwfM6KSHXfDaWjfb/L6w9Fl/clu33Au98JFyY7b5VrYdGL3UwBjpzHnGiu6jG0zTRtIZao+El2Qu/S/r0kb/Bi3lPr0sZZgAn5muI6597DEV3Ox+QtzidaUN66HyMcfo9cjBviSu9w3uF5V6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7f7fpUrKH8MgG0mcY6KWXtg8YpxTMk9tH5sCFADrNfs=;
 b=PjNIMtvzjifw832BgLpO/h27hTXKiOzPX9OeO3pR43+XwWXmqswPT/ObQmaU2Qg/QVqLbIqkb5wIolW8ju/9jg7ZSGC9n0Z+7g9pbZjGuA0YxAK79e9BXtYMsLMyC1qCGvasEx1JH3Z4Ey4w/VXPlIsL3p11YwkGkQ8/D1SFxvC9tb9wQ3sEzNZsApP4NA8sZ1+jrGlt5vdIpt0mxJclMHHfqA+H4lZEBcPmicDSKr4Oyv9MtsltniwdaYJGhV4Ih28vLj4CfCzYM2pD/Y6DjuILp5bn16v4ju7411a4Q8QCz4GyGSEwQO8Y3xwoB9fDzbcKv5OlTcQZoqtd4Cpwng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7f7fpUrKH8MgG0mcY6KWXtg8YpxTMk9tH5sCFADrNfs=;
 b=C7S7rNh72jLajs+nYOpSdiQpyH4iFMnmzfWR+9o6nhF36Vmm8bcTIU6LBGKZysp/fDhTKjp3RzP4HBS6Xq7vG5ruU546BSuLoyiu2FJTYmEjV9o3EKjLHQMFTr8HiECvUqvtuahOKO5uQgV99w63/uBsc2gBu0ehiG1LfGCCJLQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYeh31fCwMRUjTDK+qybMYqfmn08Nmu2Qhn5aQCaCfkWgtRQH3pmqNxvsJaWN1sQjEUiBeVWdbkFOR3dFn+oH9xaXHBKpxhst6A7VFu1eBG5Od76/QTF0Qbo1YyZwCL8En6+QkEk58dugWkH7e9Zd/KIB7VXvhaf0Cl8VyIutkK2auNi0n6AwNBdJeKDi1Dcvlom4lfMVecbdkOT+sOQJYoT1ggUiIjsTeWiP1HifOdl6mhfa2LwZgApZ/9Seq0Vkik1qRy2FtIpW7DTMGCfhya32MH0ZRyF/tPxon4aV7qb7vINSNCInUWt44mLhbt30Nm6/Z0a2zagGPNVX08Ziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7f7fpUrKH8MgG0mcY6KWXtg8YpxTMk9tH5sCFADrNfs=;
 b=bKQVX1l88EZmohkfdqG67HfMrSyty2wwEbcpTwm6oSUKZkXYQ1rCkJ4S7PV8DMshkmFU8WNl1MICodh3qkJdCp3pDQaYqPGhbjeHtuBuOXMHbQFF9h1pH0pLcXIRTwVZz5x9+VMWkk9FNweyvfBDUEeip3H8IDctCTKoM8hJ44FYSJYEPbkV2Mx2xfWA3z7ExlU3LaMwy/UUIWqJm01Z98TUOGZahxLMTQutHvYmbkoGlnLg9S8Oa6bfscvtaTnf19/O7V1SW72THNE5E/oKZcASbWgvVd1ZyIxkLoGSV4DW3gYqAHwaBpGG/QzAeE0PH+CocYgl3mtn2jFbuOSCZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7f7fpUrKH8MgG0mcY6KWXtg8YpxTMk9tH5sCFADrNfs=;
 b=C7S7rNh72jLajs+nYOpSdiQpyH4iFMnmzfWR+9o6nhF36Vmm8bcTIU6LBGKZysp/fDhTKjp3RzP4HBS6Xq7vG5ruU546BSuLoyiu2FJTYmEjV9o3EKjLHQMFTr8HiECvUqvtuahOKO5uQgV99w63/uBsc2gBu0ehiG1LfGCCJLQ=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 2/9] xen: do not free reserved memory into heap
Thread-Topic: [PATCH v5 2/9] xen: do not free reserved memory into heap
Thread-Index: AQHYdJxqwyiFdjgwHkGm0BKg5tWdR604qfGAgAK5SiA=
Date: Thu, 2 Jun 2022 02:18:31 +0000
Message-ID:
 <DU2PR08MB7325D759DF37AB836B3C2C79F7DE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220531031241.90374-1-Penny.Zheng@arm.com>
 <20220531031241.90374-3-Penny.Zheng@arm.com>
 <9f0d9d47-236a-d7c5-3498-d8706c616fcd@suse.com>
In-Reply-To: <9f0d9d47-236a-d7c5-3498-d8706c616fcd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9C8AE440865B3846AF73486696F94349.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f4bb4320-5f71-4a88-16bf-08da443e380a
x-ms-traffictypediagnostic:
	AM9PR08MB6817:EE_|VE1EUR03FT056:EE_|AM0PR08MB4577:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB457720CA7858F2F146A74E85F7DE9@AM0PR08MB4577.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gBnOROYKaYPUm5oXLOxUwO3VazoWBpFSfPR2T9YtDHqqfkk8vYZo6hxM989Umlr4d1EbaxAM52PtOzar6+5+qjqVJrFxeBobLJcZRFXoKvvtGQUynhboOxw4Z9fgdIgvb0u4+eY8Brcd6mOpgcoeg0OvENVkI9vNaxRSbV8+7qA/HP+K9BAgCiI5hfbbaS5yVhNrCyU4/w54Jv5kg4O9SX/t/BMYCo8t6s04oS0P7UlJVAR/hItPcxrEij4CZkmFK7q0d/Q7WRb+NEOBdNLX+9XU44fZW+Au/1T0k6WOH/hLwu+psWMZaxFYWL4Dq5wmdt2/4z/sj7cyBcHMPT3v7e249QuUNWO+q+doY+aTpfB8dGqY1+MNUDb9vNeRwjaPvSe+ZUBu7GHFLwKKLNWu3AuFkfayzJyCN/HI0/cVYppehKpF0FrKlCjeNAbPkOg+AM7kyBBdeZw//kOGNXwJH/JiUlPOMACUOpJqK59oo0WCqo9tXvuT6wXHFbHDSUhFzpqTidZNXhiCbLLIgqpoiYZ5Lq0ggH6cwiVlmGf7GxdwHllXUnA+ob69dk9z4UsHE3rmeLzuoaUo6aGaePIFQOmLu548+VnX/sBeaQrLB2vrIwX7aFf4V+ZxOX0Mwf0lvQxCFlnAYYtVghQzKdwfLU0dU1cerPjp7Sg5GunWclr5k9k80/Bv9bX4ySCYeDKSSL/TF948DroXZ1NL2lh7pg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(86362001)(122000001)(38070700005)(83380400001)(38100700002)(7696005)(6506007)(55016003)(6916009)(9686003)(71200400001)(508600001)(54906003)(316002)(26005)(53546011)(2906002)(66476007)(66556008)(64756008)(8676002)(76116006)(66946007)(66446008)(5660300002)(4326008)(52536014)(8936002)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6817
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	035cca26-5ad5-4f55-ce77-08da443e3012
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bJGi8vx5DG2tLOJJUTpGcrVR4/erCR/d1pWMYQpIoJW9TsYQRkz5FrSaYVCbcWqDHbC7jXg6uT3i7yvlGqONNtzM9mohtdXpC2qw+TanNpDqXmgUQTRBaa1/zdqhNQgCsxPJDn0FS2BADMR1fqHZOOZV4DV9MgLwvN3QBUx08JYheTuaLJlxTHDrhmFqif5TH67R4CMTz+mTYdxoqL0QdQABwrP/AGvHLKsTJ+ECwFPd/kdzvGcTG83OTf4H/DjZfkQixaF8a1eCrvBVjHRz2Zqk6aVTixpewIAayMSKuXdqllK6jvUAMqKZ+k93k3ddKeSCmO6IsDtnsb6imcJgGPx0VN9eLh6Nyy/XEUU2NkJtgbb3m2xNlQ2lNvwm830j05uO8YGY7nRdg72g/zuKNHWneiIRFws5EaxD+Yb+g1d3KWMnp1ApjoY2WldtxmWLQ2H6MoNXgXS4B17S+JsOa72cyut9AUevzAqn5+lE5WZg1hBwR+8AtlgEhlP7wVI+sNKj3fTvJcxWS7bxDyNvHqyoHIARPGTFPNZx4JGC+RDTEHU2Web9neUb4lgpVtwMfSIr7+FD9Mz+iDV5qdiNIEv+LM5dEmH4sgoGBaEDkFClI5m3Cn9Q4jV3PqDYQwWqXGBWrAeuTJbxWrTVivNwbM6cZMtH9k7LJWEr3pojagwngskX7p5AI24R7fIOsoD2
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(186003)(336012)(47076005)(7696005)(6506007)(86362001)(9686003)(53546011)(508600001)(356005)(81166007)(40460700003)(26005)(36860700001)(83380400001)(70586007)(70206006)(33656002)(54906003)(6862004)(4326008)(82310400005)(5660300002)(8936002)(316002)(52536014)(55016003)(8676002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 02:18:44.3786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4bb4320-5f71-4a88-16bf-08da443e380a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4577

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMzEsIDIwMjIgNDozNyBQTQ0K
PiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+IENjOiBXZWkgQ2hlbiA8
V2VpLkNoZW5AYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBCZXJ0cmFuZCBNYXJxdWlz
DQo+IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA8Vm9s
b2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsN
Cj4gV2VpIExpdSA8d2xAeGVuLm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDIvOV0geGVuOiBkbyBub3QgZnJlZSByZXNlcnZlZCBt
ZW1vcnkgaW50byBoZWFwDQo+IA0KPiBPbiAzMS4wNS4yMDIyIDA1OjEyLCBQZW5ueSBaaGVuZyB3
cm90ZToNCj4gPiBQYWdlcyB1c2VkIGFzIGd1ZXN0IFJBTSBmb3Igc3RhdGljIGRvbWFpbiwgc2hh
bGwgYmUgcmVzZXJ2ZWQgdG8gdGhpcw0KPiA+IGRvbWFpbiBvbmx5Lg0KPiA+IFNvIGluIGNhc2Ug
cmVzZXJ2ZWQgcGFnZXMgYmVpbmcgdXNlZCBmb3Igb3RoZXIgcHVycG9zZSwgdXNlcnMgc2hhbGwN
Cj4gPiBub3QgZnJlZSB0aGVtIGJhY2sgdG8gaGVhcCwgZXZlbiB3aGVuIGxhc3QgcmVmIGdldHMg
ZHJvcHBlZC4NCj4gPg0KPiA+IGZyZWVfc3RhdGljbWVtX3BhZ2VzIHdpbGwgYmUgY2FsbGVkIGJ5
IGZyZWVfaGVhcF9wYWdlcyBpbiBydW50aW1lIGZvcg0KPiA+IHN0YXRpYyBkb21haW4gZnJlZWlu
ZyBtZW1vcnkgcmVzb3VyY2UsIHNvIGxldCdzIGRyb3AgdGhlIF9faW5pdCBmbGFnLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+ID4g
LS0tDQo+ID4gdjUgY2hhbmdlczoNCj4gPiAtIEluIG9yZGVyIHRvIGF2b2lkIHN0dWIgZnVuY3Rp
b25zLCB3ZSAjZGVmaW5lIFBHQ19zdGF0aWNtZW0gdG8NCj4gPiBub24temVybyBvbmx5IHdoZW4g
Q09ORklHX1NUQVRJQ19NRU1PUlkNCj4gPiAtIHVzZSAidW5saWtlbHkoKSIgYXJvdW5kIHBnLT5j
b3VudF9pbmZvICYgUEdDX3N0YXRpY21lbQ0KPiA+IC0gcmVtb3ZlIHBvaW50bGVzcyAiaWYiLCBz
aW5jZSBtYXJrX3BhZ2VfZnJlZSgpIGlzIGdvaW5nIHRvIHNldA0KPiA+IGNvdW50X2luZm8gdG8g
UEdDX3N0YXRlX2ZyZWUgYW5kIGJ5IGNvbnNlcXVlbmNlIGNsZWFyIFBHQ19zdGF0aWNtZW0NCj4g
PiAtIG1vdmUgI2RlZmluZSBQR0Nfc3RhdGljbWVtIDAgdG8gbW0uaA0KPiA+IC0tLQ0KPiA+IHY0
IGNoYW5nZXM6DQo+ID4gLSBubyBjaGFuZ2VzDQo+ID4gLS0tDQo+ID4gdjMgY2hhbmdlczoNCj4g
PiAtIGZpeCBwb3NzaWJsZSByYWN5IGlzc3VlIGluIGZyZWVfc3RhdGljbWVtX3BhZ2VzKCkNCj4g
PiAtIGludHJvZHVjZSBhIHN0dWIgZnJlZV9zdGF0aWNtZW1fcGFnZXMoKSBmb3IgdGhlDQo+ID4g
IUNPTkZJR19TVEFUSUNfTUVNT1JZIGNhc2UNCj4gPiAtIG1vdmUgdGhlIGNoYW5nZSB0byBmcmVl
X2hlYXBfcGFnZXMoKSB0byBjb3ZlciBvdGhlciBwb3RlbnRpYWwgY2FsbA0KPiA+IHNpdGVzDQo+
ID4gLSBmaXggdGhlIGluZGVudGF0aW9uDQo+ID4gLS0tDQo+ID4gdjIgY2hhbmdlczoNCj4gPiAt
IG5ldyBjb21taXQNCj4gPiAtLS0NCj4gPiAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21tLmgg
fCAgMiArKw0KPiA+ICB4ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyAgICAgICB8IDE2ICsrKysrKysr
Ky0tLS0tLS0NCj4gPiAgeGVuL2luY2x1ZGUveGVuL21tLmggICAgICAgICAgfCAgNiArKysrKy0N
Cj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tbS5oDQo+ID4g
Yi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbW0uaCBpbmRleCAxMjI2NzAwMDg1Li41NmQwOTM5
MzE4IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tbS5oDQo+ID4g
KysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21tLmgNCj4gPiBAQCAtMTA4LDkgKzEwOCwx
MSBAQCBzdHJ1Y3QgcGFnZV9pbmZvDQo+ID4gICAgLyogUGFnZSBpcyBYZW4gaGVhcD8gKi8NCj4g
PiAgI2RlZmluZSBfUEdDX3hlbl9oZWFwICAgICBQR19zaGlmdCgyKQ0KPiA+ICAjZGVmaW5lIFBH
Q194ZW5faGVhcCAgICAgIFBHX21hc2soMSwgMikNCj4gPiArI2lmZGVmIENPTkZJR19TVEFUSUNf
TUVNT1JZDQo+ID4gICAgLyogUGFnZSBpcyBzdGF0aWMgbWVtb3J5ICovDQo+ID4gICNkZWZpbmUg
X1BHQ19zdGF0aWNtZW0gICAgUEdfc2hpZnQoMykNCj4gPiAgI2RlZmluZSBQR0Nfc3RhdGljbWVt
ICAgICBQR19tYXNrKDEsIDMpDQo+ID4gKyNlbmRpZg0KPiA+ICAvKiAuLi4gKi8NCj4gPiAgLyog
UGFnZSBpcyBicm9rZW4/ICovDQo+ID4gICNkZWZpbmUgX1BHQ19icm9rZW4gICAgICAgUEdfc2hp
ZnQoNykNCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgYi94ZW4vY29t
bW9uL3BhZ2VfYWxsb2MuYyBpbmRleA0KPiA+IDQ0NjAwZGQ5Y2QuLjY0MjU3NjExMTYgMTAwNjQ0
DQo+ID4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gPiArKysgYi94ZW4vY29tbW9u
L3BhZ2VfYWxsb2MuYw0KPiA+IEBAIC0xNTEsMTAgKzE1MSw2IEBADQo+ID4gICNkZWZpbmUgcDJt
X3BvZF9vZmZsaW5lX29yX2Jyb2tlbl9yZXBsYWNlKHBnKSBCVUdfT04ocGcgIT0gTlVMTCkNCj4g
PiAjZW5kaWYNCj4gPg0KPiA+IC0jaWZuZGVmIFBHQ19zdGF0aWNtZW0NCj4gPiAtI2RlZmluZSBQ
R0Nfc3RhdGljbWVtIDANCj4gPiAtI2VuZGlmDQo+ID4gLQ0KPiANCj4gSXMgdGhlIG1vdmluZyBv
ZiB0aGlzIGludG8gdGhlIGhlYWRlciByZWFsbHkgYSBuZWNlc3NhcnkgcGFydCBvZiB0aGlzIGNo
YW5nZT8NCj4gQWZhaWNzIHRoZSBzeW1ib2wgaXMgc3RpbGwgb25seSBldmVyIHVzZWQgaW4gdGhp
cyBvbmUgQyBmaWxlLg0KDQpMYXRlciwgaW4gY29tbWl0ICJ4ZW4vYXJtOiB1bnBvcHVsYXRlIG1l
bW9yeSB3aGVuIGRvbWFpbiBpcyBzdGF0aWMiLCANCndlIHdpbGwgdXNlIHRoaXMgZmxhZyBpbiB4
ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbW0uaA0KDQo+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVu
L21tLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbW0uaA0KPiA+IEBAIC04NSwxMCArODUs
MTAgQEAgYm9vbCBzY3J1Yl9mcmVlX3BhZ2VzKHZvaWQpOyAgfSB3aGlsZSAoIGZhbHNlICkNCj4g
PiAjZGVmaW5lIEZSRUVfWEVOSEVBUF9QQUdFKHApIEZSRUVfWEVOSEVBUF9QQUdFUyhwLCAwKQ0K
PiA+DQo+ID4gLSNpZmRlZiBDT05GSUdfU1RBVElDX01FTU9SWQ0KPiA+ICAvKiBUaGVzZSBmdW5j
dGlvbnMgYXJlIGZvciBzdGF0aWMgbWVtb3J5ICovICB2b2lkDQo+ID4gZnJlZV9zdGF0aWNtZW1f
cGFnZXMoc3RydWN0IHBhZ2VfaW5mbyAqcGcsIHVuc2lnbmVkIGxvbmcgbnJfbWZucywNCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIG5lZWRfc2NydWIpOw0KPiA+ICsjaWZkZWYg
Q09ORklHX1NUQVRJQ19NRU1PUlkNCj4gPiAgaW50IGFjcXVpcmVfZG9tc3RhdGljX3BhZ2VzKHN0
cnVjdCBkb21haW4gKmQsIG1mbl90IHNtZm4sIHVuc2lnbmVkIGludA0KPiBucl9tZm5zLA0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG1lbWZsYWdzKTsgICNl
bmRpZg0KPiANCj4gSXMgdGhlICNpZmRlZiByZWFsbHkgd29ydGggcmV0YWluaW5nIGF0IHRoaXMg
cG9pbnQ/IENvZGUgaXMgZ2VuZXJhbGx5IGJldHRlcg0KPiByZWFkYWJsZSB3aXRob3V0Lg0KPiAN
Cg0KU3VyZSwgd2lsbCByZW1vdmUNCg0KPiBKYW4NCg0K

