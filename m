Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1304E74CD
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 15:06:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294761.501336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkZO-0005bR-8O; Fri, 25 Mar 2022 14:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294761.501336; Fri, 25 Mar 2022 14:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkZO-0005ZL-4s; Fri, 25 Mar 2022 14:05:38 +0000
Received: by outflank-mailman (input) for mailman id 294761;
 Fri, 25 Mar 2022 14:05:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wXB3=UE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nXkZM-0005ZF-VF
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 14:05:37 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a38a6b9a-ac44-11ec-a405-831a346695d4;
 Fri, 25 Mar 2022 15:05:35 +0100 (CET)
Received: from AS9PR06CA0326.eurprd06.prod.outlook.com (2603:10a6:20b:45b::34)
 by AM9PR08MB7029.eurprd08.prod.outlook.com (2603:10a6:20b:41b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 25 Mar
 2022 14:05:33 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45b:cafe::23) by AS9PR06CA0326.outlook.office365.com
 (2603:10a6:20b:45b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16 via Frontend
 Transport; Fri, 25 Mar 2022 14:05:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Fri, 25 Mar 2022 14:05:31 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Fri, 25 Mar 2022 14:05:31 +0000
Received: from 4e9673fb3536.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7668326C-0084-48C2-8F65-4F0C86A41CEA.1; 
 Fri, 25 Mar 2022 14:05:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4e9673fb3536.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 25 Mar 2022 14:05:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3142.eurprd08.prod.outlook.com (2603:10a6:209:46::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Fri, 25 Mar
 2022 14:05:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 14:05:13 +0000
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
X-Inumbo-ID: a38a6b9a-ac44-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdrAH/r/lnBHbpj1qhbXoZNyN3EtE9DsB6P6ChyZ0xE=;
 b=v3D+oZAUGZDiAADPPehwbV9quoJUzNjsSx8N+Dx30hwWDTPD3qjO3QjhrW1/1P9JoeJc5kBBI6S/TkduFGz8I7YLxeGrrt+QGzKeP6vqSAorijv0TwSDXZrluC3d+ITJSmQfMyG4FusUC+NSWhoHh+pFRT4em7WdxDC+uP13am8=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: 88ce6799eba9be52
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4BHqKIcq3UZYFGWZO/3KkBrFdLyxSRRTigxdBvzLE/u8ptUT6cG35Uoc0a72rQwfmY3gmQSwSjklhP+p3rNvCuZpxYMlG6N7NzlNs2URdeL1FdKVoiuium9YZnTZYoAyk7jGezPuLvuQvjEkibKOb0bWHK7oAHFujVtNmybe4x9wVmXxM4K/VplU/2qTSV9IMTamQO9pfMG7TTTiFKZHgZ8EvqR//g/Yhh8LXcSSKtxeQoJaI7pspDBCCws+pkGiIgMn8wjCh2oAIboN99RQG984HoMNj/hja9iKBnojEnjZS74JJCazPBhUZRob2x4QKnQADtibA8iPo+frf0UkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdrAH/r/lnBHbpj1qhbXoZNyN3EtE9DsB6P6ChyZ0xE=;
 b=d/K0OIvq2/TcNDERuAIuocAUBvWASwKIIaLHHvWFijBWawrUq+WTP8ZKzBz45XrT9UkocI1QDx81Gmznr522hhcl6wx+J4WnjjodgT4qA0kBD3IzwH/12IqhpFaY02s/GrMjZBByfDNGjEojs5UntcacRAL85OHaB5rieKbAnmKlgp5ZsFFp83bRBrAneN2eqDVVVD7czEDtfYRpZ+SX9Rw4mdpof+NnyEcM884/SNh09BVPWAhY17vt1Wq+iOkhM3UcMtCq50ap1ZUJvwffpmX3439u525HMdr30ua9po7mlR65uIrGOtYdy4csxgkB20l0PA7QkuaVdu0faRjvpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdrAH/r/lnBHbpj1qhbXoZNyN3EtE9DsB6P6ChyZ0xE=;
 b=v3D+oZAUGZDiAADPPehwbV9quoJUzNjsSx8N+Dx30hwWDTPD3qjO3QjhrW1/1P9JoeJc5kBBI6S/TkduFGz8I7YLxeGrrt+QGzKeP6vqSAorijv0TwSDXZrluC3d+ITJSmQfMyG4FusUC+NSWhoHh+pFRT4em7WdxDC+uP13am8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"marco.solieri@minervasys.tech" <marco.solieri@minervasys.tech>,
	"lucmiccio@gmail.com" <lucmiccio@gmail.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH early-RFC 2/5] xen/arm64: Rework the memory layout
Thread-Topic: [PATCH early-RFC 2/5] xen/arm64: Rework the memory layout
Thread-Index: AQHYM6fehqIqx7byxEaDRoW/6LbtaqzQLgwAgAAFFgCAAAg+AA==
Date: Fri, 25 Mar 2022 14:05:13 +0000
Message-ID: <4384DB81-5692-4F04-AA21-387B11A88C6E@arm.com>
References: <20220309112048.17377-1-julien@xen.org>
 <20220309112048.17377-3-julien@xen.org>
 <DE3C6104-82AD-41AE-BDAA-0074A08DDECF@arm.com>
 <cf150c85-34cb-73fb-9808-0338de546271@xen.org>
In-Reply-To: <cf150c85-34cb-73fb-9808-0338de546271@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 16733236-cb6e-4541-edae-08da0e68865d
x-ms-traffictypediagnostic:
	AM6PR08MB3142:EE_|AM5EUR03FT032:EE_|AM9PR08MB7029:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB702967F45117ED9AF6D402FB9D1A9@AM9PR08MB7029.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ghrNJr+6rxo8arZ1wl2SQ3XJUV0I3kVJh39Mx6nHjPisjoBoMwrc4ZQ9HtUjrwVhs3RO4gVTu+vGner5HimXB7sqNNhBVazUCO09Hqf9QOps5kKqtWhiYUO+7N048/TfBnsesX+BqU3kDJwcuIyJNlDOfZzJFRzbrYIfHN/MgtG23Ieb9yhKacSem+Of2m0bFws5fbCQBadFJBpwJgdexPl6O54QjCS4KcnRGsfyWtT75FOe2vC4caJZ8juXME58PrBOCJhGXvnJlWr91SiEqaJVUfdiF9eZi32BdnZriQe9u81oAWiuHDC8DFUK0tCvTrOO9y0q5wjYEEZubRL8yrXOhrrnCPLHY8tCFUtVIbOV1swcyU8I0R2i1TagoqiANHD22uoAmHMhye9P/uyNYw5FG4qOGk3NoU9ce4+KnF4BCJfoOFZArpVujDJzCVlTDlm1uwaUK7b38qVn+kLO3EI1u1qIA7H5LIyDfSMlI2AQPJSey+K1bXim450jrwYzeZLQgHbt0NqrkdzfuZ6HBpwBSevhyqNx94PLYVFl+NvtGFas1CXczeOJC73XGBdVfuxQ1yCY/CvWTs34mcPnYDOU0FNcRqJwBqI49BTX7V+UI2/0yx5aKsYYTzm1URl9mHrX6Q9bRaiZ7+hXwUHiprk9veMqRqAJyl1EHt1YtcgTLFIkTH/e56ryBeJRd1LdGO07ZU9iQCjGCTENDP1stnOfvc+0kevesrRbMK3PVlkBXMK+UnI5XbNjxFi5S55W
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(8676002)(33656002)(6486002)(26005)(66946007)(66556008)(66446008)(4326008)(186003)(66476007)(76116006)(8936002)(64756008)(36756003)(83380400001)(91956017)(122000001)(2616005)(5660300002)(38100700002)(316002)(6512007)(6916009)(6506007)(2906002)(54906003)(53546011)(508600001)(71200400001)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CBDA200420F774992FB82F996ADC86D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3142
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	65a5afb4-7bd8-4267-64b1-08da0e687b71
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xl7SKCRxyiZAYCrOHlPiVt0i+QJ1XD2VBqGupoOigdFtRkZ6EUDihP2LtzNsTc1/hS/YN6NSSOSpawDo/uEWB3B9CyVpQ3AmJKDFk/1Kno/m5h8FQHV8AJvMFose4Kp5qafEHzNBvq1pocbysYyshi3tacDfc9VCwVRtHxOv3KrZ3gQMskIixBsrFEZFkPpqrHWLX+dapcgaAIajNtNPJBnvURBxR0De4h9b/ZVir03XeFJk04tvOEvhWDv0yZXMWAnkLN5vVSajYu5kPjO/IcUXeyFi+LQQGY51Kb2awHxwTpxzxrg4/2KTxzePXxA5BvjcpKnqr3YSdADMiidOpavijM/xCattQh/z0OHpILHGXvSvZrb2EIgivbeIjvuXm5z4aUX3yaZdlh98IvUdmBrwYJMYW1XBb5SIgWFDhIeuif+zr99gmxE+VfgmDNT3AEpzGo1UHp19t2pz1yzpzSWeVhRGt8l7lURg35o8m1Kz8B8AYe9DN12syMkRE1ntqukJUw7u4X+izrBjeA4K/gLB6HxEPFUXa9O6lC1ywPSgJ+64SjiQNiy6Gd9HBRZ+lAdm1uoYBkIhRvCg57ZenqPx8a6Ko7pKLZnDIfK1TP+Az+Ydig635OSlX7Q6YbD+S41s+A8FqK1UN/ILrvkHshYaUOnS6OlZZRanaahXNJIB3WB7g99k3N81glj676gj1bRAwqYRhAYpOpiUy9xVOw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(508600001)(53546011)(6512007)(336012)(54906003)(26005)(6486002)(6506007)(63350400001)(316002)(70206006)(6862004)(40460700003)(8676002)(4326008)(47076005)(70586007)(33656002)(36860700001)(36756003)(63370400001)(83380400001)(81166007)(8936002)(356005)(2906002)(82310400004)(2616005)(107886003)(186003)(86362001)(5660300002)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 14:05:31.9099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16733236-cb6e-4541-edae-08da0e68865d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7029

SGkgSnVsaWVuLA0KDQo+IE9uIDI1IE1hciAyMDIyLCBhdCAxNDozNSwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDI1LzAzLzIwMjIgMTM6MTcs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKdWxpZW4sDQo+IA0KPiBIaSwNCj4gDQo+
Pj4gT24gOSBNYXIgMjAyMiwgYXQgMTI6MjAsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+
IHdyb3RlOg0KPj4+IA0KPj4+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+
DQo+Pj4gDQo+Pj4gWGVuIGlzIGN1cnJlbnRseSBub3QgZnVsbHkgY29tcGxpYW50IHdpdGggdGhl
IEFybSBiZWNhdXNlIGl0IHdpbGwNCj4+IEkgdGhpbmsgeW91IHdhbnRlZCB0byBzYXkg4oCcYXJt
IGFybeKAnSBoZXIuDQo+IA0KPiBZZXMuIEkgd2lsbCB1cGRhdGUgaXQuDQo+IA0KPj4+IHN3aXRj
aCB0aGUgVFRCUiB3aXRoIHRoZSBNTVUgb24uDQo+Pj4gDQo+Pj4gSW4gb3JkZXIgdG8gYmUgY29t
cGxpYW50LCB3ZSBuZWVkIHRvIGRpc2FibGUgdGhlIE1NVSBiZWZvcmUNCj4+PiBzd2l0Y2hpbmcg
dGhlIFRUQlIuIFRoZSBpbXBsaWNhdGlvbiBpcyB0aGUgcGFnZS10YWJsZXMgc2hvdWxkDQo+Pj4g
Y29udGFpbiBhbiBpZGVudGl0eSBtYXBwaW5nIG9mIHRoZSBjb2RlIHN3aXRjaGluZyB0aGUgVFRC
Ui4NCj4+PiANCj4+PiBJZiB3ZSBkb24ndCByZXdvcmsgdGhlIG1lbW9yeSBsYXlvdXQsIHdlIHdv
dWxkIG5lZWQgdG8gZmluZCBhDQo+Pj4gdmlydHVhbCBhZGRyZXNzIHRoYXQgbWF0Y2hlcyBhIHBo
eXNpY2FsIGFkZHJlc3MgYW5kIGRvZXNuJ3QgY2xhc2gNCj4+PiB3aXRoIHRoZSBzdGF0aWMgdmly
dHVhbCByZWdpb25zLiBUaGlzIGNhbiBiZSBhIGJpdCB0cmlja3kuDQo+PiBUaGlzIHNlbnRlbmNl
IGlzIGEgYml0IG1pc2xlYWRpbmcuIEV2ZW4gd2l0aCB0aGUgcmV3b3JrIHlvdSBuZWVkDQo+PiB0
byBkbyB0aGF0IGp1c3QgYnkgbW92aW5nIHRoZSBYZW4gdmlydHVhbCBhZGRyZXNzIHVwcGVyIHlv
dSBtYWtlDQo+PiBzdXJlIHRoYXQgYW55dGhpbmcgcGh5c2ljYWwgbWVtb3J5IHVuZGVyIDUxMkdC
IGNhbiBiZSBtYXBwZWQNCj4+IDE6MSB3aXRob3V0IGNsYXNoaW5nIHdpdGggb3RoZXIgWGVuIG1h
cHBpbmdzICh1bmxlc3MgWGVuIGlzIGxvYWRlZA0KPj4gaW4gbWVtb3J5IGF0IHBoeXNpY2FsIGFk
ZHJlc3MgNTEyR0Igd2hpY2ggd291bGQgZW5kIGluIHRoZSBzYW1lIGlzc3VlKS4NCj4gDQo+IFNv
IHRoZSBrZXkgZGlmZmVyZW5jZSBpcyB3aXRoIHRoZSByZXdvcmssIGl0IGlzIHRyaXZpYWwgdG8g
Y3JlYXRlIHRoZSAxOjEgbWFwcGluZyBhcyB3ZSBrbm93IGl0IGRvZXNuJ3QgY2xhc2guIFRoaXMg
aXMgbm90IHRoZSBjYXNlIHdpdGhvdXQgdGhlIHJld29yay4NCg0KQWdyZWUNCg0KPiANCj4+IEkg
dGhpbmsgc2hvdWxkIGJlIHJlcGhyYXNlZC4NCj4gDQo+IEkgYW0gbm90IGVudGlyZWx5IHN1cmUg
aG93IHRvIHJlcGhyYXNlIGl0LiBEbyB5b3UgaGF2ZSBhIHByb3Bvc2FsPw0KDQpUdXJuIGl0IGlu
dG8gdGhlIHBvc2l0aXZlOg0KUmV3b3JrIHRoZSBtZW1vcnkgbGF5b3V0IHRvIHB1dCBYZW4gb3Zl
ciA1MTJHQi4gVGhpcyBtYWtlcyBpdCB0cml2aWFsIHRvIGNyZWF0ZQ0KYSAxOjEgbWFwcGluZywg
d2l0aCB0aGUgYXNzdW1wdGlvbiB0aGF0IHRoZSBwaHlzaWNhbCBtZW1vcnkgaXMgdW5kZXIgNTEy
R0IuDQoNClNvbWV0aGluZyBpbiB0aGlzIGFyZWEsIHRlbGxpbmcgd2hhdCB3ZSBkbyBhbmQgbm90
IHdoYXQgd2UgZG9uJ3QNCg0KPiANCj4+PiANCj4+PiBPbiBhcm02NCwgdGhlIG1lbW9yeSBsYXlv
dXQgIGhhcyBwbGVudHkgb2YgdW51c2VkIHNwYWNlLiBJbiBtb3N0IG9mDQo+Pj4gdGhlIGNhc2Ug
d2UgZXhwZWN0IFhlbiB0byBiZSBsb2FkZWQgaW4gbG93IG1lbW9yeS4NCj4+PiANCj4+PiBUaGUg
bWVtb3J5IGxheW91dCBpcyByZXNodWZmbGVkIHRvIGtlZXAgdGhlIDB0aCBzbG90IGZyZWUuIFhl
biB3aWxsIG5vdw0KPj4gMHRoIHNsb3Qgb2YgZmlyc3QgbGV2ZWwgb2YgcGFnZSB0YWJsZS4NCj4g
DQo+IFdlIHdhbnQgdG8ga2VlcCB0aGUgZmlyc3QgNTEyR0IgZnJlZS4gU28gZGlkIHlvdSBpbnRl
bmQgdG8gd3JpdGUgInplcm8gbGV2ZWwiPw0KDQpZZXMgc29ycnkuDQoNCj4gDQo+Pj4gYmUgbG9h
ZGVkIGF0ICg1MTJHQiArIDJNQikuIFRoaXMgcmVxdWlyZXMgYSBzbGlnaHQgdHdlYWsgb2YgdGhl
IGJvb3QNCj4+PiBjb2RlIGFzIFhFTl9WSVJUX1NUQVJUIGNhbm5vdCBiZSB1c2VkIGFzIGFuIGlt
bWVkaWF0ZS4NCj4+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBh
bWF6b24uY29tPg0KPj4+IA0KPj4+IC0tLQ0KPj4+IA0KPj4+ICAgIFRPRE86DQo+Pj4gICAgICAg
IC0gSSB2YWd1ZWx5IHJlY2FsbCB0aGF0IG9uZSBvZiB0aGUgZWFybHkgcGxhdGZvcm0gd2Ugc3Vw
cG9ydGVkIGFkZA0KPj4+ICAgICAgICAgIHRoZSBtZW1vcnkgc3RhcnRpbmcgaW4gaGlnaCBtZW1v
cnkgKD4gMVRCKS4gSSBuZWVkIHRvIGNoZWNrDQo+Pj4gICAgICAgICAgd2hldGhlciB0aGUgbmV3
IGxheW91dCB3aWxsIGJlIGZpbmUuDQo+PiBJIHRoaW5rIHdlIGhhdmUgc29tZSBKdW5vIHdpdGgg
c29tZSBtZW1vcnkgbGlrZSB0aGF0LCB0ZWxsIG1lIGlmIHlvdSBuZWVkIGhlbHAgaGVyZS4NCj4g
DQo+IFdvdWxkIHlvdSBiZSBhYmxlIHRvIGNoZWNrIHRoZSBtZW1vcnkgbGF5b3V0IGFuZCBjb25m
aXJtPw0KDQpJIGNoZWNrZWQgYW5kIHRoZSBKdW5vIHdlIGhhdmUgYXMgdGhlIGhpZ2ggbWVtb3J5
IGEgbG90IGxvd2VyIHRoYW4gdGhhdDoNClJBTTogMDAwMDAwMDg4MDAwMDAwMCAtIDAwMDAwMDA5
ZmZmZmZmZmYNCg0KTm8gaWRlYSB3aHkgaXQgd2FzIGEgbG90IGhpZ2hlciBpbiBteSBtaW5kLg0K
DQo+IA0KPj4+ICAgICAgICAtIFVwZGF0ZSB0aGUgZG9jdW1lbnRhdGlvbiB0byByZWZsZWN0IHRo
ZSBuZXcgbGF5b3V0DQo+Pj4gLS0tDQo+Pj4geGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyAgICAg
ICAgIHwgIDMgKystDQo+Pj4geGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2NvbmZpZy5oIHwgMjAg
KysrKysrKysrKysrKystLS0tLS0NCj4+PiB4ZW4vYXJjaC9hcm0vbW0uYyAgICAgICAgICAgICAg
ICAgfCAxNCArKysrKysrLS0tLS0tLQ0KPj4+IDMgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9u
cygrKSwgMTQgZGVsZXRpb25zKC0pDQo+Pj4gDQo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TDQo+Pj4gaW5kZXggNjZk
ODYyZmM4MTM3Li44Nzg2NDkyODBkNzMgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2Fy
bTY0L2hlYWQuUw0KPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMNCj4+PiBAQCAt
NTk0LDcgKzU5NCw4IEBAIGNyZWF0ZV9wYWdlX3RhYmxlczoNCj4+PiAgICAgICAgICAqIG5lZWQg
YW4gYWRkaXRpb25hbCAxOjEgbWFwcGluZywgdGhlIHZpcnR1YWwgbWFwcGluZyB3aWxsDQo+Pj4g
ICAgICAgICAgKiBzdWZmaWNlLg0KPj4+ICAgICAgICAgICovDQo+Pj4gLSAgICAgICAgY21wICAg
eDE5LCAjWEVOX1ZJUlRfU1RBUlQNCj4+PiArICAgICAgICBsZHIgICB4MCwgPVhFTl9WSVJUX1NU
QVJUDQo+Pj4gKyAgICAgICAgY21wICAgeDE5LCB4MA0KPj4gQSBjb21tZW50IGluIHRoZSBjb2Rl
IHdvdWxkIGJlIGdvb2QgaGVyZSB0byBwcmV2ZW50IHNvbWVvbmUgcmV2ZXJ0aW5nIHRoaXMuDQo+
IA0KPiBBbnlvbmUgdHJ5aW5nIHRvIHJldmVydCB0aGUgY2hhbmdlIHdpbGwgZmFjZSBhIGNvbXBp
bGF0aW9uIGVycm9yOg0KPiANCj4gIENDICAgICAgYXJjaC9hcm0vYXJtNjQvaGVhZC5vDQo+IGFy
Y2gvYXJtL2FybTY0L2hlYWQuUzogQXNzZW1ibGVyIG1lc3NhZ2VzOg0KPiBhcmNoL2FybS9hcm02
NC9oZWFkLlM6NTk3OiBFcnJvcjogaW1tZWRpYXRlIG91dCBvZiByYW5nZQ0KPiANCj4gU28gSSBk
b24ndCB0aGluayBhIGNvbW1lbnQgaXMgbmVjZXNzYXJ5IGJlY2F1c2UgdGhpcyBpcyBub3Qgc3Bl
Y2lmaWMgdG8gYSBjb21waWxlci9hc3NlbWJsZXIuDQoNClJpZ2h0IEkgc2hvdWxkIGhhdmUgdGhv
dWdodCBvZiB0aGUgY29tcGlsYXRpb24gZXJyb3IuDQoNCg0KPj4+IC0jZGVmaW5lIFNMT1QwX0VO
VFJZX0JJVFMgIDM5DQo+Pj4gLSNkZWZpbmUgU0xPVDAoc2xvdCkgKF9BVCh2YWRkcl90LHNsb3Qp
IDw8IFNMT1QwX0VOVFJZX0JJVFMpDQo+Pj4gLSNkZWZpbmUgU0xPVDBfRU5UUllfU0laRSAgU0xP
VDAoMSkNCj4+PiAtDQo+Pj4gLSNkZWZpbmUgVk1BUF9WSVJUX1NUQVJUICBHQigxKQ0KPj4+ICsj
ZGVmaW5lIFZNQVBfVklSVF9TVEFSVCAgKFNMT1QwKDEpICsgR0IoMSkpDQo+Pj4gI2RlZmluZSBW
TUFQX1ZJUlRfRU5EICAgIChWTUFQX1ZJUlRfU1RBUlQgKyBHQigxKSkNCj4+PiANCj4+PiAtI2Rl
ZmluZSBGUkFNRVRBQkxFX1ZJUlRfU1RBUlQgIEdCKDMyKQ0KPj4+ICsjZGVmaW5lIEZSQU1FVEFC
TEVfVklSVF9TVEFSVCAgKFNMT1QwKDEpICsgR0IoMzIpKQ0KPj4+ICNkZWZpbmUgRlJBTUVUQUJM
RV9TSVpFICAgICAgICBHQigzMikNCj4+PiAjZGVmaW5lIEZSQU1FVEFCTEVfTlIgICAgICAgICAg
KEZSQU1FVEFCTEVfU0laRSAvIHNpemVvZigqZnJhbWVfdGFibGUpKQ0KPj4+ICNkZWZpbmUgRlJB
TUVUQUJMRV9WSVJUX0VORCAgICAoRlJBTUVUQUJMRV9WSVJUX1NUQVJUICsgRlJBTUVUQUJMRV9T
SVpFIC0gMSkNCj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9h
cm0vbW0uYw0KPj4+IGluZGV4IDZiN2M0MWQ4MjdjYS4uNzVlZDlhM2NlMjQ5IDEwMDY0NA0KPj4+
IC0tLSBhL3hlbi9hcmNoL2FybS9tbS5jDQo+Pj4gKysrIGIveGVuL2FyY2gvYXJtL21tLmMNCj4+
PiBAQCAtMTg3LDExICsxODcsMTAgQEAgc3RhdGljIHZvaWQgX19pbml0IF9fbWF5YmVfdW51c2Vk
IGJ1aWxkX2Fzc2VydGlvbnModm9pZCkNCj4+PiAgICAgQlVJTERfQlVHX09OKERJUkVDVE1BUF9W
SVJUX1NUQVJUICYgfkZJUlNUX01BU0spOw0KPj4+ICNlbmRpZg0KPj4+ICAgICAvKiBQYWdlIHRh
YmxlIHN0cnVjdHVyZSBjb25zdHJhaW50cyAqLw0KPj4+IC0jaWZkZWYgQ09ORklHX0FSTV82NA0K
Pj4+IC0gICAgQlVJTERfQlVHX09OKHplcm9ldGhfdGFibGVfb2Zmc2V0KFhFTl9WSVJUX1NUQVJU
KSk7DQo+Pj4gLSNlbmRpZg0KPj4gRG9u4oCZdCB5b3Ugd2FudCB0byBlbmZvcmNlIHRoZSBvcHBv
c2l0ZSBub3cgPyBDaGVjayB0aGF0IGl0IGlzIG5vdCBvbiBzbG90IDAgPw0KPiANCj4gSSBjYW4u
IEJ1dCB0aGlzIGlzIG5vdCBnb2luZyB0byBndWFyYW50ZWUgdXMgdGhlIGZpcnN0IDUxMkdCIGlz
IGdvaW5nIHRvIGJlIGZyZWUuDQoNCkl0IGNvdWxkIHN0aWxsIG1ha2Ugc3VyZSB0aGF0IFhFTl9W
SVJUX1NUQVJUIGlzIG5vdCBpbiB0aGUgc2xvdCAwLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4g
DQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

