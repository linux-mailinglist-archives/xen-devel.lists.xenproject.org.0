Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FCC6277CF
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 09:34:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443183.697691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouUv2-00072O-Bn; Mon, 14 Nov 2022 08:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443183.697691; Mon, 14 Nov 2022 08:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouUv2-0006zW-8S; Mon, 14 Nov 2022 08:34:16 +0000
Received: by outflank-mailman (input) for mailman id 443183;
 Mon, 14 Nov 2022 08:34:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CFvb=3O=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ouUv0-0006zQ-J1
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 08:34:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2040.outbound.protection.outlook.com [40.107.21.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ddd6412-63f7-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 09:34:13 +0100 (CET)
Received: from DB7PR05CA0025.eurprd05.prod.outlook.com (2603:10a6:10:36::38)
 by PA4PR08MB6318.eurprd08.prod.outlook.com (2603:10a6:102:e2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Mon, 14 Nov
 2022 08:34:05 +0000
Received: from DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::6f) by DB7PR05CA0025.outlook.office365.com
 (2603:10a6:10:36::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Mon, 14 Nov 2022 08:34:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT037.mail.protection.outlook.com (100.127.142.208) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Mon, 14 Nov 2022 08:34:05 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Mon, 14 Nov 2022 08:34:05 +0000
Received: from d21dedf9b84e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B66C9A36-83C2-49FB-814C-661351483EFD.1; 
 Mon, 14 Nov 2022 08:33:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d21dedf9b84e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Nov 2022 08:33:58 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB9PR08MB8675.eurprd08.prod.outlook.com (2603:10a6:10:3d1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Mon, 14 Nov
 2022 08:33:54 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%5]) with mapi id 15.20.5834.005; Mon, 14 Nov 2022
 08:33:54 +0000
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
X-Inumbo-ID: 1ddd6412-63f7-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r63zZomc9U74+1Bh9OYsZ1IPa6dITlE3XkixBna1HC8=;
 b=BLL+m0scZx7DykFMbpG9Lvwy50JFIZW8jnZelB4GuokvJSCW99Ez8Z1hyPbqAtn2gCiYMgsEmDUBT13V9xjRIN3keqTZJD92Z05AXKq+5Z3Vy5hxu7WmiG25CGe8LXFwUAc8sM+dD7HZ+V7NUq3WgtapZmXz9vjIHEcX+eFTSrg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oM9IYadFdahKA17x7Hh+4B/cu3h4UkerMLABbA+I4A6VuYZkvvortOwpG3GVmdKfOewf1Op/E5rL38LRBEbbCwTDUVBx+xfgRmNPFUVcCNp9oUUMl3W0AY49pz3EbgW//1iD+iiToMzSL3zu4VFG6Tsey2EHkcL+itQFszwyDTMbq0sajoAcyU/aoPFl9YoYYeZQSPeJbp/KrLkhwuTkh6PnUCT72PnPjSIIwJCcl6mRTzB8iLBSI1hbmQk0Jgobnn0ldwDaGiJ5/W2Q3iKHt34ZQn1LrbIu7MKUVUuRiQcWItcdlpfGqa/8/KzcNDH6HOCzN73ujoajJzoVEgY4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r63zZomc9U74+1Bh9OYsZ1IPa6dITlE3XkixBna1HC8=;
 b=SmOmexYwZk51+1msBiqNhC1BVLafKINtaRSBPWu8N7cB3Fa4smrY3dGC5X1Vpc9P3kJoKYtHa4bq73dnK0wp0uIB3c998n2uEeQIiKD/JH6jkOMajQ0ViwZfUFVZOd1x7GGiwH2HbjeFBH3hZ8e+CDvUeeAksby01R4Cq7gTtOOSBd9iqr5ypOrz1T8l2THs1f+9YDmmaI0XEm7enmWUPGpXvb20XBCj3xe6AyTllLpLdK+C2xLzZw+5eZwtLDExnKhWUzmJLhuehubscR1zR/pYAh4YHpeZn8teko/m0kr31wMBPqJzYBj5RcyhPbV7pHkdTYiXVr6R3Ki27s2F4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r63zZomc9U74+1Bh9OYsZ1IPa6dITlE3XkixBna1HC8=;
 b=BLL+m0scZx7DykFMbpG9Lvwy50JFIZW8jnZelB4GuokvJSCW99Ez8Z1hyPbqAtn2gCiYMgsEmDUBT13V9xjRIN3keqTZJD92Z05AXKq+5Z3Vy5hxu7WmiG25CGe8LXFwUAc8sM+dD7HZ+V7NUq3WgtapZmXz9vjIHEcX+eFTSrg=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v8 0/6] Device tree based NUMA support for Arm - Part#2
Thread-Topic: [PATCH v8 0/6] Device tree based NUMA support for Arm - Part#2
Thread-Index: AQHY9/NBdTAzy3F6U0ar/3rX7ynbh64+D8cAgAABF9CAAAPhgIAAADOQ
Date: Mon, 14 Nov 2022 08:33:54 +0000
Message-ID:
 <PAXPR08MB74205604C48B1D2CBB7A135B9E059@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221114063451.473711-1-wei.chen@arm.com>
 <3aa067b2-fa49-326a-c5a0-6735bc95951e@suse.com>
 <PAXPR08MB74209231BFD7E8C3004C55A49E059@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <2beb3d17-99f6-77fe-a5d6-d60e665f01d5@suse.com>
In-Reply-To: <2beb3d17-99f6-77fe-a5d6-d60e665f01d5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F9316812B391AD488484EADEEDEB89F3.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|DB9PR08MB8675:EE_|DBAEUR03FT037:EE_|PA4PR08MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 191046d0-5d0d-440c-7874-08dac61afd92
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Y9oj1rqn979jggL74S8UM2TScOjNCYAFyojpROduYDbt7zK5dZX2fJDUWng86qLhLFMsg7eWYIQrYxynQC1LGhtguXn/rWp9IfM1zXsbVJYsAv2UJrz8AuaJzJuqr4pnQxyAKXBxd8SUdkYM2DLrWLxPI35Rjpnfs1RvFgSbzF7slz+XylCzEiyS7IB+3qb3ghdNY8nEi9aXe3JC72Kf9PCQ+M07+H4/Lt0fkucnP1HMd+hcBE0rZQkwcgei44an2mQ0Z7tij9iP91Xx5vex4LwMKRTw84FhtkrKZHiAyN00PpJJPnMlUb2q2uoPWLZnDteninMsl2ob+aZUhdMqVUNC4GvJLhEp7Lx0+7QGiVKNS/y1ASA9goit5Y6MrS9FAPtLiCV6ChjINeKDX9m/VT2PM+UX1iQRkm4cknKza15fz7gHnqW+/un0N0iUagxKYBafCDbMhrTu0J9+6VshZMYo0y1Np62P4qiq9e4NBJOYf/lJXWaX5m7r+a8ULXFB3p7vf20Bu3w626wPh8TlTXgk74OteYhKOKVZQIOjKe83q9FsGcp/p70QheskR/dqUC7DF0v79/rJtJyrFQGB7C8E6je2DnerYLSdJU6rrnuOkDaoPd8VmhsOSFw35nBl3LN1u9426ZmyHfCKF7PBLUZPqQcSunYwbPlHUSJqXX1+IKN4xNl0YoiqMNYsOp44tPx0Xx9nh+KMe3JJ6pS+o71NQ9rBNAMzZNKRqa5em5hMB1Qxs6QM318CNUPDqm0y2/ZoiCLJGLhGRXeO+H1XNH2Eg6jlrjY5PIEM01l8+6Agp9z9kpAqUwcDw2CBSmUzxUQCXsB3+oF/SFmp1LkP4w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199015)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(122000001)(38100700002)(52536014)(2906002)(8936002)(38070700005)(4326008)(8676002)(5660300002)(83380400001)(41300700001)(71200400001)(478600001)(53546011)(7696005)(33656002)(6506007)(9686003)(186003)(6916009)(54906003)(316002)(55016003)(86362001)(966005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8675
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	91e07873-0478-45f6-eab3-08dac61af6ec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I4vv8qku45BNnYNn/ll9Zqz6tz43bvTJxxxmHhGQ/zPUhbpYxK9X9fOioICx1OwlF/jS4vaaVhK//lxer0EcK7VL/qPiDHKnkpZx2DgyqDu72Bipr6YjSmOMWB8Lv2ntZqchjjgHdnnsyCFkgyCjiZ2l0DhCU3+nZrtJp3RfPemmeI7DzMYM9/gESEl8GKFcNWU8Uhpf5NKxYWzY6K5bqL5fKZBLhxClATq1lXIxj1Sdl18ahWBNWrBVUEaMq6nEeujTnzsgttl4PFGPJnaIALXub+YhXFyMDHxir3vkv+YoPAHLqrc/tDk5KOzBDWcfI3gkbmndM1wgxIh+vj/hoR5X20XgmQ6nTMiyWqDz/d72gNfgCQ3s2eNiFVpgC2W/zIERtbUhGqGbC0yi2taLdCa3Q+tMKpiJY5ouQcI8qF5MtpRJGXGV2Ju4aAbiVonBPboZO3foClIBZcj8xmzHhAuNqbYEgK2Y7234Pzp8cNbniRhQRrKlXI62UjiOhxFhh8yM03+Uo5++2JzgeSDWDQlPvYLWLLedRZcmi6p0S3WpqHQfpMqrE0iUKiLUE54aGuUWjivW6ejPbsGPrcOm2alAmDytYphHBux8Sb/irwREiiGIuc5Y6ZVt5n4eMiwvA+zt/5k64fF/jnXiepKQXRc8KBe8fuf2zT5xb3xlWeAZSX6dyuE55QScTYwsb/blLvP1zAu2XoKqzJhOQKey3zbjclYyPt08v2BXQVjpDP6UysVno3qLayJ0eow+VEzHT8YwJardWbFy7GULnIve6HBobW7L3bldZEDZlKoRlvCKeWDwMKr9Vt49+AKs6auE1bfSLBXp5iB+J4ChfOk8ig==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(33656002)(82740400003)(41300700001)(2906002)(356005)(81166007)(6862004)(40460700003)(83380400001)(36860700001)(86362001)(54906003)(70206006)(70586007)(478600001)(47076005)(966005)(336012)(4326008)(316002)(186003)(82310400005)(40480700001)(52536014)(8936002)(5660300002)(53546011)(55016003)(26005)(7696005)(6506007)(8676002)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 08:34:05.2030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 191046d0-5d0d-440c-7874-08dac61afd92
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6318

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDEx5pyIMTTml6UgMTY6MjMN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBDYzogbmQgPG5kQGFybS5jb20+
OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1DQo+
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgR2Vv
cmdlIER1bmxhcA0KPiA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz47IFN0ZWZhbm8NCj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY4IDAvNl0gRGV2aWNlIHRyZWUgYmFzZWQgTlVNQSBzdXBwb3J0IGZvciBBcm0gLQ0KPiBQ
YXJ0IzINCj4gDQo+IE9uIDE0LjExLjIwMjIgMDk6MTQsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IEhp
IEphbiwNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IFNlbnQ6IDIwMjLlubQxMeaciDE0
5pelIDE2OjA1DQo+ID4+IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gPj4gQ2M6
IG5kIDxuZEBhcm0uY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT47IFJvZ2VyDQo+IFBhdQ0KPiA+PiBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2Vp
IExpdSA8d2xAeGVuLm9yZz47IEdlb3JnZSBEdW5sYXANCj4gPj4gPGdlb3JnZS5kdW5sYXBAY2l0
cml4LmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vDQo+ID4+IFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OCAwLzZdIERldmljZSB0cmVlIGJh
c2VkIE5VTUEgc3VwcG9ydCBmb3IgQXJtIC0NCj4gPj4gUGFydCMyDQo+ID4+PiBTbyBpbiB0aGlz
IHBhdGNoIHNlcmllcywgd2UgaW1wbGVtZW50IGEgc2V0IG9mIE5VTUEgQVBJIHRvIHVzZQ0KPiA+
Pj4gZGV2aWNlIHRyZWUgdG8gZGVzY3JpYmUgdGhlIE5VTUEgbGF5b3V0LiBXZSByZXVzZSBtb3N0
IG9mIHRoZQ0KPiA+Pj4gY29kZSBvZiB4ODYgTlVNQSB0byBjcmVhdGUgYW5kIG1haW50YWluIHRo
ZSBtYXBwaW5nIGJldHdlZW4NCj4gPj4+IG1lbW9yeSBhbmQgQ1BVLCBjcmVhdGUgdGhlIG1hdHJp
eCBiZXR3ZWVuIGFueSB0d28gTlVNQSBub2Rlcy4NCj4gPj4+IEV4Y2VwdCBBQ1BJIGFuZCBzb21l
IHg4NiBzcGVjaWZpZWQgY29kZSwgd2UgaGF2ZSBtb3ZlZCBvdGhlcg0KPiA+Pj4gY29kZSB0byBj
b21tb24uIEluIG5leHQgc3RhZ2UsIHdoZW4gd2UgaW1wbGVtZW50IEFDUEkgYmFzZWQNCj4gPj4+
IE5VTUEgZm9yIEFybTY0LCB3ZSBtYXkgbW92ZSB0aGUgQUNQSSBOVU1BIGNvZGUgdG8gY29tbW9u
IHRvbywNCj4gPj4+IGJ1dCBpbiBjdXJyZW50IHN0YWdlLCB3ZSBrZWVwIGl0IGFzIHg4NiBvbmx5
Lg0KPiA+Pj4NCj4gPj4+IFRoaXMgcGF0Y2ggc2VyaXJlcyBoYXMgYmVlbiB0ZXN0ZWQgYW5kIGJv
b3RlZCB3ZWxsIG9uIG9uZQ0KPiA+Pj4gQXJtNjQgTlVNQSBtYWNoaW5lIGFuZCBvbmUgSFBFIHg4
NiBOVU1BIG1hY2hpbmUuDQo+ID4+Pg0KPiA+Pj4gWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMi0NCj4gPj4gMDYvbXNnMDA0OTkuaHRt
bA0KPiA+Pj4gWzJdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94
ZW4tZGV2ZWwvMjAyMS0NCj4gPj4gMDkvbXNnMDE5MDMuaHRtbA0KPiA+Pj4NCj4gPj4+IC0tLQ0K
PiA+Pj4gdjcgLT4gdjg6DQo+ID4+PiAgMS4gUmViYXNlIGNvZGUgdG8gcmVzb2x2ZSBtZXJnZSBj
b25mbGljdC4NCj4gPj4NCj4gPj4gWW91IG1lbnRpb24gdGhpcyBoZXJlIGJ1dCBub3QgaW4gYW55
IG9mIHRoZSBwYXRjaGVzLiBXaGljaCBsZWF2ZXMNCj4gPj4gcmV2aWV3ZXJzIGd1ZXNzaW5nIHdo
ZXJlIHRoZSByZS1iYXNlIGFjdHVhbGx5IHdhczogUmUtYmFzZXMsIGF0DQo+ID4+IGxlYXN0IHNv
bWV0aW1lcywgYWxzbyBuZWVkIChyZS0pcmV2aWV3aW5nLg0KPiA+Pg0KPiA+DQo+ID4gSSBqdXN0
IGFwcGxpZWQgdGhlIHY3IHRvIHRoZSBsYXRlc3Qgc3RhZ2luZyBicmFuY2gsIHRoaXMgd29yayBo
YXMgbm90DQo+ID4gR2VuZXJhdGVkIGFueSBuZXcgY2hhbmdlIGZvciB0aGlzIHNlcmllcy4gSSBz
aG91bGQgaGF2ZSBkZXNjcmliZWQgaXQNCj4gPiBjbGVhciBvciBub3QgbWVudGlvbmVkIHRoaXMg
aW4gY292ZXIgbGV0dGVyLiBTb3JyeSBmb3IgY29uZnVzaW5nIHlvdSENCj4gDQo+IEJ1dCB5b3Ug
dGFsayBhYm91dCBhIG1lcmdlIGNvbmZsaWN0LiBBbmQgdGhhdCdzIHdoYXQgSSByZWZlciB0byB3
aGVuDQo+IHNheWluZyAibWF5IG5lZWQgKHJlLSlyZXZpZXdpbmciLiBUaGUgc2FtZSBoYXBwZW5l
ZCBkdXJpbmcgZWFybGllcg0KPiB2ZXJzaW9ucyBvZiB0aGUgc2VyaWVzLCBleGNlcHQgdGhlcmUg
SSB3YXMgYXdhcmUgb2Ygd2hhdCB5b3UgbmVlZGVkDQo+IHRvIHJlLWJhc2Ugb3ZlciBiZWNhdXNl
IGl0IHdhcyBjaGFuZ2VzIEkgaGFkIGRvbmUgKGFkZHJlc3NpbmcNCj4gb2JzZXJ2YXRpb25zIG1h
ZGUgd2hpbGUgcmV2aWV3aW5nIHlvdXIgY2hhbmdlcykuIFRoaXMgdGltZSByb3VuZCBJJ20NCj4g
c2ltcGx5IG5vdCBhd2FyZSBvZiB3aGF0IGNoYW5nZShzKSB5b3UgbmVlZGVkIHRvIHJlLWJhc2Ug
b3ZlciAod2hpY2gNCj4gaXMgd2h5IEkgcG9pbnRlZCBvdXQgdGhhdCBpdCBpcyBnZW5lcmFsbHkg
aGVscGZ1bCB0byBpbmRpY2F0ZSBvbiBhDQo+IHBlci1wYXRjaCBiYXNpcyB3aGVuIG5vbi10cml2
aWFsIHJlLWJhc2luZyB3YXMgaW52b2x2ZWQpLg0KPiANCg0KSSBoYWQgdGhvdWdodCBpdCB3YXMg
YSBjb2RlIGNvbmZsaWN0IGJlZm9yZSwgYmVjYXVzZSBvdXIgaW50ZXJuYWwgZ2Vycml0DQpzeXN0
ZW0gbWFya2VkIHRoYXQgdGhpcyBzZXJpZXMgaGFzIGEgbWVyZ2UgY29uZmxpY3QuIEJ1dCB0aGUg
YWN0dWFsDQpzaXR1YXRpb24gaXMgb3VyIGdlcnJpdCBzZXR0aW5nIHBvbGljeSBwcm9ibGVtLiBU
aGVyZSBhcmUgbm8gY29kZSBjb25mbGljdHMNCmluIHRoZXNlIHBhdGNoZXMgdGhlbXNlbHZlcy4g
V2UgYWxzbyBkaWQgbm90IG1vZGlmeSB0aGUgcGF0Y2ggdG8gcmVzb2x2ZQ0KdGhlIGdlcnJpdCBj
b25mbGljdHMuIFJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBpdCBpcyBhIG5ldyBvciBvbGQgdmVyc2lv
biwNCmlmIEkgbW9kaWZ5IHRoZSBwYXRjaCwgSSB3aWxsIHJlbW92ZSB0aGUgcmV2aWV3ZWQtYnku
DQoNClNvcnJ5IGZvciB3cml0aW5nIHRoaXMgYW1iaWd1b3VzIGRlc2NyaXB0aW9uIGluIHRoZSBj
aGFuZ2UgbG9nLg0KDQpDaGVlcnMsDQpXZWkgQ2hlbg0KDQo+IEphbg0K

