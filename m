Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B8166946C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 11:40:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477179.739765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGHTO-000818-Nc; Fri, 13 Jan 2023 10:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477179.739765; Fri, 13 Jan 2023 10:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGHTO-0007yR-Jr; Fri, 13 Jan 2023 10:39:46 +0000
Received: by outflank-mailman (input) for mailman id 477179;
 Fri, 13 Jan 2023 10:39:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGHTM-0007yJ-Nj
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 10:39:44 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2059.outbound.protection.outlook.com [40.107.241.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9688d219-932e-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 11:39:42 +0100 (CET)
Received: from DB3PR06CA0010.eurprd06.prod.outlook.com (2603:10a6:8:1::23) by
 PAVPR08MB9435.eurprd08.prod.outlook.com (2603:10a6:102:317::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Fri, 13 Jan 2023 10:39:38 +0000
Received: from DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::bc) by DB3PR06CA0010.outlook.office365.com
 (2603:10a6:8:1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.14 via Frontend
 Transport; Fri, 13 Jan 2023 10:39:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT031.mail.protection.outlook.com (100.127.142.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 10:39:38 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Fri, 13 Jan 2023 10:39:38 +0000
Received: from cf384ea11bf4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EDD1FBEC-2517-4900-B832-14673476D204.1; 
 Fri, 13 Jan 2023 10:39:27 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cf384ea11bf4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Jan 2023 10:39:27 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by DBAPR08MB5574.eurprd08.prod.outlook.com (2603:10a6:10:1ab::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 10:39:24 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab%7]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 10:39:24 +0000
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
X-Inumbo-ID: 9688d219-932e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raE3IienIKJdUrPrC4yNOVKHkWXRO/TA3YJbKrq+SzQ=;
 b=SgLOifJWhlgYeg4m9qecvihR2govRVj/d26cLy7Z5OZrpmt+eeo/53Dfmq4SsXu4FcoC7HSa1s6c8+g2laY+Pr8W17wa44RxPp+Twbj5TOxqqGEz1uebzNEO5QvDzZ9jg5BU79z24SWoZh7oFTf9kTLXQOWpH4TYIeRZRg3yJ0E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PK2wynzKW4Xeo0ylysB8WUG9WUNw3hx2Ex5O5G4uCx7Snh3gQjZuSIqlX6ppl1j8QJsntQGa9QC7QLnjp3ig0PRxYbromGk7Jhr9f43UkOTrH9qAUqnhCkI6Iw/a1r0p69zd8MIbfk6/dqjmHnbjF1kue8bQXvGmSHVJGaI4FfwwJhGydWnxP0usxmamdRiX9gBQbamx12paf9Kom0CyegEdtryfxKDp7KteZ101ENeXbpXNbG20EfoQ7wGZzqW1B1+k9kWOb+NhaqX5PpIY2B+UlimYHKTVOkXQmHGfbfBHaY6F3K0TTBqjhMHl7GX+lHGAxWzUxFhl+Ahr6wZ1DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raE3IienIKJdUrPrC4yNOVKHkWXRO/TA3YJbKrq+SzQ=;
 b=QLh5KEdy2lW1V5o2QVBpCaO4/s1FG88oS0LoW695awKl/IEViW+JVb8krZcmM+a09Lz7W3pIjgstpR1/qTGiDX0rrPiJBVl+yTu3qKlsjOD5oUlk44ONsN9mGuD7hwb5P4jOHVjt7av6PQc7rr+cZ0moC+vVvJnE0GUKrjAxEwF2p99AnI7l9FHCubATUaXHWNMotcb1AVPM69zqwnqx2akXVCSizdmkJGAPqpM0KZyQbR0Uiwd3PQSPU8usUpZW3ujYmxKIyOMNFJMCPO4dSc43Il2S8f34gwBdKvg/o4BVDy0PmYHLCvKLObOTaZOIxvfV+rI9QDEPDYXN2FM4mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raE3IienIKJdUrPrC4yNOVKHkWXRO/TA3YJbKrq+SzQ=;
 b=SgLOifJWhlgYeg4m9qecvihR2govRVj/d26cLy7Z5OZrpmt+eeo/53Dfmq4SsXu4FcoC7HSa1s6c8+g2laY+Pr8W17wa44RxPp+Twbj5TOxqqGEz1uebzNEO5QvDzZ9jg5BU79z24SWoZh7oFTf9kTLXQOWpH4TYIeRZRg3yJ0E=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: RE: [PATCH v2 01/40] xen/arm: remove xen_phys_start and
 xenheap_phys_end from config.h
Thread-Topic: [PATCH v2 01/40] xen/arm: remove xen_phys_start and
 xenheap_phys_end from config.h
Thread-Index: AQHZJxAZFWT7HTzU/UKS259EJJCvG66cH12AgAAI1eA=
Date: Fri, 13 Jan 2023 10:39:24 +0000
Message-ID:
 <AM0PR08MB4530E854859433AEBA73CF44F7C29@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-2-Penny.Zheng@arm.com>
 <2e8a80d6-b45d-f852-1e54-7c6e0ae4f2fd@xen.org>
In-Reply-To: <2e8a80d6-b45d-f852-1e54-7c6e0ae4f2fd@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2749E7C5D13F2F4FA5185745007A3E26.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|DBAPR08MB5574:EE_|DBAEUR03FT031:EE_|PAVPR08MB9435:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d4871c-47c3-4927-5237-08daf5527868
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8B8uaCvKsrC8+Ki13Ab578NhBJ4kVmv4BlAQMO01geTLr1/vISyXsyrV7cKoqIdfJ1kTYr/v1q5kgsWhPdw+3sd1qUCZyrp1LsOcO7AjIG3SVT6U8Cp4LLbnZyHxBo1GASSwaZWNDqw/2hJJwfekRNS+G/v4U2d3IpAduE3vlqenhzrjVw9aoukY7Vsu1A4ydpF8mPiNVycwooFu6nPucgng1qAtNMZAytOn6pAnnejtoY+Kzi8NvwgzdthdTnJ+CUuVgnuuqdragzgJowm4RLNBfDNS7XqGRXy3/+sZRFqCeRIUnbI/a6Oy6ELrRhypImthrC4MgxjUv5A4YIc3lW9ACi0xpUoFUCU+beTBI1YV6by1GVvLgSCpSfT69o8vlZV3T3s3K9V5YyASwG9tjwnBaMHaLwdVembUqnQqKFSfd0ZNSjCxCTGJlT7PTq62fwh9RUsb5lgDotln9TTh/afRE+t1gyoRmsfeyOgxJDav1Lqri5DuPygszuCMTuHEb236TlNamL9vEuyVy/6iDylc+B74b5Hpj6Nza0rm+KnJUhRvcauSYhGfQZ/Puu7WcLu8Y5A4QeOykep0YH0350LDJJiOVFxFrrhV6UmoX6y1YCUstYiBsN/7RE36sYE8xAO+nsS44XyXo1S7L/gcINTIQXd6WzYmQwpsRzdqnrmcaLtpwHHe4pr2jdM+wODLVIb0A7jIwZgngcJUtoHYPQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199015)(478600001)(86362001)(33656002)(316002)(110136005)(2906002)(54906003)(71200400001)(7696005)(83380400001)(186003)(38100700002)(38070700005)(122000001)(55016003)(53546011)(9686003)(8936002)(66476007)(64756008)(52536014)(76116006)(6506007)(66446008)(8676002)(4326008)(66556008)(5660300002)(66946007)(26005)(4744005)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5574
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f8f14d69-f38c-432e-eca6-08daf5527030
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0pOn5lOEt2SqcKMohJfCk+sd46V3I7wzcxQ2U7HHiU6iiM/s/iufzltOt3aaj5Nxe9UK4Lv6eNirf6EOvFf74w2QaxLwooeUq7RwHd/HIEjAXXRIRbKMLMPRrBNAVVsweVCpFKonC0TzVrpZVv1X+ho/HkO8J5t7F1y5pWWN0lVZeeNPSjzPCpLc+wv3f4wz5DRHI0hesZg8Eg5NHQix45fb/VcCInddpwwa1V19aOxEDX4OYH9UMD+22NwFBHMal7DPfQwkejErtXdDW48yh5SilyK8OE7Zx9JYa07z/y4iUVjhjOlZvRfTAmdAV+KzKmkgeAJvYLRE4E7cQKvruBnaRE9nvtSINmwBsoFkMj/YKB6lkcAM3bjuoC+fMiQAmACqnD0XFurMk3OeimA+e0HoRhgM7kBEef6hMeUMPdYf6q1jdC9IBqpM66WjMTMDn8X3PPGW4SENb25aWZApCt8GCt5h2DcyyzJwYanM/ROZzxfq8YGMve/B9C4/jvaNUfWpUK62GgK4HHxwqr559+utDyBs175VKN8OIRNXCHVnCBpuULyWa1Yy4nZ4UcijhK0WOdceZfLWC+6C5FbtmPzNERolNhONB5PWpqNYrNvirahCModrgfcp724KKeTVzhv08JKeOuJSKacqOat5yHn6XH4l3Hos2BupbJpa9CTvAHwlEwloWc4LhzWbqqWum70PJ7tyPI1h+IxmWztbhw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(110136005)(81166007)(54906003)(86362001)(316002)(52536014)(8936002)(8676002)(2906002)(356005)(478600001)(70206006)(70586007)(26005)(107886003)(82740400003)(53546011)(7696005)(40460700003)(41300700001)(4326008)(186003)(6506007)(9686003)(33656002)(40480700001)(55016003)(83380400001)(47076005)(5660300002)(36860700001)(336012)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 10:39:38.2416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d4871c-47c3-4927-5237-08daf5527868
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9435

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPg0KPiBTZW50OiBGcmlkYXksIEphbnVhcnkgMTMsIDIwMjMgNjowNyBQTQ0KPiBU
bzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgU3RlZmFubyBT
dGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQgTWFycXVpcyA8
QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4gVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15
cl9CYWJjaHVrQGVwYW0uY29tPjsgSnVsaWVuIEdyYWxsDQo+IDxqZ3JhbGxAYW1hem9uLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwMS80MF0geGVuL2FybTogcmVtb3ZlIHhlbl9waHlz
X3N0YXJ0IGFuZA0KPiB4ZW5oZWFwX3BoeXNfZW5kIGZyb20gY29uZmlnLmgNCj4gDQo+IEhpIFBl
bm55LA0KDQpIaSBKdWxpZW4NCg0KPiANCj4gT24gMTMvMDEvMjAyMyAwNToyOCwgUGVubnkgWmhl
bmcgd3JvdGU6DQo+ID4gRnJvbTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4NCj4g
PiBUaGVzZSB0d28gdmFyaWFibGVzIGFyZSBzdGFsZSB2YXJpYWJsZXMsIHRoZXkgb25seSBoYXZl
IGRlY2xhcmF0aW9ucw0KPiA+IGluIGNvbmZpZy5oLCB0aGV5IGRvbid0IGhhdmUgYW55IGRlZmlu
aXRpb24gYW5kIG5vIGFueSBjb2RlIGlzIHVzaW5nDQo+ID4gdGhlc2UgdHdvIHZhcmlhYmxlcy4g
U28gaW4gdGhpcyBwYXRjaCwgd2UgcmVtb3ZlIHRoZW0gZnJvbSBjb25maWcuaC4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+IEFja2VkLWJ5
OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPiANCj4gSSB3YXMgZ29pbmcgdG8g
Y29tbWl0IHRoaXMgcGF0Y2gsIGhvd2V2ZXIgdGhpcyB0ZWNobmljYWxseSBuZWVkcyB5b3VyIHNp
Z25lZC0NCj4gb2ZmLWJ5IGFzIHRoZSBzZW5kZXIgb2YgdGhpcyBuZXcgdmVyc2lvbi4NCj4gDQo+
IElmIHlvdSBjb25maXJtIHlvdXIgc2lnbmVkLW9mZi1ieSwgdGhlbiBJIGNhbiBjb21taXQgd2l0
aG91dCBhIHJlc2VuZGluZy4NCj4gDQoNClllcywgSSBjb25maXJtLCB0aHgNCg0KPiBDaGVlcnMs
DQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

