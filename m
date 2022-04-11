Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2C14FB923
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 12:12:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302842.516649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndr1u-0001rL-Bt; Mon, 11 Apr 2022 10:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302842.516649; Mon, 11 Apr 2022 10:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndr1u-0001oF-8u; Mon, 11 Apr 2022 10:12:18 +0000
Received: by outflank-mailman (input) for mailman id 302842;
 Mon, 11 Apr 2022 10:12:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R/O6=UV=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ndr1s-0001o7-Cz
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 10:12:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbe3a658-b97f-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 12:12:15 +0200 (CEST)
Received: from AM6PR10CA0070.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::47)
 by DBBPR08MB5932.eurprd08.prod.outlook.com (2603:10a6:10:207::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 10:12:04 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::5f) by AM6PR10CA0070.outlook.office365.com
 (2603:10a6:209:80::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Mon, 11 Apr 2022 10:12:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21 via Frontend Transport; Mon, 11 Apr 2022 10:12:03 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Mon, 11 Apr 2022 10:12:03 +0000
Received: from 4a34785b19db.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DE7D4445-11BC-45D1-A049-9AA54ED90413.1; 
 Mon, 11 Apr 2022 10:11:57 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4a34785b19db.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Apr 2022 10:11:57 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by DB7PR08MB3787.eurprd08.prod.outlook.com (2603:10a6:10:33::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 10:11:52 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::8cab:4b29:9cb1:580a]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::8cab:4b29:9cb1:580a%4]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 10:11:52 +0000
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
X-Inumbo-ID: dbe3a658-b97f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95Za7DXyJDyr0M7icnH5tSUyWpZ1opisSjOuPbZBLK4=;
 b=7e4Dpe9jM8T+xKLKhHeIWnEg4+d33uaZjOP3Ccpk0Rv2rDzy5p+p/CdG/MDm3ZVLobdZhw9KA1XVU9dyPpxlpqVT5GxMiAidYrFGKqJiJzIjR5Svqqy8H0C1NalmCTdj/piUyLAEWT26z5k5g5H90TB/vtJsEDQwGxGi0RUuqoY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnA8nMyANYmp93IyGf8UOiD2BO+XyU4xQByvLhq8fn0C3I3J1xa+wTsyzZfgOxNH7Bt6aG5XSLrYzx4XV7tlx6oPbggc8HOSUlecZ4+bqHleO+XjnWuEJqfOkxj5D9keTJN7j3uHJRwtxW2KIWC/D0IFrCEFMOW3zGZTPNZ/xVUFYRQZN9G6KQa4MwGBEGOXb8xCvfORdgSpU34L7Z+aZGiNyZqh9Pf7BSc2Ge6AwU1UeP40rlyMhjE9AppE7sYn/blTH2u8ttxxj3hHgmrD69vYpbz8I/mbdo3dM46mWEPLzVc0P1jpy00FlPwC9suLe76aEoCIv/w6UOazxdX9xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95Za7DXyJDyr0M7icnH5tSUyWpZ1opisSjOuPbZBLK4=;
 b=kJUgmR7a2DqI18KyjPOUv+1FTzc8NBIcG4o8T1rFTM7wJjKSbltSxQ8h1jUFRwtAIbt1o7sqQ4DUUGz2PnyRsf+9rT8DnP6MXVM+Jqj0ca7fUHW60CjcnL7D9iUTRa8hyfzBxAth5yFaydJYvOwtpQ8YTZjuittbxldnkt6zrpcqhdHbjToNyIVvd1TDA3uek774FxhcZHUlQlns9t7QRbth3OkLaQ5boEAEwVHBr/x05NT+fuo8fxbOwQUP+KQMBo/egZk1IoeyF0ka7X6LUPWf29/4MbVh/m/BF8bxn8ofuNsXoa7Ky1AkyH+q+UYlDbShpYSVDQkmJbSs/a7x5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95Za7DXyJDyr0M7icnH5tSUyWpZ1opisSjOuPbZBLK4=;
 b=7e4Dpe9jM8T+xKLKhHeIWnEg4+d33uaZjOP3Ccpk0Rv2rDzy5p+p/CdG/MDm3ZVLobdZhw9KA1XVU9dyPpxlpqVT5GxMiAidYrFGKqJiJzIjR5Svqqy8H0C1NalmCTdj/piUyLAEWT26z5k5g5H90TB/vtJsEDQwGxGi0RUuqoY=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"community.manager@xenproject.org" <community.manager@xenproject.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: RE: Ping: [PATCH v4 1/8] x86/boot: make "vga=current" work with
 graphics modes
Thread-Topic: Ping: [PATCH v4 1/8] x86/boot: make "vga=current" work with
 graphics modes
Thread-Index: AQHYROPtcJBl4i95okO8HDmAStvYzazhCTMAgAHwwACAB49yAIAAA21A
Date: Mon, 11 Apr 2022 10:11:51 +0000
Message-ID:
 <PA4PR08MB6253CEB380333171F2829F7492EA9@PA4PR08MB6253.eurprd08.prod.outlook.com>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <3fb7f3e9-a6cf-4f8e-1141-100848b1bdd0@suse.com>
 <YkwBpKcyrnuXyNPa@Air-de-Roger>
 <65d3068b-fde5-951b-9a60-4ba1dcd89a49@suse.com>
 <01992254-1a4d-850d-78c5-7e4ee738cffe@suse.com>
In-Reply-To: <01992254-1a4d-850d-78c5-7e4ee738cffe@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D9511BF12FBA8347A58F6D33DD6B77E7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3911d7bb-c9a0-4cc5-4f5d-08da1ba3b9f1
x-ms-traffictypediagnostic:
	DB7PR08MB3787:EE_|VE1EUR03FT048:EE_|DBBPR08MB5932:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB5932FCF2BA3D2FDE9C89EEF992EA9@DBBPR08MB5932.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4G4esZGMiejuIYW/Q4nFzwb4lFPRjTrosJhPEkTju8Z3jTskDAX9PXp5yQG3DPQueO/REw0N18nwPkOZo8ll9LIgYiGtz/XYrvmi1GjiCwF8ADTpuqcrwesx7pFw0i3xDa3OY/CRa2XqH8wfU8PpJALhQKn96kAqG7AzeXMOpMHu61KC8zlr6h5vXfrwM+rjsc9WYq7Qw/jTMQpPrcY050buHQU4pxdO0AENcKqQJ7Z9OXHY+6jyFCa2JBvxqOb1C/G/gOb7EiH4Ks/I14+tr9OHfPHTp/v6rAwP/cu6V80ZTSfQXMZxE3uk03sudSlnQWtt5qNeop99jDL1ua4LFAu/oNBTVL2UuOWIEue0wwx5V6vJbHtvOW9rWWPsRj4qi6LuQ91aiR2hrmYcwZs8+z85telNho7D18GdoRSMZEzMQSbjAahrYpiedjgTzQ+j7cYDIcA5VZTkKHlJDHjs1eXFeVLH2Q36lRnzd6WsQY2/fwePyONfy7+UDm77fp04goujMibPFW2wVNM0VT9579pd+lkqoYgf4NJYI74LIpdVp4BRJeXtf+3WB5u/3/gfHalGDWats/shBhvXkplf0yLBDc19uTJbxF0znOwZKMFMrWm6YNrTigDDxT+2DcaCLfLMkRyjPl8Sv1bimriv5X6L45XZX2ZcDD+0Mv4c24LikE1cugY5LVfKTSQzZgfPMcU4aVtmw3B5z9PitLXkAA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(38070700005)(55016003)(2906002)(186003)(122000001)(38100700002)(33656002)(71200400001)(9686003)(4326008)(6916009)(54906003)(52536014)(7696005)(508600001)(6506007)(316002)(5660300002)(66446008)(66946007)(8936002)(66556008)(66476007)(76116006)(64756008)(4744005)(8676002)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3787
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ed919a6d-6729-4a76-04d6-08da1ba3b2d1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j0BGm94kQO5WPuXFZjA93JbrHWn2y3f4q7Ag+r1M0KgzR808MoTR31lHNedNJC9rCZdlF2GefzS/X+2TpUGDXZ/SsLObmH26gm3tvkvu17+I3qvcEkEX7OS7emXJrscxcnLZ39r7UVlZv8HaM7KbfQLERVcMENjSEgwC88x5tWQn3NFJrOeK7wURtD1gvoXh7ux2VmO5+H9DrDrPyL86oOEGAkjj4Mv9P7lSxWCe1JkjBMPbIgfL6q5XfJpZGxwIv2Cz5dUZzoRSev1Lj4+oZcaWmIGzNNs1NDbYJnoorXhag5GvyJh0hmdVeFF88Zqrl1Gc7DoGEmXdFpmvP4pDGRGOWFJ/y3nJtaPdTZ9h9EvVNldPeLO/fniqNr7ZnGl04DV35uyKlweB48FrXPpq9Jo7OfZzaFpEyK9vuFYpHgSfBAH8o5l/SMCxepnw+Iqdpn0pdXDctIuDTZE1yRGxEPMv1Xa0diOCgB13TY8KGvEiPNgy5nmZqg7PimI8EeK+gaP+lf3sE0QGtnahCb+voZWOeZ0zfSvjMgBKNGLWUKNXh6d8yJ4wUSRLy5l6B4aBnazHJO8FI1jzNES2QxBpqLmWl75NUGDVPiPcar0FEu9+PAFTCU9ya8jK4nthds1SAMNDO7XeJ9IV1ZQDla8OPBLTnyKUeJTkZxCC96IvLkJEFgPbia5KRgo83BYyCMvZ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(54906003)(508600001)(40460700003)(86362001)(2906002)(316002)(52536014)(6862004)(8676002)(81166007)(4326008)(356005)(4744005)(70206006)(47076005)(36860700001)(70586007)(5660300002)(8936002)(7696005)(6506007)(26005)(33656002)(186003)(336012)(9686003)(82310400005)(55016003)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 10:12:03.8471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3911d7bb-c9a0-4cc5-4f5d-08da1ba3b9f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5932

SGkgSmFuLA0KDQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+DQo+ID4+DQo+ID4+IEFja2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4NCj4gPg0KPiA+IE1heSBJIGFzayBmb3IgYW4gYWNrIG9yIG90aGVyd2lzZSBm
b3IgdGhlIGNoYW5nZWxvZyBlbnRyeSwgcGxlYXNlPw0KPiANCj4gUGluZz8gVGhpcyBpcyB0aGUg
b25seSB0aGluZyBtaXNzaW5nIGZvciBtZSB0byBjb21taXQgdGhlIHJlbWFpbmluZw0KPiBwYXJ0
cyBvZiB0aGlzIHNlcmllcy4NCg0KU29ycnkgZm9yIHRoZSBsYXRlIHJlc3BvbnNlLCB0aGUgcHJl
dmlvdXMgZS1tYWlsIHRoYXQgeW91IGRpcmVjdGx5DQoidG8iZWQgbWUgZmVsbCB0aHJvdWdoIHRo
ZSBjcmFja3Mgc29tZWhvdy4NCg0KQWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJt
LmNvbT4NCg0KU2luY2UgeW91IGFsc28gbWVudGlvbmVkIHRoZSBjaGFuZ2Vsb2cgZW50cnksIEkg
d2lsbCB0YWtlIGEgbm90ZSBvZiB0aGlzDQpzZXJpZXMgYW5kIHdlIGNhbiBoYXZlIGEgZGlzY3Vz
c2lvbiBhYm91dCBhZGRpbmcgaXQgd2hlbiB3ZSBkbyB0aGUNCm5leHQgWGVuIHJlbGVhc2UgKDQu
MTcpLiBXb3VsZCB0aGF0IHNvdW5kIG9rIHdpdGggeW91Pw0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5y
eQ0KDQo+IA0KPiBUaGFua3MsIEphbg0KDQo=

