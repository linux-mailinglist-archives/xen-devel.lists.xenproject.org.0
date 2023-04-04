Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D9F6D5987
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 09:26:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517669.803363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjb2x-0001rp-GU; Tue, 04 Apr 2023 07:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517669.803363; Tue, 04 Apr 2023 07:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjb2x-0001pY-De; Tue, 04 Apr 2023 07:25:39 +0000
Received: by outflank-mailman (input) for mailman id 517669;
 Tue, 04 Apr 2023 07:25:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMxR=73=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pjb2w-0001pS-9E
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 07:25:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e43c1df3-d2b9-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 09:25:36 +0200 (CEST)
Received: from AS9PR07CA0032.eurprd07.prod.outlook.com (2603:10a6:20b:46b::26)
 by GV1PR08MB8129.eurprd08.prod.outlook.com (2603:10a6:150:93::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Tue, 4 Apr
 2023 07:25:32 +0000
Received: from AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46b:cafe::ac) by AS9PR07CA0032.outlook.office365.com
 (2603:10a6:20b:46b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.28 via Frontend
 Transport; Tue, 4 Apr 2023 07:25:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT015.mail.protection.outlook.com (100.127.140.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.18 via Frontend Transport; Tue, 4 Apr 2023 07:25:32 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Tue, 04 Apr 2023 07:25:31 +0000
Received: from 03dfef89983d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4964DB8F-5F00-4319-BF1E-C01212FD3F3E.1; 
 Tue, 04 Apr 2023 07:25:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 03dfef89983d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 04 Apr 2023 07:25:30 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by AS8PR08MB8222.eurprd08.prod.outlook.com (2603:10a6:20b:52a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 07:25:20 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::7b58:72de:8c37:5104]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::7b58:72de:8c37:5104%6]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 07:25:20 +0000
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
X-Inumbo-ID: e43c1df3-d2b9-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkOr/QC/Awt/0jF1p4/c1SFts/o/0u4Id40Ai/aNGcQ=;
 b=l7d7PF75xOf0+Q7cFkpC1cRWrySrS6yFJNuJygewysDhZXySsk1G+/NQ9Wk4aQ01zQk1b1f3JDZ4FF4xlynH76jreLA2nQsRCTXnvl8O65P8bAorkoi0ObkfIXdeXbo5pEYcs2PGmsyi8TCQ+QNiHOBkI9780D/+8IReUoCerQ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1ca0b615dc84edd7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxKdMJXd2jEqkpgCcKZCXRw1v5eIYNjEmyQdHMpCgCRbGtTTHGxRr7BaRh/4Ka8qYpSKjR0wEwR1vEzkhhRPqzd0AspF44sT+vkmhD9FopEOG/IGZx48lHuDQUlHr+r1ZpDSAC9ZivUlgDnqVUcuCGJDbW7DRUe05ECfEJlxMVZcrx2wbDC3sYdhm63ehPw8LekBV48zl2MImBfuzplzkaBt5K3nBB9yerdtWKE56Tnftd/YRut4p5Y1Xx7eAj8JhiRfPyMguZKnoD0qRhB88g65OQQIrYN2kJFiJjtqNc4KBVshIuF2DcwRRgIsftjNV6A66Qf7jMoWPZD9Fx1EGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkOr/QC/Awt/0jF1p4/c1SFts/o/0u4Id40Ai/aNGcQ=;
 b=F8OQ/IkAsMBW0RYR3vRffvTPEgAJJTwnpp8gRmjf4O2v6tvjncM9FiXLSBqAjueBRZa2ueoqqd+/axDmYcPZ8y5IGz4X+5IAD462JtBtHGEw6BOt69TcgEmv6Qf/JQKnDTeGho2kYOQaCHNMOvMYIEMJmJZPXVG2MRVLs0OrIWtJ9k15WgK13DOMh+yXSMq2KoL/1IzqlowQucrZrgOi8SBPEa4WP4mx1kkTtUKN+3aCE8M1QpcRqAlwCnB0inuAtoaLy91ge3rRaSLpeVjGgovUSKWvXnh4OfrBD4WX2tYyzSe4QP1JBNqiXw4/rfcx0iUhK06ccRDXBbg8ow7taA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkOr/QC/Awt/0jF1p4/c1SFts/o/0u4Id40Ai/aNGcQ=;
 b=l7d7PF75xOf0+Q7cFkpC1cRWrySrS6yFJNuJygewysDhZXySsk1G+/NQ9Wk4aQ01zQk1b1f3JDZ4FF4xlynH76jreLA2nQsRCTXnvl8O65P8bAorkoi0ObkfIXdeXbo5pEYcs2PGmsyi8TCQ+QNiHOBkI9780D/+8IReUoCerQ4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Christian Lindig
	<christian.lindig@cloud.com>
Subject: Re: [PATCH v4 09/12] tools: add physinfo arch_capabilities handling
 for Arm
Thread-Topic: [PATCH v4 09/12] tools: add physinfo arch_capabilities handling
 for Arm
Thread-Index: AQHZYJtfUiyGg0Un4ki5c+B28igcyq8TjeGAgAc+FQA=
Date: Tue, 4 Apr 2023 07:25:20 +0000
Message-ID: <6373AE6D-DD75-45FE-B549-DC540453508C@arm.com>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
 <20230327105944.1360856-10-luca.fancellu@arm.com>
 <9804fbab-3e8d-49dc-847b-4804a6de286b@perard>
In-Reply-To: <9804fbab-3e8d-49dc-847b-4804a6de286b@perard>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|AS8PR08MB8222:EE_|AM7EUR03FT015:EE_|GV1PR08MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ead9dac-8345-4ada-d05f-08db34ddc64f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ipWbnH40rr+i4lSQ0M79XLqn15iAvIsDpjsZxuvjFDkxbtZO+nVKD/Mhg6ktcSOFKvaoN3jeEMQg4Ikp+E0N+AoAh5Lgbzz0wpBGPPI0hmjtVPq0DG7nxDIxFB/G5JUU3wooDAtmFTysBamC9flSrqlCbjL9QKSuSBWqye4bT8YBpm0DXKMqljTW+CGeDsS7iSwVKF7KMX61Ftx6uExxHF2JM2XXwRlNkTAPYlkqEU+pjQp/k87ScfCqEi3kmOJJPvnT/dkn2Ox6eNIImNl+vJ8mOyjJz6gvXWQK6hRnqCZku/Lt142baAXCvMVPZkdAKX39DEGL7iuC7l7a+AshDksQEyb5Vl2H+lRv+EClSC3nwRWXVJuMR+PkXsK2Qd8eREkF0hJxELUpfxM5W+fAYPZyBMLR7IRBuOzoAsy1+x54z2brYYetSMA9fOybmFFhe80GFZJ1+sydjD1Z7TgBy01Mp+gB/05lAWTqwc7aU5YQNSGeqxilTzOyJTKV+JZK6r6AgYJTRiidcX4CWhKIGyt+VooI6AqpEldjiCtfm9vZvD+6efOGyXhRSYdeMW5ZbI5MkNp7MFsSlji23/SLy7eWBnBdcdUb5GLYoH0E/4yS90xIFay0VfsNsdQcU0AP8QFgRbhZ5as12ad2i5nMdQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199021)(33656002)(122000001)(38100700002)(36756003)(7416002)(5660300002)(38070700005)(8936002)(76116006)(66556008)(66446008)(66946007)(8676002)(86362001)(41300700001)(4326008)(6916009)(66476007)(64756008)(91956017)(966005)(2616005)(26005)(54906003)(53546011)(2906002)(6512007)(6506007)(6486002)(71200400001)(478600001)(186003)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <80EFDB6C63C4DA4FB717E4EFAF5C8824@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8222
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	04d21212-0789-43a2-b402-08db34ddbf71
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xIyCZxPUW1EiT9pmyFVSNkwweJtQ64d5UUfBJrPUiuaODYwNy+8ip33rLcPbQHpHKwD59XbbZluALrSwuXf+gw95+pcA0+7hYnyitz/wiYwwx8ROTdyGPuo6w2ArCD0ntJkFnf93JEUJq6dqpeMSeYtftI+FaFGmbKWd+Rp8qCubLYowCxKUl4vYuBVwFEO+elx3QIKcSe5WgavWkByR/QOtnkH/+nWkrxhXNxx956KUj8ZQvRu1r8ZaJ8+1hg1i7+hzfOHPH837WZRatf+lLiQnMjDZCwJ2Di+xW7yEn/BO9v8skAQL3sNjYe/cd4xpNhR8fvnob0z2kPRsOF54b2s9lHESiKgzgUkGd/HOvNN9Bgs9LK58avTWjabXZ1yWS8kLz9mCmat9ewxUbU6b/Ebw3GU57yyf4fFqcPXy4IMiIA0ac2A1tAlSocpO1dAykxIHJGFONE8bY5374F+ATZsXeV9Zieza2ePGstMwTuZgEbgE/5jtWE9fkbpL6QDhfB/hCpU5MctfOUbqZXuAugn92jFIjGNvuunBVV3/hVp9pi1PiuAkOS49QmIiG5BQ/mqS5KaK6mg1uTahBZv/O5jTku6fXHPPjjSkpvxhPl7JIhXVoqpvInhk/5vnOo4Gj+JKW6jHh2k9Bu10Or5mI1n1aRib/mZjK9LoqVHCiiJmSnczT/magiqNAeFeYgkO
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199021)(40470700004)(46966006)(36840700001)(82740400003)(82310400005)(356005)(81166007)(40460700003)(86362001)(40480700001)(36756003)(33656002)(966005)(107886003)(6512007)(2906002)(186003)(4326008)(26005)(6506007)(70206006)(70586007)(5660300002)(41300700001)(8936002)(478600001)(8676002)(54906003)(316002)(6862004)(6486002)(36860700001)(53546011)(336012)(47076005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 07:25:32.0874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ead9dac-8345-4ada-d05f-08db34ddc64f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8129

SGkgQW50aG9ueSwNCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldw0KDQo+IE9uIDMwIE1hciAy
MDIzLCBhdCAxNzo0OSwgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
IHdyb3RlOg0KPiANCj4gT24gTW9uLCBNYXIgMjcsIDIwMjMgYXQgMTE6NTk6NDFBTSArMDEwMCwg
THVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IC0tLQ0KPj4gdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L2hl
bHBlcnMuZ2VuLmdvICAgIHwgIDIgKysNCj4+IHRvb2xzL2dvbGFuZy94ZW5saWdodC90eXBlcy5n
ZW4uZ28gICAgICB8ICAxICsNCj4+IHRvb2xzL2luY2x1ZGUvYXJtLWFyY2gtY2FwYWJpbGl0aWVz
LmggICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysNCj4gDQo+IENvdWxkIHlvdSBtb3Zl
IHRoYXQgbmV3IGZpbGUgaW50byAidG9vbHMvaW5jbHVkZS94ZW4tdG9vbHMvIiwgd2hlcmUNCj4g
ImNvbW1vbi1tYWNyb3MuaCIgaXMuIFRoZSB0b3AtZGlyICJ0b29scy9pbmNsdWRlIiBhbHJlYWR5
IGhhcyBhIG1peHR1cmUNCj4gb2YgaW5zdGFsbGVkIGFuZCBpbnRlcm5hbCBoZWFkZXJzLCBidXQg
bW9zdCBvZiB0aGVtIGFyZSBpbnN0YWxsZWQuIFNvDQo+IHRoZSBmYWlybHkgcmVjZW50ICJ4ZW4t
dG9vbHMiIGRpciB3aGljaCBoYXZlIGJlZW4gaW50cm9kdWNlZCB0byBzaGFyZQ0KPiBtYWNyb3Mg
YXQgYnVpbGQgdGltZSBzZWVtcyBtb3JlIGFwcHJvcHJpYXRlIGZvciBhbm90aGVyIGJ1aWx0LXRp
bWUNCj4gbWFjcm8uDQoNClllcyBJ4oCZbGwgZG8NCg0KPiANCj4+IHRvb2xzL2luY2x1ZGUveGVu
LXRvb2xzL2NvbW1vbi1tYWNyb3MuaCB8ICAyICsrDQo+PiANCj4+IGRpZmYgLS1naXQgYS90b29s
cy9pbmNsdWRlL2FybS1hcmNoLWNhcGFiaWxpdGllcy5oIGIvdG9vbHMvaW5jbHVkZS9hcm0tYXJj
aC1jYXBhYmlsaXRpZXMuaA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAw
MDAwMDAwMC4uNDZlODc2NjUxMDUyDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi90b29scy9p
bmNsdWRlL2FybS1hcmNoLWNhcGFiaWxpdGllcy5oDQo+PiBAQCAtMCwwICsxLDMzIEBADQo+PiAr
LyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8NCj4+ICsvKg0KPj4gKyAqIENv
cHlyaWdodCAoQykgMjAyMyBBUk0gTHRkLg0KPj4gKyAqLw0KPj4gKw0KPj4gKyNpZm5kZWYgQVJN
X0FSQ0hfQ0FQQUJJTElUSUVTX0gNCj4+ICsjZGVmaW5lIEFSTV9BUkNIX0NBUEFCSUxJVElFU19I
DQo+PiArDQo+PiArLyogVGVsbCB0aGUgWGVuIHB1YmxpYyBoZWFkZXJzIHdlIGFyZSBhIHVzZXIt
c3BhY2UgdG9vbHMgYnVpbGQuICovDQo+PiArI2lmbmRlZiBfX1hFTl9UT09MU19fDQo+PiArI2Rl
ZmluZSBfX1hFTl9UT09MU19fIDENCj4gDQo+IFNvbWVob3csIHRoaXMgZG9lc24ndCBzZWVtcyBh
cHByb3ByaWF0ZSBpbiB0aGlzIGhlYWRlci4gVGhpcyBtYWNybw0KPiBzaG91bGQgaW5zdGVhZCBi
ZSBzZXQgb24gdGhlIGNvbW1hbmQgbGluZS4gQW55IHJlYXNvbiB5b3UndmUgYWRkZWQgdGhpcw0K
PiBpbiB0aGUgaGVhZGVyPw0KDQpJ4oCZdmUgYWRkZWQgdGhhdCBiZWNhdXNlIHN5c2N0bC5oIGlz
IGRvaW5nIHRoaXM6DQoNCiNpZiAhZGVmaW5lZChfX1hFTl9fKSAmJiAhZGVmaW5lZChfX1hFTl9U
T09MU19fKQ0KI2Vycm9yICJzeXNjdGwgb3BlcmF0aW9ucyBhcmUgaW50ZW5kZWQgZm9yIHVzZSBi
eSBub2RlIGNvbnRyb2wgdG9vbHMgb25seSINCiNlbmRpZg0KDQpCdXQgSeKAmXZlIG5vdCBjaGVj
a2VkIGlmIHRoZSBtYWNybyBpcyBhbHJlYWR5IHBhc3NlZCB0aHJvdWdoIHRoZSBidWlsZCBzeXN0
ZW0sIEnigJlsbA0KdHJ5IGFuZCBJ4oCZbGwgcmVtb3ZlIGl0IGlmIGl04oCZcyB0aGUgY2FzZQ0K
DQo+IA0KPj4gKyNlbmRpZg0KPj4gKw0KPj4gKyNpbmNsdWRlIDxzdGRpbnQuaD4NCj4+ICsjaW5j
bHVkZSA8eGVuL3N5c2N0bC5oPg0KPj4gKw0KPj4gKyNpbmNsdWRlIDx4ZW4tdG9vbHMvY29tbW9u
LW1hY3Jvcy5oPg0KPj4gKw0KPj4gK3N0YXRpYyBpbmxpbmUNCj4+ICt1bnNpZ25lZCBpbnQgYXJj
aF9jYXBhYmlsaXRpZXNfYXJtX3N2ZSh1bnNpZ25lZCBpbnQgYXJjaF9jYXBhYmlsaXRpZXMpDQo+
PiArew0KPj4gKyNpZiBkZWZpbmVkKF9fYWFyY2g2NF9fKQ0KPj4gKyAgICB1bnNpZ25lZCBpbnQg
c3ZlX3ZsID0gTUFTS19FWFRSKGFyY2hfY2FwYWJpbGl0aWVzLA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFhFTl9TWVNDVExfUEhZU0NBUF9BUk1fU1ZFX01BU0spOw0K
Pj4gKw0KPj4gKyAgICAvKiBWZWN0b3IgbGVuZ3RoIGlzIGRpdmlkZWQgYnkgMTI4IGJlZm9yZSBz
dG9yaW5nIGl0IGluIGFyY2hfY2FwYWJpbGl0aWVzICovDQo+PiArICAgIHJldHVybiBzdmVfdmwg
KiAxMjhVOw0KPj4gKyNlbHNlDQo+PiArICAgIHJldHVybiAwOw0KPj4gKyNlbmRpZg0KPj4gK30N
Cj4+ICsNCj4+ICsjZW5kaWYgLyogQVJNX0FSQ0hfQ0FQQUJJTElUSUVTX0ggKi8NCj4+IGRpZmYg
LS1naXQgYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX3R5cGVzLmlkbCBiL3Rvb2xzL2xpYnMvbGln
aHQvbGlieGxfdHlwZXMuaWRsDQo+PiBpbmRleCBjMTAyOTJlMGQ3ZTMuLmZkMzFkYWNmN2Q1YSAx
MDA2NDQNCj4+IC0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfdHlwZXMuaWRsDQo+PiArKysg
Yi90b29scy9saWJzL2xpZ2h0L2xpYnhsX3R5cGVzLmlkbA0KPj4gQEAgLTExMzMsNiArMTEzMyw3
IEBAIGxpYnhsX3BoeXNpbmZvID0gU3RydWN0KCJwaHlzaW5mbyIsIFsNCj4+ICAgICAoImNhcF92
cG11IiwgYm9vbCksDQo+PiAgICAgKCJjYXBfZ250dGFiX3YxIiwgYm9vbCksDQo+PiAgICAgKCJj
YXBfZ250dGFiX3YyIiwgYm9vbCksDQo+PiArICAgICgiYXJjaF9jYXBhYmlsaXRpZXMiLCB1aW50
MzIpLA0KPiANCj4gVGhpcyBhZGRpdGlvbmFsIGZpZWxkIG5lZWRzIGEgbmV3IExJQlhMX0hBVkVf
IG1hY3JvIGluICJsaWJ4bC5oIi4NCg0KSeKAmWxsIGFkZA0KDQo+IA0KPj4gICAgIF0sIGRpcj1E
SVJfT1VUKQ0KPj4gDQo+PiBsaWJ4bF9jb25uZWN0b3JpbmZvID0gU3RydWN0KCJjb25uZWN0b3Jp
bmZvIiwgWw0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMu
YyBiL3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYw0KPj4gaW5kZXggMzU5MDFjMmQ2
M2I2Li4yNTRkM2I1ZGNjZDIgMTAwNjQ0DQo+PiAtLS0gYS90b29scy9weXRob24veGVuL2xvd2xl
dmVsL3hjL3hjLmMNCj4+ICsrKyBiL3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYw0K
Pj4gQEAgLTcsNiArNyw3IEBADQo+PiAjZGVmaW5lIFBZX1NTSVpFX1RfQ0xFQU4NCj4+ICNpbmNs
dWRlIDxQeXRob24uaD4NCj4+ICNkZWZpbmUgWENfV0FOVF9DT01QQVRfTUFQX0ZPUkVJR05fQVBJ
DQo+PiArI2luY2x1ZGUgPGFybS1hcmNoLWNhcGFiaWxpdGllcy5oPg0KPiANCj4gQ291bGQgeW91
IGFkZCB0aGlzIGhlYWRlciAuLi4NCj4gDQo+PiAjaW5jbHVkZSA8eGVuY3RybC5oPg0KPj4gI2lu
Y2x1ZGUgPHhlbmd1ZXN0Lmg+DQo+PiAjaW5jbHVkZSA8ZmNudGwuaD4NCj4+IEBAIC0yMiw4ICsy
Myw2IEBADQo+PiAjaW5jbHVkZSA8eGVuL2h2bS9odm1faW5mb190YWJsZS5oPg0KPj4gI2luY2x1
ZGUgPHhlbi9odm0vcGFyYW1zLmg+DQo+PiANCj4+IC0jaW5jbHVkZSA8eGVuLXRvb2xzL2NvbW1v
bi1tYWNyb3MuaD4NCj4+IC0NCj4gDQo+IC4uLiBoZXJlLCBpbnN0ZWFkPw0KPiANCj4gQWxzbywg
SSB0aGluayAjaW5jbHVkZSBjb21tb24tbWFjcm9zLCBjYW4gc3RheS4NCg0KT2sgSeKAmWxsIGRv
IHRoZSBtb2RpZmljYXRpb25zDQoNCj4gDQo+PiAvKiBOZWVkZWQgZm9yIFB5dGhvbiB2ZXJzaW9u
cyBlYXJsaWVyIHRoYW4gMi4zLiAqLw0KPj4gI2lmbmRlZiBQeU1PRElOSVRfRlVOQw0KPj4gI2Rl
ZmluZSBQeU1PRElOSVRfRlVOQyBETF9FWFBPUlQodm9pZCkNCj4+IEBAIC04OTcsNyArODk2LDcg
QEAgc3RhdGljIFB5T2JqZWN0ICpweXhjX3BoeXNpbmZvKFhjT2JqZWN0ICpzZWxmKQ0KPj4gICAg
IGlmICggcCAhPSB2aXJ0X2NhcHMgKQ0KPj4gICAgICAgKihwLTEpID0gJ1wwJzsNCj4+IA0KPj4g
LSAgICByZXR1cm4gUHlfQnVpbGRWYWx1ZSgie3M6aSxzOmksczppLHM6aSxzOmwsczpsLHM6bCxz
OmksczpzLHM6c30iLA0KPj4gKyAgICByZXR1cm4gUHlfQnVpbGRWYWx1ZSgie3M6aSxzOmksczpp
LHM6aSxzOmwsczpsLHM6bCxzOmksczpzLHM6cyxzOml9IiwNCj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAibnJfbm9kZXMiLCAgICAgICAgIHBpbmZvLm5yX25vZGVzLA0KPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJ0aHJlYWRzX3Blcl9jb3JlIiwgcGluZm8udGhyZWFkc19w
ZXJfY29yZSwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiY29yZXNfcGVyX3NvY2tl
dCIsIHBpbmZvLmNvcmVzX3Blcl9zb2NrZXQsDQo+PiBAQCAtOTA3LDcgKzkwNiwxMCBAQCBzdGF0
aWMgUHlPYmplY3QgKnB5eGNfcGh5c2luZm8oWGNPYmplY3QgKnNlbGYpDQo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgInNjcnViX21lbW9yeSIsICAgICBwYWdlc190b19raWIocGluZm8u
c2NydWJfcGFnZXMpLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICJjcHVfa2h6Iiwg
ICAgICAgICAgcGluZm8uY3B1X2toeiwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
aHdfY2FwcyIsICAgICAgICAgIGNwdV9jYXAsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJ2aXJ0X2NhcHMiLCAgICAgICAgdmlydF9jYXBzKTsNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgInZpcnRfY2FwcyIsICAgICAgICB2aXJ0X2NhcHMsDQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJhcm1fc3ZlX3ZsIiwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBhcmNoX2NhcGFiaWxpdGllc19hcm1fc3ZlKHBpbmZvLmFyY2hfY2FwYWJpbGl0
aWVzKQ0KPiANCj4gYXJjaF9jYXBhYmlsaXRpZXNfYXJtX3N2ZSgpIHJldHVybnMgYW4gInVuc2ln
bmVkIGludCIsIGJ1dCB0aGUgZm9ybWF0IGlzDQo+ICJpIiwgd2hpY2ggc2VlbXMgdG8gYmUgYW4g
ImludCIuIFNob3VsZG4ndCB0aGUgZm9ybWF0IGJlICJJIiBpbnN0ZWFkPw0KPiANCj4gaHR0cHM6
Ly9kb2NzLnB5dGhvbi5vcmcvMy9jLWFwaS9hcmcuaHRtbCNjLlB5X0J1aWxkVmFsdWUNCg0KWWVz
IHlvdSBhcmUgcmlnaHQsIEnigJlsbCBjaGFuZ2UgaXQNCg0KPiANCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICApOw0KPj4gfQ0KPj4gDQo+PiBzdGF0aWMgUHlPYmplY3QgKnB5eGNfZ2V0Y3B1
aW5mbyhYY09iamVjdCAqc2VsZiwgUHlPYmplY3QgKmFyZ3MsIFB5T2JqZWN0ICprd2RzKQ0KPj4g
ZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsX2luZm8uYyBiL3Rvb2xzL3hsL3hsX2luZm8uYw0KPj4g
aW5kZXggNzEyYjc2MzhiMDEzLi5iZjE4YmEyNDQ5ZWYgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94
bC94bF9pbmZvLmMNCj4+ICsrKyBiL3Rvb2xzL3hsL3hsX2luZm8uYw0KPj4gQEAgLTE0LDYgKzE0
LDcgQEANCj4+IA0KPj4gI2RlZmluZSBfR05VX1NPVVJDRQ0KPj4gDQo+PiArI2luY2x1ZGUgPGFy
bS1hcmNoLWNhcGFiaWxpdGllcy5oPg0KPiANCj4gQW55IHJlYXNvbiByZWFzb24gdG8gaGF2ZSB0
aGlzIGhlYWRlciBmaXJzdD8NCj4gSSBmZWVsIGxpa2UgcHJpdmF0ZSBoZWFkZXJzIHNob3VsZCBj
b21lIGFmdGVyIHB1YmxpYyBvbmVzLCBzbyBoZXJlLCB0aGlzDQo+IGluY2x1ZGUgd291bGQgYmUg
YWRkZWQgYmV0d2VlbiA8bGlieGx1dGlsLmg+IGFuZCAieGwuaCIuDQoNCk9rIEnigJlsbCBtb3Zl
IGl0DQoNCj4gDQo+PiAjaW5jbHVkZSA8ZmNudGwuaD4NCj4+ICNpbmNsdWRlIDxpbnR0eXBlcy5o
Pg0KPj4gI2luY2x1ZGUgPHN0ZGxpYi5oPg0KPj4gQEAgLTIyNCw2ICsyMjUsMTMgQEAgc3RhdGlj
IHZvaWQgb3V0cHV0X3BoeXNpbmZvKHZvaWQpDQo+PiAgICAgICAgICBpbmZvLmNhcF9nbnR0YWJf
djIgPyAiIGdudHRhYi12MiIgOiAiIg0KPj4gICAgICAgICApOw0KPj4gDQo+PiArICAgIC8qIFBy
aW50IGFybSBTVkUgdmVjdG9yIGxlbmd0aCBvbmx5IG9uIEFSTSBwbGF0Zm9ybXMgKi8NCj4+ICsj
aWYgZGVmaW5lZChfX2FhcmNoNjRfXykNCj4+ICsgICAgbWF5YmVfcHJpbnRmKCJhcm1fc3ZlX3Zl
Y3Rvcl9sZW5ndGggIDogJXVcbiIsDQo+PiArICAgICAgICAgYXJjaF9jYXBhYmlsaXRpZXNfYXJt
X3N2ZShpbmZvLmFyY2hfY2FwYWJpbGl0aWVzKQ0KPj4gKyAgICAgICAgKTsNCj4+ICsjZW5kaWYN
Cj4+ICsNCj4+ICAgICB2aW5mbyA9IGxpYnhsX2dldF92ZXJzaW9uX2luZm8oY3R4KTsNCj4+ICAg
ICBpZiAodmluZm8pIHsNCj4+ICAgICAgICAgaSA9ICgxIDw8IDIwKSAvIHZpbmZvLT5wYWdlc2l6
ZTsNCj4gDQo+IFRoYW5rcywNCj4gDQo+IC0tIA0KPiBBbnRob255IFBFUkFSRA0KDQo=

