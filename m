Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A604B0850
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 09:32:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269653.463741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI4sJ-00078c-0S; Thu, 10 Feb 2022 08:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269653.463741; Thu, 10 Feb 2022 08:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI4sI-00076U-T8; Thu, 10 Feb 2022 08:32:22 +0000
Received: by outflank-mailman (input) for mailman id 269653;
 Thu, 10 Feb 2022 08:32:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Layc=SZ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nI4sH-00075Y-Cf
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 08:32:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5f9fdfa-8a4b-11ec-8eb8-a37418f5ba1a;
 Thu, 10 Feb 2022 09:32:19 +0100 (CET)
Received: from AS8PR07CA0050.eurprd07.prod.outlook.com (2603:10a6:20b:459::7)
 by AM0PR08MB5124.eurprd08.prod.outlook.com (2603:10a6:208:161::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 08:32:16 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:459:cafe::a9) by AS8PR07CA0050.outlook.office365.com
 (2603:10a6:20b:459::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.6 via Frontend
 Transport; Thu, 10 Feb 2022 08:32:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 08:32:15 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Thu, 10 Feb 2022 08:32:15 +0000
Received: from 8fc8ec649c53.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AC366E21-794B-4B5F-98D6-439D088971D5.1; 
 Thu, 10 Feb 2022 08:32:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8fc8ec649c53.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Feb 2022 08:32:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB3614.eurprd08.prod.outlook.com (2603:10a6:803:85::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 08:32:06 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6%4]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 08:32:06 +0000
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
X-Inumbo-ID: f5f9fdfa-8a4b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1YE3qSfKzpjZtg4+cS5OtlFt5WFA204Qbe0ARjTYVA=;
 b=4y7fVrqA4M5xl8gR9Bm2t6GSqhMWJVsjETLgoRX9KYiI/1RmaNt/4zKBn9ACBXxf/n8Dm3qQ1/idFQWLHx9uvQ3qBT3A+40V9EdxGoEFSubenCxgSf5FGLUeLj71rPjlS4SHlZfDnRm+6nlf0NzsLBCID8QZT7y0I18kqggTnn8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: bf0dedbfaf104519
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hn7WUnMN4MvfXoY0SbSY12+pnT8kax/ouFwaPK+r8Psfv6S4Q4HmJtjpd/0LtDEJpTScXWyhKi6Vyg8EKF5f3DjA0X7wkPRzhDoPVpjAmg+MuknrsF/0M9mDDL30a6A0j+jrW7TJFBWcP6qceIC5QzaQeDIUDfM7C0ufkj485Sz3k1I9w03+H3vY8ho6bML9OjEVq7BFmMe7Y0BrDyu18AcBnDZj4cVVI3ySo86gNuETOHhjO6O4gQCNTTPjhI6+l1ALwXQnGW+g+bNO9OgfKdPyWgMEdZ8tmawJr1Z2w2/eh1OnDtxUV/frvZbYKcDq8BBuKb6hpxmnSPE7I3mhdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1YE3qSfKzpjZtg4+cS5OtlFt5WFA204Qbe0ARjTYVA=;
 b=CxTxXw1XhGK/8XjX9uvfGp5jp+7XgN+68DdYUrzVhnGgKDnQUk6ByzOEb1LBmOGHJzYivoK1t0a/v+03a+8J+BhAB9JwWulGzoLEN26FpG5b3MFy+Qzagqt3IlWhnTyy66Bj2zgC8hgrKgMn1K9ZPaeNxfmf+Sleaaa7I+jHUXKzT5GqswqMaZvJmqNz4JgVqOofiH/Yl7fTsPcu8nS6lWuCyxWmqLnb4pjqVKruAukbV1MWMfgXumrVaqn1dkyXNVZOR6T8VVezHdYuGEskSCLfM7AS7Duu3g/+peKnGAy87sfukNeE5wCFvEAoMjP0b0ZeFFKM8HqbKKRiSXPRSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1YE3qSfKzpjZtg4+cS5OtlFt5WFA204Qbe0ARjTYVA=;
 b=4y7fVrqA4M5xl8gR9Bm2t6GSqhMWJVsjETLgoRX9KYiI/1RmaNt/4zKBn9ACBXxf/n8Dm3qQ1/idFQWLHx9uvQ3qBT3A+40V9EdxGoEFSubenCxgSf5FGLUeLj71rPjlS4SHlZfDnRm+6nlf0NzsLBCID8QZT7y0I18kqggTnn8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: tosher 1 <akm2tosher@yahoo.com>
CC: Jan Beulich <jbeulich@suse.com>, "roger.pau@citrix.com"
	<roger.pau@citrix.com>, "xadimgnik@gmail.com" <xadimgnik@gmail.com>,
	"oleksandr_andrushchenko@epam.com" <oleksandr_andrushchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: PCI passthrough support for PVH mode
Thread-Topic: PCI passthrough support for PVH mode
Thread-Index: AQHYGx832+ucoEGI2UqojmxHytIiMKyHuoSAgAStNACAABNoAA==
Date: Thu, 10 Feb 2022 08:32:06 +0000
Message-ID: <2CDAD7A1-A628-4491-9DE0-1F4D5D9FF1A7@arm.com>
References: <709142925.628001.1644127197288.ref@mail.yahoo.com>
 <709142925.628001.1644127197288@mail.yahoo.com>
 <0e64c52c-1e9c-e89b-abb8-50171d885926@suse.com>
 <303292590.682317.1644477758255@mail.yahoo.com>
In-Reply-To: <303292590.682317.1644477758255@mail.yahoo.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8d91019b-69bd-4901-c7e6-08d9ec6fd818
x-ms-traffictypediagnostic:
	VI1PR08MB3614:EE_|VE1EUR03FT027:EE_|AM0PR08MB5124:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB51245FA1C4BDEF8766EB1EF19D2F9@AM0PR08MB5124.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bY+cFZOWNcBDr8391QvBdYdFp7tYRqUYOgXr8O7VGmDW6Jd04YSvhZrJlp72QBJfXQlEB7/TV66Yk2rpgmSToeHhR1bGYiXRHXN7q1ftMdqLK3fCiMUa5PK2xTWO7x40SGdumTkQTpiaIoEi7itwCExaqk2W/1VwVrvjuoMqOC21AaogiWAf/ne+MFVA2EAJ5C4vFN8HV5McXUT69KS5I4MSsulCY/9Xb1MDpyx9UauwEXVrG+ao3R/LdgVynXNJUcMvROZdEoc5VXUIRkxrLnSfvj6BLgX3Irwr32PSj+WwoWQnfaTkbsQYefChS5Mq0zJEnmbvQACGb44eNR0vPlYZbWCqIB3Jw+EJlSCuGH3qK3SYGe60D4vAQhJ6Igdhi2KD59WY/INep53rjvDBvBde8h8lNn0HH5ihRIEnAx6ioK6Jf5tEDJCKyFrX9L8CBPwM9APqWfI8WrZ2r3xQImXMg+II7J1QYbnnU894rYTuS7ebmt9Gqrjw4n6JXI1a4KYxd8Lvku4dmTq0KQQB9Cf8/lJ+F5hLScMFYbnQ2Ieiotgl06AmChgNGvIr8YocVuAxpoqQSMUJjV1KBZiu06EcclI6zYiftBge1i/5Bf/9svAgV0lrpzrIXUtAjhtn8gbzScF+V0SZiqaNAWNnkAyurW7R78htCVJFg4GhyJ7E4WuMJzhkA5xrN4K8pjO8m1d7pQVqjk23yq5P/UMoMR/JsbaH9XRSI3GW5IAnrX4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(64756008)(5660300002)(53546011)(66476007)(86362001)(38100700002)(66446008)(8936002)(6486002)(6506007)(8676002)(6512007)(4326008)(91956017)(83380400001)(316002)(76116006)(2616005)(2906002)(38070700005)(36756003)(54906003)(6916009)(66946007)(508600001)(122000001)(33656002)(186003)(71200400001)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5560930DB568634F81CEA828114A007F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3614
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	25a669aa-4209-46d5-b471-08d9ec6fd27e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2A6cKTn9M2GDTJC4gv1dJr+8O41YPdPt/LEVQ3zTtOSpRmoeUcVGFFSAm5NSFE2m1bN4w+x15PCCOzOrHaytmQl3L3RVcfZ1ih7IGCZajnAtU6dR8lZYXULMABZUDiNxJ09y9ID7Bf+jReAk2nXKc9oI8nRBy0jF3JOIoZm6U7JeXbtI5I4WKs3oDkLRgKjsJpb5KmFM6U+2Tc6csGRest57JTshF39C/bCbYpkjp1Yg7Qaht15T8vp4/sEHOBOQg5o2O+cgLRxyE0ctTQgdx2vLPPUe84Fr6APD3oOcYpez27xMXqCR2TuyHBqxbBB+pzWS9gjk72YQZdeWNtzZ58KV4o4q9cvBGvu/nQxGCvKOqNBLLQNIMZGZhXyy9WreFBi2NcwSpzuym+oXlGzAYoxmu7e6iB4ysSlY7Pt72g3mNG4dHVP5uol1iQZufjQQJHpaFCb4AFowkE039tBdZdogm3qHGA56InmPb0GKb2bOgQvLZzXHVxAfT+su1kGRBBe7bQRCUekmbqNZqfX6YYDF9JabLCkgBO1dwCKnKFDS68GIWnm+Azb+xS/+gtzhfqYjYfjm/wl5azXKSu3q3/v97pMzyS5q0nXzZV0DEnhy6t9IQfEOxKmbC/CzPZb4ZocbWC3HYe5cviMxwB5frqOFRIPt6GpUevwNfj6Qrtk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(6862004)(508600001)(5660300002)(2616005)(6486002)(2906002)(54906003)(70586007)(316002)(356005)(36756003)(33656002)(8676002)(8936002)(70206006)(4326008)(26005)(6512007)(53546011)(6506007)(81166007)(86362001)(47076005)(83380400001)(40460700003)(336012)(82310400004)(186003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 08:32:15.9569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d91019b-69bd-4901-c7e6-08d9ec6fd818
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5124

SGkgTWlocmFiLA0KDQo+IE9uIDEwIEZlYiAyMDIyLCBhdCAwNzoyMiwgdG9zaGVyIDEgPGFrbTJ0
b3NoZXJAeWFob28uY29tPiB3cm90ZToNCj4gDQo+IEhpIEphbiwNCj4gDQo+IFRoYW5rcyBmb3Ig
bGV0dGluZyBtZSBrbm93IHRoaXMgc3RhdHVzLg0KPiANCj4gSSBhbSB3b25kZXJpbmcgaWYgUENJ
IHBhc3N0aHJvdWdoIGlzIGF0IGxlYXN0IGF2YWlsYWJsZSBpbiBBcm0gZm9yIG90aGVyIHZpcnR1
YWxpemF0aW9uIG1vZGVzIGxpa2UgUFYsIEhWTSwgb3IgUFZIVk0uIEZvciBleGFtcGxlLCBpcyBp
dCBwb3NzaWJsZSBmb3Igc29tZW9uZSB0byBhdHRhY2ggYSBQQ0kgZGV2aWNlIHRvIGEgZ3Vlc3Qg
ZG9tYWluIG9uIGFuIEFybSBtYWNoaW5lIGFuZCB1c2UgdGhhdCBkb21haW4gYXMgYSBkcml2ZXIg
ZG9tYWluLCBsaWtlIHdlIGNhbiBkbyB3aXRoIHRoZSBYZW4gb24geDg2Pw0KDQpPbiBhcm0gdGhl
cmUgaXMgb25seSBvbmUgdmlydHVhbGl6YXRpb24gbW9kZSB3aGljaCBpcyBlcXVpdmFsZW50IHRv
IHg4NiBIVk0uDQoNClJlZ2FyZGluZyBQQ0kgcGFzc3Rocm91Z2ggb24gYXJtLCB0aGlzIGlzIGN1
cnJlbnRseSBhIHdvcmsgaW4gcHJvZ3Jlc3MgdGhhdCBpcyBiZWluZyB1cHN0cmVhbSBzbyBpdCBp
cyBub3QgYXZhaWxhYmxlIGZvciBub3cuDQpPbmNlIGl0IHdpbGwgYmUgbWVyZ2VkIGluIFhlbiwg
aXQgd2lsbCBiZSBwb3NzaWJsZSB0byBhc3NpZ24gYSBQQ0kgZGV2aWNlIHRvIGEgZ3Vlc3Qgc28g
eW91IGNvdWxkIHRoZW4gbWFrZSBhIOKAnGRyaXZlciBkb21haW7igJ0gdXNpbmcgdGhlIGZ1bmN0
aW9uYWxpdHkuDQoNClJlZ2FyZHMNCkJlcnRyYW5kDQoNCj4gDQo+IFBsZWFzZSBsZXQgbWUga25v
dy4NCj4gDQo+IFJlZ2FyZHMsDQo+IE1laHJhYg0KPiANCj4gDQo+IA0KPiANCj4gT24gTW9uZGF5
LCBGZWJydWFyeSA3LCAyMDIyLCAwMjo1Nzo0NSBBTSBFU1QsIEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6IA0KPiANCj4gDQo+IA0KPiANCj4gDQo+IE9uIDA2LjAyLjIwMjIg
MDY6NTksIHRvc2hlciAxIHdyb3RlOg0KPiANCj4+IEJhY2sgaW4gdGhlIHllYXIgMjAyMCwgSSB3
YXMgaW5xdWlyaW5nIGludG8gdGhlIHN0YXR1cyBvZiBQQ0kgcGFzc3Rocm91Z2ggc3VwcG9ydCBm
b3IgUFZIIGd1ZXN0cy4gQXQgdGhhdCB0aW1lLCBBcm0gcGVvcGxlIHdlcmUgd29ya2luZyBvbiB1
c2luZyB2UENJIGZvciBndWVzdCBWTXMuIFRoZSBleHBlY3RhdGlvbiB3YXMgdG8gcG9ydCB0aGF0
IGltcGxlbWVudGF0aW9uIHRvIHg4NiBvbmNlIHJlYWR5Lg0KPj4gDQo+PiBJIHdhcyB3b25kZXJp
bmcgaWYgdGhlcmUgaXMgYW55IHVwZGF0ZSBvbiB0aGlzLiBEb2VzIFhlbiBzdXBwb3J0IFBDSSBw
YXNzdGhyb3VnaCBmb3IgUFZIIG1vZGUgeWV0PyBQbGVhc2UgbGV0IG1lIGtub3cuDQo+IA0KPiAN
Cj4gVGhlIEFybSB3b3JrIGlzIHN0aWxsIFdJUCwgYW5kIGluIGhvdyBmYXIgaXQncyBnb2luZyB0
byBiZSBzdHJhaWdodGZvcndhcmQgdG8NCj4gcmUtdXNlIHRoYXQgY29kZSBmb3IgeDg2IGlzIHN0
aWxsIHVuY2xlYXIgKGFmYWljdCBhdCBsZWFzdCkuDQo+IA0KPiBKYW4NCj4gDQo+IA0KPiANCg0K

