Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 707464DC8BF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 15:27:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291623.495093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUr5l-0000HG-5j; Thu, 17 Mar 2022 14:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291623.495093; Thu, 17 Mar 2022 14:27:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUr5l-0000EG-1W; Thu, 17 Mar 2022 14:27:05 +0000
Received: by outflank-mailman (input) for mailman id 291623;
 Thu, 17 Mar 2022 14:27:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YpXL=T4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nUr5j-0000E4-DC
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 14:27:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7d00::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f8d0b81-a5fe-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 15:27:02 +0100 (CET)
Received: from AM6P193CA0082.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::23)
 by DB9PR08MB6682.eurprd08.prod.outlook.com (2603:10a6:10:2a2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Thu, 17 Mar
 2022 14:26:58 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::8f) by AM6P193CA0082.outlook.office365.com
 (2603:10a6:209:88::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.16 via Frontend
 Transport; Thu, 17 Mar 2022 14:26:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 14:26:58 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Thu, 17 Mar 2022 14:26:57 +0000
Received: from 69ea02f73586.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 87C3E9C2-C568-45B5-B49A-CD2E61E96320.1; 
 Thu, 17 Mar 2022 14:26:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 69ea02f73586.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 17 Mar 2022 14:26:51 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM5PR0802MB2402.eurprd08.prod.outlook.com (2603:10a6:203:a1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 14:26:49 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5061.029; Thu, 17 Mar 2022
 14:26:49 +0000
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
X-Inumbo-ID: 4f8d0b81-a5fe-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTbuv1OG2z8KtCobnG44/z7NMNoBKzoTcwYpriokduw=;
 b=8RWRh5iOVPQdfwdQOvsXkQCRhrVFSY6f1rrR128PWhqiF+cvTrL06f70MUj2y4ffayotXVfnh652jZKr4yM6lBhwsVXb6/npwtBrAInVg7/O8zCcn4Dtt2yaxheJOXiNTv4KWW0/um0MlaWBWsektpYN5PW+o/auy7Uv2VN+IDg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1dbc3b5ee19133be
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSG2mB5SCbYYTfxDxsijHBUci4Es6GMha00kP4ZHv+zim/TTPBLUBej7afKLl18AmJ67t8wx5/5D79D8LQBSfvYrG8c8DR4pkZVsTRYQgpG2rsm7/HyHUqooidCQiogISwNVcLhKkeJrwPxk7oxEcFG9it8/3ZqFpOYUNPK0xsbJZQhDdb4H2Xe2fu8kwSo0SCLoiwJST4VZL5Ex1Uo0RJ/0vOVDHRuRspWOgkWmKDRa4WwVXzKMdwB1aqDkyrOEVQNdBs7B4w9JqUZj9OZrZ1OpmLDBOUJjaFOJn+eDi7ZvA9ZGxUfs0R1l2NGyloI/Sz2NUgpXRUv6RWQ0xG7sOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTbuv1OG2z8KtCobnG44/z7NMNoBKzoTcwYpriokduw=;
 b=jf/eHhf1eiYQNYG4mFGPmlWMwxnZSXpay64TKpr+sQYADW1LuUEggzt1+wiSF3FHApgzE3ox7D8IoGOgpuyhLIWGQEtUUEUDZ6AsbzeMMLN/u448KSjXb6LjiYcnmpvlJXgfBOyNDJNb7dfgOMbBj2rsh6ynmgMnlSQdmGnA1N9xf+B56oIoEeMpcX4q5TRlu4kD+Bk2NZ+6Hfa+EM/bmZDJo2EKgjPMbq3NQe9hlE5HoWiJ0FI8cINTMiuXuOq4iIZCKfifGTKtOvWw4eN8jMFDjsjw4Lf1YRTg5zPOsdYOc0x7GTUjpsY+1xP34yozMM+/m0Uxv9JZVkA9sFhV8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTbuv1OG2z8KtCobnG44/z7NMNoBKzoTcwYpriokduw=;
 b=8RWRh5iOVPQdfwdQOvsXkQCRhrVFSY6f1rrR128PWhqiF+cvTrL06f70MUj2y4ffayotXVfnh652jZKr4yM6lBhwsVXb6/npwtBrAInVg7/O8zCcn4Dtt2yaxheJOXiNTv4KWW0/um0MlaWBWsektpYN5PW+o/auy7Uv2VN+IDg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <amc96@srcf.net>, Raphael Ning <raphning@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, David Vrabel <dvrabel@amazon.co.uk>
Subject: Re: [XEN PATCH] evtchn/fifo: Don't set PENDING bit if guest
 misbehaves
Thread-Topic: [XEN PATCH] evtchn/fifo: Don't set PENDING bit if guest
 misbehaves
Thread-Index: AQHYOWUxkkWcdQhaQka74jKAOHn9V6zCXPqAgAFGTQA=
Date: Thu, 17 Mar 2022 14:26:49 +0000
Message-ID: <5B2CF3C1-345B-45C8-8E6E-CC118015F4FA@arm.com>
References:
 <6b84a20b2753130cc62406a0fd14d2708f6f504b.1647455219.git.raphning@amazon.com>
 <e07d0eda-c117-c83e-227e-7a934585f265@srcf.net>
In-Reply-To: <e07d0eda-c117-c83e-227e-7a934585f265@srcf.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0887fdbc-abd7-45bc-d836-08da082231a9
x-ms-traffictypediagnostic:
	AM5PR0802MB2402:EE_|VE1EUR03FT061:EE_|DB9PR08MB6682:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB66829574A6F28AC80AAC34E0E4129@DB9PR08MB6682.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qVebonQsZA1xZdVdQiM4P5MwBj8Dy7ZGIypPrtGxWWM8m5yZijIqfB+n2O+JB74Z9IoXyylwh8fLENaTOaK4gbugducUgvBb/4jdvPaIj4dZRPkhs1MwFwYdahCJsFdYHnV3MeDTmKnrKPVeJZ0ZbWBf6Ui4dodP48HN5kdm56sz7zLluJClsG2DcpfmWCN8qZqerwFkmQ9U9l1tXrqfYmbbaVl7dXr3G6JwIDJKbj7CkcOWhAUdM5mQXjfZGqTRw8/5rGhdcluCXek5RrepMEGD2pW+XgIWs5df0aPPXOAuAXosJEwT/CrXgr/n/OUSSBuDqTyhca0A9KTjRvQhcEWfCUdlaqUm+EvfYXkcGH9+m91jWY9zoj/VDGu/3/5ZYzgzmT8td1K8BtIbbjzXct01HnuqtVYNcdVhpHBVUTtaZB+fg0vWKaaM9ynCNLUl/NNkWhI0R6Aw6MzovLxa7Tp21UedsW0CTSwAca7ig/v6JMeppENcGsLuWRKhdH7AdSt9Sa8NxhUqu1/IjxbBcG6Y/nSo5ZSly25vy2k/nbcrEQI6SZbPgc8N4E9LRK6PWu6hxDrCCYVifL/2EnuDHnyLgGYMx+0jahpNMQLJuACfSPgS13q2ETcpekzGR20DNLxZ0FFqIa+89U572r0iRrWaqQBD1BVGc6mTNnyXn7bUGkw7KDpaf6GksT4WMiuIsxePzrExA2KZfsyh0TRNhzgdAcpxjIZ11+b+SRC+fa8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(6512007)(26005)(38070700005)(2906002)(186003)(2616005)(83380400001)(33656002)(38100700002)(122000001)(6486002)(76116006)(4326008)(64756008)(66476007)(66446008)(66556008)(5660300002)(71200400001)(8936002)(66946007)(91956017)(36756003)(508600001)(110136005)(316002)(54906003)(86362001)(6506007)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A00B23C3F7EBE479B6FE71A3293A0DB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2402
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b7d201eb-7c60-4b89-c189-08da08222cb2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MbwnXGFmf7swJp3LmAdpZYgkTMbfbXZP8HrrVK55gEDvPOQDiI1ozVmUDOVRBGHcnOYgoG1Bj2EKAat+NSh2xJlasSYS0CLm1tBPTqb1gJQUojuiDcGJuPm2o22bZH8eLL9hcjloUQ5o1MzmetK43QHG0N+c02DzaULVfhqdnD7r7UvrB0e9xDbbknor6dTcy8RCteoIPFnI3NGx3ZqxHXvSztINgG9Q7sCNSjQ6N98Z763d9nensmzAOGqrP4InOohWhWnW1WpnA77QxijXIHNf6ZRJPpRPPh+wXODiG5MaUJzhx4R6OehifgOwK52nz+lV8RD0OmdplOB0gkZKjtTFNHjb67cpeAi2Eqr4K9FUSRHH2d8QvSgBeqPJy6/X2N5vsU9/BiWBL6E/JFBjOQODsnQkL5EwIcnoIpmzjmNsHY5/qhFglG07qrnNJsHqS2Lum4rHzPg14H4FRKVooH06WgmbvwezuMQalPKMR7qwAoXCt4EZv1U96G5BGE8xvIdOdhHD73zHEmTf+HEy8Ddc/+z9aLWYReXoGpcHzWhgf0t7yam+4atxF6F6VruofGwUo2v8BwVMMrtwBuWRRBDaz6VIzy7LylsextaHfhcnUERVcG1fYiUs2PHb/qTDhfbntGL/T2faoivdsdfvpaczXYbBfM4K3Hr25XFG0rxfrlsYdCbjdzNA+mn1rLKH
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(508600001)(6486002)(2906002)(54906003)(110136005)(316002)(86362001)(8676002)(82310400004)(4326008)(70206006)(33656002)(40460700003)(70586007)(5660300002)(36860700001)(6512007)(83380400001)(8936002)(336012)(186003)(26005)(47076005)(2616005)(6506007)(107886003)(36756003)(81166007)(356005)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 14:26:58.0377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0887fdbc-abd7-45bc-d836-08da082231a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6682

DQoNCj4gT24gMTYgTWFyIDIwMjIsIGF0IDE4OjU4LCBBbmRyZXcgQ29vcGVyIDxhbWM5NkBzcmNm
Lm5ldD4gd3JvdGU6DQo+IA0KPiBPbiAxNi8wMy8yMDIyIDE4OjM4LCBSYXBoYWVsIE5pbmcgd3Jv
dGU6DQo+PiBGcm9tOiBSYXBoYWVsIE5pbmcgPHJhcGhuaW5nQGFtYXpvbi5jb20+DQo+PiANCj4+
IEN1cnJlbnRseSwgZXZ0Y2huX2ZpZm9fc2V0X3BlbmRpbmcoKSB3aWxsIG1hcmsgdGhlIGV2ZW50
IGFzIFBFTkRJTkcgZXZlbg0KPj4gaWYgaXQgZmFpbHMgdG8gbG9jayB0aGUgRklGTyBldmVudCBx
dWV1ZShzKSwgb3IgaWYgdGhlIGd1ZXN0IGhhcyBub3QNCj4+IGluaXRpYWxpemVkIHRoZSBGSUZP
IGNvbnRyb2wgYmxvY2sgZm9yIHRoZSB0YXJnZXQgdkNQVS4gQSB3ZWxsLWJlaGF2ZWQNCj4+IGd1
ZXN0IHNob3VsZCBuZXZlciB0cmlnZ2VyIGVpdGhlciBvZiB0aGVzZSBjYXNlcy4NCj4+IA0KPj4g
VGhlcmUgaXMgbm8gZ29vZCByZWFzb24gdG8gc2V0IHRoZSBQRU5ESU5HIGJpdCAodGhlIGd1ZXN0
IHNob3VsZCBub3QNCj4+IGRlcGVuZCBvbiB0aGlzIGJlaGF2aW91ciBhbnl3YXkpIG9yIGNoZWNr
IGZvciBwb2xsZXJzIGluIHN1Y2ggY29ybmVyDQo+PiBjYXNlcywgc28gc2tpcCB0aGF0LiBJbiBm
YWN0LCBib3RoIHRoZSBjb21tZW50IGFib3ZlIHRoZSBmb3IgbG9vcCBhbmQNCj4+IHRoZSBjb21t
aXQgbWVzc2FnZSBmb3INCj4+IA0KPj4gNDFhODIyYzM5MjYzIHhlbi9ldmVudHM6IHJld29yayBm
aWZvIHF1ZXVlIGxvY2tpbmcNCj4+IA0KPj4gc3VnZ2VzdCB0aGF0IHRoZSBiaXQgc2hvdWxkIGJl
IHNldCBhZnRlciB0aGUgRklGTyBxdWV1ZShzKSBhcmUgbG9ja2VkLg0KPj4gDQo+PiBUYWtlIHRo
ZSBvcHBvcnR1bml0eSB0byByZW5hbWUgdGhlIHdhc19wZW5kaW5nIHZhcmlhYmxlIChmbGlwcGlu
ZyBpdHMNCj4+IHNlbnNlKSBhbmQgc3dpdGNoIHRvIHRoZSBzdGFuZGFyZCBib29sIHR5cGUuDQo+
PiANCj4+IFN1Z2dlc3RlZC1ieTogRGF2aWQgVnJhYmVsIDxkdnJhYmVsQGFtYXpvbi5jby51az4N
Cj4+IFNpZ25lZC1vZmYtYnk6IFJhcGhhZWwgTmluZyA8cmFwaG5pbmdAYW1hem9uLmNvbT4NCj4+
IC0tLQ0KPj4geGVuL2NvbW1vbi9ldmVudF9maWZvLmMgfCA4ICsrKystLS0tDQo+PiAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9ldmVudF9maWZvLmMgYi94ZW4vY29tbW9uL2V2ZW50X2ZpZm8uYw0K
Pj4gaW5kZXggZWQ0ZDNiZWIxMGYzLi42Yzc0Y2NlYmViYjcgMTAwNjQ0DQo+PiAtLS0gYS94ZW4v
Y29tbW9uL2V2ZW50X2ZpZm8uYw0KPj4gKysrIGIveGVuL2NvbW1vbi9ldmVudF9maWZvLmMNCj4+
IEBAIC0xNjUsNyArMTY1LDcgQEAgc3RhdGljIHZvaWQgY2ZfY2hlY2sgZXZ0Y2huX2ZpZm9fc2V0
X3BlbmRpbmcoDQo+PiAgICAgdW5zaWduZWQgaW50IHBvcnQ7DQo+PiAgICAgZXZlbnRfd29yZF90
ICp3b3JkOw0KPj4gICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+PiAtICAgIGJvb2xfdCB3YXNf
cGVuZGluZzsNCj4+ICsgICAgYm9vbF90IGNoZWNrX3BvbGxlcnMgPSBmYWxzZTsNCj4gDQo+IENv
bnNpZGVyaW5nIHlvdXIgY29tbWl0IG1lc3NhZ2UsIGRpZCB5b3UgaW50ZW5kIHRvIGNoYW5nZSB0
aGlzIHRvIGJvb2w/DQo+IA0KPiBDYW4gYmUgZml4ZWQgb24gY29tbWl0LiAgQWNrZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IA0KDQpJ4oCZdmUgdGVz
dGVkIG9uIHRoZSBBUk0gc2lkZSwgSeKAmXZlIHN0YXJ0ZWQvZGVzdHJveWVkIGZldyBndWVzdHMg
ZnJvbSBEb20wLCBjb25uZWN0IHRvIHRoZSBjb25zb2xlLCBydW4NCnNvbWUgbmV0d29yayBjb21t
dW5pY2F0aW9ucyBiZXR3ZWVuIGd1ZXN0IGFuZCBEb20wLCBldmVyeXRoaW5nIHdvcmtzOg0KDQpU
ZXN0ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KQ2hlZXJz
LA0KTHVjYQ0KDQo+IH5BbmRyZXcNCj4gDQo+IFAuUy4gRGF2aWQgLSBkbyB5b3Ugd2FudCB5b3Vy
IG1haW50YWluZXJzaGlwIGJhY2s/ICBOb25lIG9mIHRoaXMgY29kZQ0KPiBoYXMgdW5kZXJnb25l
IGFueSBtYWpvciBjaGFuZ2VzIHNpbmNlIHlvdSB3cm90ZSBpdC4NCj4gDQoNCg==

