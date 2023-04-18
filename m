Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F586E65A5
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 15:16:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522870.812516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1polBy-0000Ya-Eb; Tue, 18 Apr 2023 13:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522870.812516; Tue, 18 Apr 2023 13:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1polBy-0000WZ-Bf; Tue, 18 Apr 2023 13:16:18 +0000
Received: by outflank-mailman (input) for mailman id 522870;
 Tue, 18 Apr 2023 13:16:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uBdk=AJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1polBx-0000WT-LU
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 13:16:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 332985fb-ddeb-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 15:16:16 +0200 (CEST)
Received: from DB6PR0202CA0042.eurprd02.prod.outlook.com (2603:10a6:4:a5::28)
 by DU0PR08MB9461.eurprd08.prod.outlook.com (2603:10a6:10:42f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 13:16:14 +0000
Received: from DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::a5) by DB6PR0202CA0042.outlook.office365.com
 (2603:10a6:4:a5::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Tue, 18 Apr 2023 13:16:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT045.mail.protection.outlook.com (100.127.142.142) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.20 via Frontend Transport; Tue, 18 Apr 2023 13:16:14 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Tue, 18 Apr 2023 13:16:14 +0000
Received: from ab814da23dff.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E83C93CE-C02D-4322-B749-4B2C5AA88D15.1; 
 Tue, 18 Apr 2023 13:16:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ab814da23dff.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Apr 2023 13:16:07 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB7874.eurprd08.prod.outlook.com (2603:10a6:150:5d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 13:16:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Tue, 18 Apr 2023
 13:16:04 +0000
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
X-Inumbo-ID: 332985fb-ddeb-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0ff2h2XgdtvjQKzZ02iKbqHkgDXfbLwDdKltdkduoo=;
 b=NNkkSdWGzdQyNYbRdENc73zvFkWf8gwirOcVHfYhPh/dfjAsQylkqEXjE1SdmI84sRogWsKKK4z23kfVVQ7RVcATERZg9dekdK3jgDd/EqeETRq37w/7aW1yXBggISpwsHUPvGA/83Vd9c5xTvcqPEaiUlXrgOGYYHhmv/RKfzU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1d0deb67e7bd23cb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmVf/P1vW0tDnm7rJHo0pc6Lb+XwmMXU6AgIOhN0LRizbaT8h3xrcKoTM7ds29OVN17D6OSxkNxyiwoCRf0gOtLmvjLtB5B2ZMAqGo+O3CTwa4J8laeJALD0DIoD3NcOn5iGH8udmQ6O4n/statFmWjjSSZE3zZjAZ5jyyAmhv3zJ8obq+b/5yPHKGIe9adcBhpNpyUXgDzHOUgTCXFE4R8KrAJKRSVIQ7Zu40QE5vQIIuSdKaPqGfn70OSDl/0rS2CeLhfcRM3TezD26NG8V8jEnD08F+laxBkJOlZiEDUXcyjKwMYYWtLs2ENWh4iv5m/grQLmVO04YrTtTJuL5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0ff2h2XgdtvjQKzZ02iKbqHkgDXfbLwDdKltdkduoo=;
 b=YyI+Q+/LxfcX6zP6RYuP7c3i+4gAM9++1CEBLozvI/Bh2MI7WJzsJKYTqYFl9hp/JcV1GuXZ4nmHhrlYOIo6SnBj4oS8+ljdWhPy9b9Z41IxKnSvcfmPKtuxSDCUId7AueekPcZeFQ+KC/SznwIy0I19jNGLydQS1SC4AdJAGLrRkg7bud5U8hVkerrjmi45HEELGREybsAQFNGZ71o/ABAARqk1obuBYgB1cK6ldXU3hcwxLBCusQwDC6CyuD6F9hx9njbSk9XrzmzpbQkpcLwaNMKCb8WmVNM2uoooz05TTUYNUg80CLclU5SrgVANXOTj7lIz77gqtGcor2w8cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0ff2h2XgdtvjQKzZ02iKbqHkgDXfbLwDdKltdkduoo=;
 b=NNkkSdWGzdQyNYbRdENc73zvFkWf8gwirOcVHfYhPh/dfjAsQylkqEXjE1SdmI84sRogWsKKK4z23kfVVQ7RVcATERZg9dekdK3jgDd/EqeETRq37w/7aW1yXBggISpwsHUPvGA/83Vd9c5xTvcqPEaiUlXrgOGYYHhmv/RKfzU=
From: Henry Wang <Henry.Wang@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Community Manager <community.manager@xenproject.org>
Subject: RE: [PATCH] CHANGELOG: add gnttab_max_{maptrack_,}frames option
 changes
Thread-Topic: [PATCH] CHANGELOG: add gnttab_max_{maptrack_,}frames option
 changes
Thread-Index: AQHZcfQO8iHeqtg3REq5C5iSSt7pEa8xCqxw
Date: Tue, 18 Apr 2023 13:16:03 +0000
Message-ID:
 <AS8PR08MB79919D898B50404869AF4A3E929D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230418124748.17881-1-roger.pau@citrix.com>
In-Reply-To: <20230418124748.17881-1-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 19F81B9DDFB1B748919E88B71CDFCC5E.0
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB7874:EE_|DBAEUR03FT045:EE_|DU0PR08MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: 3caf9491-f163-4588-167f-08db400f1657
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7tnzi6aoXzb8jlcqezVb+lUmLwSKZsr65P4+pikrltgcwmeI1k1KgCBHbht7nYdb+yruaF/1b55O9PGAnhsFWh1hTJQFzY81oAf/262cHNR+ugThRu/SB6cOSufGbKtwAMX01bXmy1+tpM65geYhCSdulQTOa/ZeRIiw3Cb9Aj7KHi2VdWYP9HgWYsRU5fDoHpYaDNfva8LlU6sjPEeEpooweH/cNxKfviwI2LhCdmm0b+BpAs4QJrcXQpGduCu1bw8EXlP0rRIe7Sqqv7v2Z6tEqiUHCDe5+z5bXM75OWhNLzWDDMBTUEKmFGGL028YrsopEK0iS5E1G4bH5VD+uWMPERYbYHOA95GnnmpU3l5VQ9zQi5t2KgFsZzdQqv2gL95VdMEPwzHKpIgJY1zp+Hv9/eF22B/hGeyROm84MWw81dc3m4woQEB3Begn22KGIXoUYEdhYXXLZnOSkAYS+0Yj3hXHMfb2VanJr+NWH7jAt2Jiol7lr+4uAflZkV+IhXfl0tMFAZz+qtQlH8CuhgxarBOobzbi7NRjfbJDiG9MGX0BvRU2lemLia80Uq5pxuaLgffaY4lkAqmY1t0QntVP2Na83E01tYDgmxOAJWJGM9oMAX3YyaB+z/JTLQGrSC+64eN+bhkL+tBjn2BASxC8Kcq3hvO+pgbTe3Tz3qYrpp+6/MWmkjFIsXZA6bOs
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(33656002)(76116006)(4326008)(110136005)(316002)(66446008)(64756008)(66946007)(66556008)(66476007)(71200400001)(7696005)(478600001)(41300700001)(5660300002)(8676002)(55016003)(8936002)(2906002)(52536014)(38070700005)(86362001)(122000001)(38100700002)(6506007)(9686003)(26005)(186003)(83380400001)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7874
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8803d16b-776e-413c-b924-08db400f0ffe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	63kJmLp8gIG1dFWWfpFnBtxUyXtfTuy7rNpcXGvAd+I5oqZFY6AOVa7ns1QJjrv9XgPE4XUaGQO/+1kCLp6jWL/mMi5Ex9/6aVtTbvl3DiDNQIYfAVLYP8bf6tLKcwHo8xyOGQQnJheaEI9sJ9yirIguKCsdOSkVmVJniR5HVpUFhzRAfrB8TepDhCh3wLqIdmLx6B2h4xNGyhxATAv/mgAxjZk9fyKsmX5wDJpAWN6NH3g3nmJ/NICiN49yX4Y750gtAJ4D6wG3IIybvS4zDXdcrRgRG4Hrk1nV5nDRN8TcaqVgS9Gi1/KvMj0Bb+ocLIWkpQASIY/YoidsIF5QKrjgaxmezMMUlqjd//EaCWJBNV/gWHftghn+mAlKMqwFxcoaVPixGdq051xwwPpkP532Ul0cNAu8EP3UKoGCjtcVWijQ5I+5pjrtlJrMFSTE7J84kq/zkrDiqPeLEKNW/dKeoUGiHfCTqyDXgJkfY6MGLNWcKmYBbMkSpb8kNbOAfbfeD9VvdYwBCdZrIibKt8jQP+W5EDBQ/OaSQzviyKbe2pH50goac8rt7g3O5ZBRTJHKfZrEEbUoO8C634l/2lcr3CHavzLn3pAIPrEP6FcILjkjA863Lxax/8GTY2DQKF6ZTR3P7VLlDuRn6/JqYww16lyTAFoSs4Irv0nGJxWN/sPg2/YBMcBvNt3ZC0PCEN7vGmheAtkGOTQVDJSc4Ki3RRRvmBjWYcL6eLpjoJ7n02nVvCE9AcGiJGxHdAZsrhNu4EQvgEEINeR8WMW6uA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(40480700001)(55016003)(40460700003)(70586007)(41300700001)(316002)(70206006)(4326008)(52536014)(81166007)(82740400003)(356005)(2906002)(8676002)(8936002)(5660300002)(336012)(83380400001)(6506007)(26005)(186003)(110136005)(9686003)(36860700001)(7696005)(478600001)(47076005)(86362001)(33656002)(82310400005)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 13:16:14.6394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3caf9491-f163-4588-167f-08db400f1657
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9461

SGkgUm9nZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9nZXIg
UGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBDSEFO
R0VMT0c6IGFkZCBnbnR0YWJfbWF4X3ttYXB0cmFja18sfWZyYW1lcyBvcHRpb24NCj4gY2hhbmdl
cw0KPiANCj4gTm90ZSBpbiB0aGUgY2hhbmdlbG9nIHRoYXQgdGhlIHB1cnBvc2Ugb2YNCj4gZ250
dGFiX21heF97bWFwdHJhY2tfLH1mcmFtZXMgY29tbWFuZCBsaW5lIG9wdGlvbnMgaGFzIGJlZW4g
Y2hhbmdlZC4NCg0KVGhhbmtzIGZvciByZW1lbWJlcmluZyB0aGlzIQ0KDQo+IA0KPiBGaXhlczog
YjJlYTgxZDJiOTM1ICgneGVuL2dyYW50czogcmVwdXJwb3NlIGNvbW1hbmQgbGluZSBtYXggb3B0
aW9ucycpDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPg0KPiAtLS0NCj4gIENIQU5HRUxPRy5tZCB8IDIgKysNCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9DSEFOR0VMT0cubWQgYi9DSEFO
R0VMT0cubWQNCj4gaW5kZXggYzk3OGNmZDliNjhmLi4yYTdlNjI0OTUxMDQgMTAwNjQ0DQo+IC0t
LSBhL0NIQU5HRUxPRy5tZA0KPiArKysgYi9DSEFOR0VMT0cubWQNCj4gQEAgLTE0LDYgKzE0LDgg
QEAgVGhlIGZvcm1hdCBpcyBiYXNlZCBvbiBbS2VlcCBhDQo+IENoYW5nZWxvZ10oaHR0cHM6Ly9r
ZWVwYWNoYW5nZWxvZy5jb20vZW4vMS4wLjAvKQ0KPiAgICAgLSBCdXMtbG9jayBkZXRlY3Rpb24s
IHVzZWQgYnkgWGVuIHRvIG1pdGlnYXRlIChieSByYXRlLWxpbWl0aW5nKSB0aGUgc3lzdGVtDQo+
ICAgICAgIHdpZGUgaW1wYWN0IG9mIGEgZ3Vlc3QgbWlzdXNpbmcgYXRvbWljIGluc3RydWN0aW9u
cy4NCj4gICAtIHhsL2xpYnhsIGNhbiBjdXN0b21pemUgU01CSU9TIHN0cmluZ3MgZm9yIEhWTSBn
dWVzdHMuDQo+ICsgLSBSZXB1cnBvc2UgY29tbWFuZCBsaW5lIGdudHRhYl9tYXhfe21hcHRyYWNr
Xyx9ZnJhbWVzIG9wdGlvbnMgc28NCj4gdGhleSBkb24ndA0KPiArICAgY2FwIHRvb2xzdGFjayBw
cm92aWRlZCB2YWx1ZXMuDQoNCkhvd2V2ZXIsIHNlZWluZyB0aGUgdGl0bGUgYW5kIHRoZSAicmVw
dXJwb3NlIiBoZXJlLCBtYXkgSSBwbGVhc2Ugc3VnZ2VzdA0KYWRkaW5nIGEgIiMjIyBDaGFuZ2Vk
IiBzZWN0aW9uIG9uIHRvcCBvZiB0aGUgIiMjIyBBZGRlZCIgc2VjdGlvbiBhbmQNCm1vdmUgdGhl
ICJnbnR0YWJfbWF4X3ttYXB0cmFja18sfWZyYW1lcyBvcHRpb24gY2hhbmdlcyIgZW50cnkgdGhl
cmU/DQoNCkkgdGhpbmsgdGhpcyBjYW4gYmUgZG9uZSBvbiBjb21taXQgaWYgeW91IGFncmVlIChh
bmQgYWxzbyB0aGUgY29tbWl0dGVyDQp3b3VsZCBsaWtlIHRvIGRvIHRoZSBmYXZvciBmb3IgdXMp
LCBzbzoNCg0KQWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCg0KS2lu
ZCByZWdhcmRzLA0KSGVucnkNCg==

