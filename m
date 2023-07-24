Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE5A75F352
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 12:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568712.888506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNspp-00026e-Ka; Mon, 24 Jul 2023 10:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568712.888506; Mon, 24 Jul 2023 10:30:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNspp-00023v-HW; Mon, 24 Jul 2023 10:30:37 +0000
Received: by outflank-mailman (input) for mailman id 568712;
 Mon, 24 Jul 2023 10:30:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9g4K=DK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qNspn-0001nO-4e
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 10:30:35 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1df68d91-2a0d-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 12:30:32 +0200 (CEST)
Received: from DBBPR09CA0032.eurprd09.prod.outlook.com (2603:10a6:10:d4::20)
 by PAVPR08MB9555.eurprd08.prod.outlook.com (2603:10a6:102:312::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.30; Mon, 24 Jul
 2023 10:30:30 +0000
Received: from DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::62) by DBBPR09CA0032.outlook.office365.com
 (2603:10a6:10:d4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32 via Frontend
 Transport; Mon, 24 Jul 2023 10:30:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT027.mail.protection.outlook.com (100.127.142.237) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.24 via Frontend Transport; Mon, 24 Jul 2023 10:30:29 +0000
Received: ("Tessian outbound d7adc65d10b4:v145");
 Mon, 24 Jul 2023 10:30:29 +0000
Received: from 6537baf27bf6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 98D36E01-DD03-4963-8F00-59650F1643E8.1; 
 Mon, 24 Jul 2023 10:30:22 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6537baf27bf6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Jul 2023 10:30:22 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB4PR08MB9309.eurprd08.prod.outlook.com (2603:10a6:10:3f7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 10:30:21 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 10:30:21 +0000
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
X-Inumbo-ID: 1df68d91-2a0d-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyRuusSFZEPsZjA8p+nkAzliUVaXuPh/L6Zq0u/a56w=;
 b=TTF/NgEgBH25uJPBnvS8vi8aC2h+AurkvOqFsFifsX+edC086T/ZurqjmtF1WD5aHNNlVPvZ+QwcLHHGvv3OJpzN6LrE+ICqMVP+8QUsg8KnBbbLTSLUyMcxPBGHjG+Bmz61ZdQpAs1vyH3zwLZwXfY20kGwlZT6jbjnB4mf56g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f4aaba77f25c5e52
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBs4esRyHGya6Pw1ojXPVKl1QOXc1Zmamdtr58QJsWSNM7IZfQpyuad9oVWg4yNbl74j93wPWzUCS9ZvgSsd3JppLlUelj8mRN3t76N1p48Z/KYi4dmAoq1k652UiDzsNGAht2abmCLqLH2Q1k9tu5foe8spdCMEmDjTqfqrvcfoVApfJ79Ipqu6GTB0O4GJ/LCHaAhDdlYijoC/tiSeomHdCxX9Oav1uiVFLTjT6814U1PCDkkExM4JC45eU1Y//K1HhjbG9wgM312Pm5X5Hf/GVXID+LP5gbFlv7RSYs4NjStNtPgSoe2nKGrpN0NjvljtXl8tNtSoEoEFrvbh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CyRuusSFZEPsZjA8p+nkAzliUVaXuPh/L6Zq0u/a56w=;
 b=C1dewd4Y6r4LaLWb11rmmaJUgJx/GsmIaxv5ZyEtkLq7RvRUTL7pTGGURhEakMzo3OmZcuJRgSThlKxxpP/METwWDFMPHqWtvSYDvlKN5aM3wVWSGPrEx7Z9RyJnLgK/aGdw/pVJrhmFGapXWjFRUDqlSX8U6kAhT4vHh7BKFYOvCf0liPf7CEoehyCtQbPnT28d7n/dITOOWsDT5y1bozA2w2Pi+DQUQu3gNRzGC1xO2dIlvavk7jsxD3JMtKgF9UV7r1J24d3wWZGNmP1W+NU2OzgI/08r+a7y/OOMqfPT/IMQdQdTDGjJq0hcxfns5YT03hbQvJjXQ/+6XE0jbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyRuusSFZEPsZjA8p+nkAzliUVaXuPh/L6Zq0u/a56w=;
 b=TTF/NgEgBH25uJPBnvS8vi8aC2h+AurkvOqFsFifsX+edC086T/ZurqjmtF1WD5aHNNlVPvZ+QwcLHHGvv3OJpzN6LrE+ICqMVP+8QUsg8KnBbbLTSLUyMcxPBGHjG+Bmz61ZdQpAs1vyH3zwLZwXfY20kGwlZT6jbjnB4mf56g=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Rahul Singh <Rahul.Singh@arm.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [OSSTEST] ts-kernel-build: add kernel kconfig for the Arndale
Thread-Topic: [OSSTEST] ts-kernel-build: add kernel kconfig for the Arndale
Thread-Index: AQHZu81JNSQT8M0pukCzoS21u4bdG6/ENcMAgAA4KoCABE2HAIAAAJYA
Date: Mon, 24 Jul 2023 10:30:20 +0000
Message-ID: <D162FEBE-9C66-43E5-A562-4CDB864E91A3@arm.com>
References: <20230721121627.1229906-1-luca.fancellu@arm.com>
 <ceb7d6ad-0292-facf-6ad5-4bd265a8d34d@suse.com>
 <2CA77C15-BA9B-4D98-80A0-B1B7EDE4E48B@arm.com>
 <af1388d4-ddd8-4afe-8710-f5a780e8c333@perard>
In-Reply-To: <af1388d4-ddd8-4afe-8710-f5a780e8c333@perard>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB4PR08MB9309:EE_|DBAEUR03FT027:EE_|PAVPR08MB9555:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f27b57-bfc9-46e1-d1cf-08db8c3100a6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5gczrG4w4/Oc6yt+Z3r05MKSXT1s2XBJ9z3sOtiWDasy1/9QAAnncRHp6IIJVuMozdzRAFfVxCjhlejw8sBA7Fy2hFaRt21URmPZ40u+Jt40jTPAQjAvKfYspq0yeDWX0uua7RNmWpQn+71C1i9g6EpUQ0YTXV2+2pTCwN8eF7ziC3RnXoxAKCoYmKz0llwBVbRGBkrmIoyFwojRJ3cSlMidWkjUIXOd9xnLfHTaWnFVBNhQPN3HjRaueivQcw9yUj/2opL8Df6/VRVjAwFM9/kWiJbOuAdarYh1CHKd2j2NlQ+hO+44E6IwEOi1MtnoivsyBCPjQVv4mVOEyJRnADFOrsJivXSsOt++vtf1bc3FQAO4XIUnXToqi5R4k41RuVzKMY3I7xTYVfaBqqKQQsTmugQ//wSa1Hktljg3LojsD8J5usbGDeWu+DkOwGlzKBIqWOvdLEXyPhL9nuvZdTiRe87hR8eTf9uO20UQ9n8k4j2nC0pS0Aowoes36Nn0PYsfvXde4WeVc9MtETp1sGY078xvJBY0C8e2ipDuHSpstFahwBdCZCHd3EpsVb4VlJyWksGAZ5wP/bwfg747uZpYwEqg0aJgZlPLMTicgOZEo6WnVxP00WFnrAjEqhExQkmQWC40UtuavXkbqK5+/A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39850400004)(366004)(451199021)(91956017)(2906002)(64756008)(76116006)(66946007)(66446008)(66556008)(66476007)(6916009)(71200400001)(33656002)(478600001)(6486002)(6512007)(86362001)(54906003)(36756003)(122000001)(186003)(2616005)(38070700005)(53546011)(6506007)(26005)(38100700002)(4326008)(5660300002)(8936002)(41300700001)(8676002)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8B6DDB9BAB25F4493BE53398A7F1353@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9309
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	040fb921-6176-47bb-afbe-08db8c30fb8e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	65tcLxNtSC+yMsZE8mnW38z0+7v5GdeD4ca/WPe7FTIxAil1S81X3BOFr/vBSD2cmwMxXjdldCCduSzDPUkYmB/ODLjbTZUB+6JUJmcVrVQ+10M7AwKrXa7szASiD9hy7aQtFRg9usIlkORmIPdaUwgHxPNj6evzHLgIaVaL6AcRXyu4nG/XAq6rC1tP/zI8opSptxpqDEAfgo3suAjmJzBByFPoHv0q7S0cHDt5IzW0CjifchHmlIWZ9QJeQG72S6VWBr6AqXbNQtEprMGW+M6ZkOlfk++WlFK/0cJyR8iEhQpXbDUwjCwWhBdZINzM0B1oNehnwGAFAUsvrQnIqij7IfOopLl0ZFTxwusvDmYCIrhB0Q1+2/3XKe2rfVn/cLYbpkRS48fDcvEj2TWFjo4mbUI4bDdqDUHEixsTXgWtWli9JUKiQE/Xc239cONSmTRBD6RppjjjHynEOXCVzpFgO86a0Dtghms0Md5BF0K2bmd92Qm3KjNYXNPNyIPbjnsFrH2N8OAtek3VtST2e2A/zmSmpn+4LvOd1a3Ie3LReawRJfoyi3bhmQW1glRUggMYfpEOTQ6InwHK4xnUy6EqNY3HYz5+M8fPy8uLWm1hymPXCfdvUGUfmfdYXewpZ7smMLxkGX/7UQ1QDstOat4Jzis0SV80QEXJQTTwLK4pyXHN+e6lM6KMoaUFjqBWzt6ETVUYQn3CzBz99FXPxGe9Oy5SSTh+W7LSEnvisNXSokUGnRO8JELf1ckAfUOB
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(82310400008)(451199021)(36840700001)(46966006)(40470700004)(36860700001)(81166007)(36756003)(40480700001)(86362001)(33656002)(82740400003)(40460700003)(356005)(54906003)(478600001)(2906002)(186003)(336012)(26005)(6506007)(6512007)(6486002)(8936002)(5660300002)(8676002)(6862004)(316002)(41300700001)(70206006)(70586007)(4326008)(53546011)(47076005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 10:30:29.5119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f27b57-bfc9-46e1-d1cf-08db8c3100a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9555

DQoNCj4gT24gMjQgSnVsIDIwMjMsIGF0IDExOjI4LCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIEp1bCAyMSwgMjAyMyBhdCAw
NDo0NTo0NFBNICswMDAwLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+IE9uIDIxIEp1bCAyMDIz
LCBhdCAxNDoyNCwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+PiBP
biAyMS4wNy4yMDIzIDE0OjE2LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+PiAtLS0gYS90cy1r
ZXJuZWwtYnVpbGQNCj4+Pj4gKysrIGIvdHMta2VybmVsLWJ1aWxkDQo+Pj4+IEBAIC0yNDUsNiAr
MjQ1LDcgQEAgc2V0b3B0IENPTkZJR19TRU5TT1JTX0xNOTAgbg0KPj4+PiBzZXRvcHQgQ09ORklH
X0lDUzkzMlM0MDEgbg0KPj4+PiANCj4+Pj4gIyBFbmFibGUgc29tZSBhZGRpdGlvbmFsIGRyaXZl
cnMgZm9yIEFybmRhbGUuDQo+Pj4+ICtzZXRvcHQgQ09ORklHX0FIQ0lfRFdDIHkNCj4+PiANCj4+
PiAuLi4gZG9lcyBpdCByZWFsbHkgbmVlZCB0byBiZSB5IChhbmQgbm90IG0pIGhlcmU/DQo+PiAN
Cj4+IEkgZGlkbuKAmXQgdHJ5IHdpdGggbSBiZWZvcmUgYmVjYXVzZSBJIHdhcyB1bnN1cmUgd2hl
cmUgdGhlIGtlcm5lbCBtb2R1bGUgd2VyZSBwdXQgKGluIHRoZSBkaXNrPyBCdXQgdGhlbiB3ZSBu
ZWVkIHRvIHJlYWQgaXQpLA0KPj4gYnV0IG5vdyBJIGRpZCBhIHRyeSB3aXRoIOKAmG3igJkgYW5k
IGl0IHdvcmtzLCBzbyBJIGd1ZXNzIHRoZSBtb2R1bGUgYXJlIHB1dCBpbiBzb21lIHJhbWRpc2sg
aW5zdGVhZCBvZiB0aGUgZGlzayB3ZSB3YW50IHRvIHJlYWQuDQo+PiANCj4+IFRoYW5rcyBmb3Ig
cG9pbnRpbmcgdGhhdCBvdXQuDQo+PiANCj4+IEBSb2dlciwgaXMgaXQgcG9zc2libGUgdG8gY2hh
bmdlIGl0IG9uIGNvbW1pdCBvciBzaG91bGQgSSBzZW5kIGEgdjI/DQo+IA0KPiBJJ3ZlIHB1c2hl
ZCB0aGUgcGF0Y2ggdG8gInByZXRlc3QiIHdpdGggdGhpcyBtb2RpZmljYXRpb24uDQoNClRoYW5r
cyBBbnRob255DQoNCj4gDQo+IElmIG9zc3Rlc3QgaXMgaGFwcHkgd2l0aCB0aGUgcGF0Y2ggKHRo
YXQgaXMgbm8gcmVncmVzc2lvbiB3aXRoIGENCj4gInhlbi11bnN0YWJsZSIgZmxpZ2h0KSwgaXQg
d2lsbCBiZSBjb21taXR0ZWQuDQoNCkZpbmdlcnMgY3Jvc3NlZA0KDQpDaGVlcnMsDQpMdWNhDQoN
Cj4gDQo+IFRoYW5rcywNCj4gDQo+IC0tIA0KPiBBbnRob255IFBFUkFSRA0KDQo=

