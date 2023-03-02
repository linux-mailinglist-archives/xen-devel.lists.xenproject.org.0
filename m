Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779D86A8093
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 12:00:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504845.777266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXgfc-0003BA-E8; Thu, 02 Mar 2023 11:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504845.777266; Thu, 02 Mar 2023 11:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXgfc-00039S-BI; Thu, 02 Mar 2023 11:00:20 +0000
Received: by outflank-mailman (input) for mailman id 504845;
 Thu, 02 Mar 2023 11:00:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lklr=62=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pXgfa-00039F-4B
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 11:00:18 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68d65cae-b8e9-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 12:00:15 +0100 (CET)
Received: from DB7PR02CA0031.eurprd02.prod.outlook.com (2603:10a6:10:52::44)
 by DU0PR08MB9348.eurprd08.prod.outlook.com (2603:10a6:10:420::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 10:59:45 +0000
Received: from DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::46) by DB7PR02CA0031.outlook.office365.com
 (2603:10a6:10:52::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19 via Frontend
 Transport; Thu, 2 Mar 2023 10:59:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT015.mail.protection.outlook.com (100.127.142.112) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.19 via Frontend Transport; Thu, 2 Mar 2023 10:59:44 +0000
Received: ("Tessian outbound cfb430c87a1e:v135");
 Thu, 02 Mar 2023 10:59:44 +0000
Received: from 4f49bb49afd9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6E48E64F-4B5C-44B4-B0E5-E14CE639C206.1; 
 Thu, 02 Mar 2023 10:59:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4f49bb49afd9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Mar 2023 10:59:38 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB9827.eurprd08.prod.outlook.com (2603:10a6:10:460::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 10:59:36 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::f0e7:5f67:ed2f:a70a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::f0e7:5f67:ed2f:a70a%4]) with mapi id 15.20.6156.018; Thu, 2 Mar 2023
 10:59:36 +0000
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
X-Inumbo-ID: 68d65cae-b8e9-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxAIuiwrQCtAuLVxb0RF6pYc0I4QlhSkLghUhk+zzvc=;
 b=aRiQG/FeDtUa4X26zhjUG1jN5AaNwMKMTc+M1gawvgkFAR3yPrJEZypG8AYaSL8qQNcisfg9JX5GBeLo004QKyEWRyw4vEbZMF4J548z0J9gD1mUDaFXHtnr66QK3Dj1cRpivqm0hR2bIvgJGMcofNaV7SBKcz2hrTXfOwUuCN4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a3ac549512319d07
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1Zgsj1ZvjeKDB3YbnbqFUaNMOFKIeo3lG73AYo+fOliTT0ZN600o3sP4INRBUhkC5mzC+kMk3eogS5VJadRXlYyGhHsqVkCz3vBE8MJHAxL8YojXDaLFvGI5T3iirAFftgiz+sAr1VKJLbuatYyDBgbYJNn947io6rHJFEMsjnJ5ROcTc6b7rjL2/ABfW9lIgo1wyAH99jTKCLYQ7pukwlgHoKMqa2/CAySXB5fmWNT31uIfMEpyhnR1fpN+iSAe0iBpgvMcEfm52+EA8VW635vrKXPmEcXlnnGc7trC8r0aNszezFCdXOlJVMmeFhXuDxFTlIWrt29X/XK/YN8Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxAIuiwrQCtAuLVxb0RF6pYc0I4QlhSkLghUhk+zzvc=;
 b=Lv4nWG0wR3bJRYu2EQhAFn7DLcTT64SHLYGS/3CnYGJn+tD3fBxXHQK/0WMWaPwMVAYSkEU1c5UMdnj5IIo0OtRX10UTMEuSt7i5odlxwCBdaPU4Rq5YD2znc+BDkwwkjl+we6hJsGThR839iRaUpk0WT2z6TUVlcmbIFUS822qHDp6vZY4WjwZ1QWd8BSzSmNmrrreJV9sDd2v/ptyKct0nU4uJSS+iXKfYTzAU7Gs1TPUZN5EN6s0Rab+XoyQBgGUOSTARDfIGAogU5VFMUVzX2MWabiUZVXub6ynJQVie3Cs5OtuXMby9SfQLxvn+mMuxYPeBqksciLsQQE7TsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxAIuiwrQCtAuLVxb0RF6pYc0I4QlhSkLghUhk+zzvc=;
 b=aRiQG/FeDtUa4X26zhjUG1jN5AaNwMKMTc+M1gawvgkFAR3yPrJEZypG8AYaSL8qQNcisfg9JX5GBeLo004QKyEWRyw4vEbZMF4J548z0J9gD1mUDaFXHtnr66QK3Dj1cRpivqm0hR2bIvgJGMcofNaV7SBKcz2hrTXfOwUuCN4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 1/2] xen/cppcheck: add a way to exclude files from the
 scan
Thread-Topic: [PATCH v2 1/2] xen/cppcheck: add a way to exclude files from the
 scan
Thread-Index: AQHZTCPAFkIxBTdSO0yOTrnaP+pA8a7mnRSAgAC2voA=
Date: Thu, 2 Mar 2023 10:59:35 +0000
Message-ID: <D40B74ED-1FB2-440F-A816-A47F837FABD6@arm.com>
References: <20230301095320.264301-1-luca.fancellu@arm.com>
 <20230301095320.264301-2-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2303011558170.3680@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2303011558170.3680@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB9827:EE_|DBAEUR03FT015:EE_|DU0PR08MB9348:EE_
X-MS-Office365-Filtering-Correlation-Id: d6f486da-cbbb-483b-cfd7-08db1b0d3b65
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 au8oOjvW7eAj09Ev0yWclNzIcNGcbAf2AYjHdLcUASCPy082tDrII2Aw8bHqumOzhw0vi5fBWEY6NBp6fS6PtvG1wk/lP4Uvd1cRCVuvxxq/KE4ksoyIJOOLYR27swyZihC7lCwN0AApfTTxXXeB2qkss3F+jhAHHRDuM4Ksz76yL99rFvre9rRsmoBp013W/6sxQjBerKsorcwjwf3mwux7r10nIbbBdUEzywQuodpdMZOEf+t//gw7WdcWefNgoxG3/TyyjhP2a5n1s4mzEGJml80EeAL0Y1zKNcicoF85yrdLS+h4S+36F5SZbZnV+iu0eS2gjyD/Pu/ehC9kWL5m4g3NHfbZZjUD8nOv2einNJWoYyZ38Nbhyomsgq2N2/QU43BoUdVYBFx9qjmrWlO2ngkPmuushks007adUulcDEE27Oh8G2wBVvxHci0X9zQOJSWm5Pd4+rJfNiZ6T9iAj6FlBBS1lU61pStn4OSgFyyEoUhNvIvQDKSW6RCtl5ZTw+fmi60pRWdaVRBAsvuJ8SFuNWS8728FLfYG8VfpzdPWmAH4aKntrYDCYWK+gg6XsOdAKlHKkNJFSS7nErCHYD6dulfVgrX3QQ+bFmGIfJy1o3oTk5RKWe2IcqcTTPojNUOtPwRD/0PxA9HtMljNreLXKdGGo6nH8UvoYfjZDcC0JNaObXRKIbJ7g1HysvKn0pclp8HeYx99rz5T731e0ZsU6+9Abrmus5qHHfOG80k2IEI7jdyK3BxuDzv9
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199018)(36756003)(71200400001)(6512007)(6486002)(6506007)(26005)(186003)(2616005)(6916009)(41300700001)(54906003)(316002)(91956017)(4326008)(64756008)(66446008)(66476007)(66556008)(8676002)(76116006)(2906002)(5660300002)(478600001)(8936002)(38100700002)(122000001)(86362001)(33656002)(38070700005)(66946007)(83380400001)(43043002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF834B555DEA314087C95A9845B5A9E2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9827
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	64cc84b4-1d68-4f32-4ebe-08db1b0d360c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X6QjIVGPVf/aTde5tEyqjWI77Vk7Fm+Ui/+kh5gAo/q1Ldx9iFJMayUfFmI44FVaC0FzGB1ErNdJ9hdvHuIFcWcCa9jyUjl9Og4kOys/eQlDehcwdXN9ldxxAIJhD1OXSIBDivsarRg+HLlLGdmA5R05LwpgPNiT5AcRcGM3uO//asJDk0wXZffe0oNcdaM1ar8h1/lXBLmnP49xTHjB3X0sVGQ1BkPiJeAT2IOSllPihrG9docRFCfiAp9jHIyR63DmiINkDvoEz/YDeM9vj3mdp5I8ZO6cKb0IUo7QBgdXMlbDvBvXDgbrgWd6tEfK/SC+T3+BB1GmfVdUh761IU5Ro5y+mUaVNOwkstsRRj8wYhWkW9k4FB28Vt4Ix8BbkRgTbrtvlp6Z7ipAHumlBANRrFDF1rfqwdhAhbO4Eqgmmq7ye2qxBUjiOFnjFBqSuUP596qyqVz3y3XklTVbA/7q1Cy2/2j5jQD1fbStn68qLVD1eA2oql0fK20EmzCamDJVFIsOuJOJP6/TL29OE7M4t0VkxW34d7aA6dZhdGxaPzxsGuLOPXl/fZtqQ2Vq/uxB0s4xWgfeDahQxJcgSCl+tKN6y9MektijLfcQO1iAETv55E39bwD/XOEKov+IzinKZGTv17SQMhUKt8JNCLNfpHGUqaIdUoDGTwzHQqHsxTQOSCVPBEtOK04bXZ5uhBBDhyYGlAnZyHSEC15BjfjQQCVMqgpYwycMWX9nAf4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199018)(36840700001)(46966006)(40470700004)(83380400001)(36860700001)(47076005)(40460700003)(36756003)(5660300002)(6862004)(478600001)(8936002)(81166007)(82740400003)(356005)(33656002)(82310400005)(86362001)(40480700001)(26005)(186003)(2616005)(336012)(6512007)(6486002)(6506007)(8676002)(70206006)(2906002)(70586007)(316002)(41300700001)(4326008)(54906003)(43043002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 10:59:44.8110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f486da-cbbb-483b-cfd7-08db1b0d3b65
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9348

DQo+PiArRXhjbHVkZSBmaWxlIGxpc3QgZm9yIHhlbi1hbmFseXNpcyBzY3JpcHQNCj4+ICs9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPj4gKw0KPj4gK1RoZSBjb2Rl
IGFuYWx5c2lzIGlzIHBlcmZvcm1lZCBvbiB0aGUgWGVuIGNvZGViYXNlIGZvciBib3RoIE1JU1JB
IGNoZWNrZXJzIGFuZA0KPj4gK3N0YXRpYyBhbmFseXNpcyBjaGVja2VycywgdGhlcmUgYXJlIHNv
bWUgZmlsZXMgaG93ZXZlciB0aGF0IG5lZWRzIHRvIGJlIHJlbW92ZWQNCj4+ICtmcm9tIHRoZSBm
aW5kaW5ncyByZXBvcnQgYmVjYXVzZSB0aGV5IGFyZSBub3Qgb3duZWQgYnkgWGVuIGFuZCB0aGV5
IG11c3QgYmUga2VwdA0KPj4gK2luIHN5bmMgd2l0aCB0aGVpciBvcmlnaW4gKGNvbXBsZXRlbHkg
b3IgZXZlbiBwYXJ0aWFsbHkpLCBoZW5jZSB3ZSBjYW4ndCBlYXNpbHkNCj4+ICtmaXggZmluZGlu
Z3Mgb3IgZGV2aWF0ZSBmcm9tIHRoZW0uDQo+IA0KPiBJIHdvdWxkIHN0YXkgbW9yZSBnZW5lcmlj
IGFuZCBzYXkgc29tZXRoaW5nIGxpa2U6DQo+IA0KPiBUaGUgY29kZSBhbmFseXNpcyBpcyBwZXJm
b3JtZWQgb24gdGhlIFhlbiBjb2RlYmFzZSBmb3IgYm90aCBNSVNSQQ0KPiBjaGVja2VycyBhbmQg
c3RhdGljIGFuYWx5c2lzIGNoZWNrZXJzLCB0aGVyZSBhcmUgc29tZSBmaWxlcyBob3dldmVyIHRo
YXQNCj4gbmVlZHMgdG8gYmUgcmVtb3ZlZCBmcm9tIHRoZSBmaW5kaW5ncyByZXBvcnQgZm9yIHZh
cmlvdXMgcmVhc29ucyAoZS5nLg0KPiB0aGV5IGFyZSBpbXBvcnRlZCBmcm9tIGV4dGVybmFsIHNv
dXJjZXMsIHRoZXkgZ2VuZXJhdGUgdG9vIG1hbnkgZmFsc2UNCj4gcG9zaXRpdmUgcmVzdWx0cywg
ZXRjLikuDQo+IA0KPiBCdXQgd2hhdCB5b3Ugd3JvdGUgaXMgYWxzbyBPSy4NCg0KSeKAmW0gb2sg
d2l0aCB0aGF0IHRvbywgSSBjYW4gdXBkYXRlIHdpdGggeW91ciB3b3JkaW5ncw0KPj4gDQo+PiAr
KysgYi94ZW4vc2NyaXB0cy94ZW5fYW5hbHlzaXMvZXhjbHVzaW9uX2ZpbGVfbGlzdC5weQ0KPj4g
QEAgLTAsMCArMSw3OSBAQA0KPj4gKyMhL3Vzci9iaW4vZW52IHB5dGhvbjMNCj4+ICsNCj4+ICtp
bXBvcnQgb3MsIGdsb2IsIGpzb24NCj4+ICtmcm9tIC4gaW1wb3J0IHNldHRpbmdzDQo+PiArDQo+
PiArY2xhc3MgRXhjbHVzaW9uRmlsZUxpc3RFcnJvcihFeGNlcHRpb24pOg0KPj4gKyAgICBwYXNz
DQo+PiArDQo+PiArDQo+PiArZGVmIF9fY3BwY2hlY2tfcGF0aF9leGNsdWRlX3N5bnRheChwYXRo
KToNCj4+ICsgICAgIyBQcmVwZW5kaW5nICogdG8gdGhlIHJlbGF0aXZlIHBhdGggdG8gbWF0Y2gg
ZXZlcnkgcGF0aCB3aGVyZSB0aGUgWGVuDQo+PiArICAgICMgY29kZWJhc2UgY291bGQgYmUNCj4+
ICsgICAgcGF0aCA9ICIqIiArIHBhdGgNCj4+ICsNCj4+ICsgICAgIyBDaGVjayBpZiB0aGUgcGF0
aCBpcyB0byBhIGZvbGRlciB3aXRob3V0IHRoZSB3aWxkY2FyZCBhdCB0aGUgZW5kDQo+PiArICAg
IGlmIG5vdCAocGF0aC5lbmRzd2l0aCgiLmMiKSBvciBwYXRoLmVuZHN3aXRoKCIuaCIpIG9yIHBh
dGguZW5kc3dpdGgoIioiKSk6DQo+IA0KPiBJc24ndCB0aGVyZSBhIHB5dGhvbiBjYWxsIHRvIGNo
ZWNrIHRoYXQgaXQgaXMgYWN0dWFsbHkgYSBmb2xkZXI/IEkgdGhpbmsNCj4gdGhhdCB3b3VsZCBi
ZSBtb3JlIHJlc2lsaWVudCBiZWNhdXNlIG90aGVyd2lzZSBpZiBzb21lb25lIHBhc3NlcyBhIC5T
IG9yDQo+IC5jcHAgZmlsZSBpdCB3b3VsZCBiZSBkZXRlY3RlZCBhcyBkaXJlY3RvcnkuDQo+IA0K
PiANCj4+ICsgICAgICAgICMgVGhlIHBhdGggaXMgdG8gYSBmb2xkZXIsIGlmIGl0IGRvZXNuJ3Qg
aGF2ZSB0aGUgZmluYWwgLywgYWRkIGl0DQo+PiArICAgICAgICBpZiBub3QgcGF0aC5lbmRzd2l0
aCgiLyIpOg0KPj4gKyAgICAgICAgICAgIHBhdGggPSBwYXRoICsgIi8iDQo+PiArICAgICAgICAj
IFNpbmNlIHRoZSBwYXRoIGlzIGEgZm9sZGVyLCBhZGQgYSB3aWxkY2FyZCB0byB0aGUgZW5kIHNv
IHRoYXQNCj4+ICsgICAgICAgICMgY3BwY2hlY2sgd2lsbCByZW1vdmUgZXZlcnkgaXNzdWUgcmVs
YXRlZCB3aXRoIHRoaXMgcGF0aA0KPj4gKyAgICAgICAgcGF0aCA9IHBhdGggKyAiKiINCj4+ICsN
Cj4+ICsgICAgcmV0dXJuIHBhdGgNCg0KWWVzIHlvdSBhcmUgdmVyeSByaWdodCwgaGVyZSBJIHdh
bnRlZCB0byBhY2NlcHQgdGhlIHJlbGF0aXZlIHBhdGggdG8gYSBmb2xkZXIgd2l0aA0Kb3Igd2l0
aG91dCB0aGUgZW5kaW5nICcvKuKAmSwgYnV0IGl0IGNhcnJpZXMgb24gbXVjaCBtb3JlIGNvbXBs
ZXhpdHkgYmVjYXVzZSBoZXJlIHRoZQ0KcmVsYXRpdmUgcGF0aCBjYW4gY29udGFpbiB3aWxkY2Fy
ZHMgaW4gaXQsIHNvIHdlIGNhbuKAmXQgdXNlIG9zLnBhdGguaXNkaXIoKSB3aGljaCB3b3VsZA0K
ZmFpbC4NCg0KQXQgY29zdCBvZiBiZWluZyBtb3JlIHN0cmljdCBvbiBob3cgZm9sZGVycyBzaGFs
bCBiZSBkZWNsYXJlZCwgSSB0aGluayBpdOKAmXMgYmV0dGVyIHRvDQplbmZvcmNlIHRoZSDigJgv
KuKAmSBhdCB0aGUgZW5kIG9mIGEgcGF0aCB0aGF0IGlzIGV4Y2x1ZGluZyBhIGZvbGRlci4NCg0K
V2UgaGF2ZSBhIHByZXZpb3VzIGNoZWNrIHVzaW5nIGdsb2IoKSB0byBlbnN1cmUgcGF0aCB3aXRo
IHdpbGRjYXJkcyBhcmUgcmVhbCBwYXRoDQpzbyB3ZSBhcmUgc2FmZSB0aGF0IHRoZSBwYXNzZWQg
cmVsYXRpdmUgcGF0aCBhcmUgT0suDQoNCkRyb3BwaW5nIHRoZSByZXF1aXJlbWVudCBvZiBwYXNz
aW5nIGZvbGRlciBwYXRocyB3aXRoIG9yIHdpdGhvdXQgdGhlIOKAmC8q4oCZIHNpbXBsaWZpZXMN
CnRoZSBjb2RlIGFuZCB0aGlzIHdvdWxkIGJlIHRoZSBmaW5hbCByZXN1bHQ6DQoNCg0KZGlmZiAt
LWdpdCBhL2RvY3MvbWlzcmEvZXhjbHVkZS1saXN0LnJzdCBiL2RvY3MvbWlzcmEvZXhjbHVkZS1s
aXN0LnJzdA0KaW5kZXggOTY5NTM5YzQ2YmViLi5jOTc0MzFhODYxMjAgMTAwNjQ0DQotLS0gYS9k
b2NzL21pc3JhL2V4Y2x1ZGUtbGlzdC5yc3QNCisrKyBiL2RvY3MvbWlzcmEvZXhjbHVkZS1saXN0
LnJzdA0KQEAgLTMsMTEgKzMsMTEgQEANCiBFeGNsdWRlIGZpbGUgbGlzdCBmb3IgeGVuLWFuYWx5
c2lzIHNjcmlwdA0KID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQog
DQotVGhlIGNvZGUgYW5hbHlzaXMgaXMgcGVyZm9ybWVkIG9uIHRoZSBYZW4gY29kZWJhc2UgZm9y
IGJvdGggTUlTUkEgY2hlY2tlcnMgYW5kDQotc3RhdGljIGFuYWx5c2lzIGNoZWNrZXJzLCB0aGVy
ZSBhcmUgc29tZSBmaWxlcyBob3dldmVyIHRoYXQgbmVlZHMgdG8gYmUgcmVtb3ZlZA0KLWZyb20g
dGhlIGZpbmRpbmdzIHJlcG9ydCBiZWNhdXNlIHRoZXkgYXJlIG5vdCBvd25lZCBieSBYZW4gYW5k
IHRoZXkgbXVzdCBiZSBrZXB0DQotaW4gc3luYyB3aXRoIHRoZWlyIG9yaWdpbiAoY29tcGxldGVs
eSBvciBldmVuIHBhcnRpYWxseSksIGhlbmNlIHdlIGNhbid0IGVhc2lseQ0KLWZpeCBmaW5kaW5n
cyBvciBkZXZpYXRlIGZyb20gdGhlbS4NCitUaGUgY29kZSBhbmFseXNpcyBpcyBwZXJmb3JtZWQg
b24gdGhlIFhlbiBjb2RlYmFzZSBmb3IgYm90aCBNSVNSQQ0KK2NoZWNrZXJzIGFuZCBzdGF0aWMg
YW5hbHlzaXMgY2hlY2tlcnMsIHRoZXJlIGFyZSBzb21lIGZpbGVzIGhvd2V2ZXIgdGhhdA0KK25l
ZWRzIHRvIGJlIHJlbW92ZWQgZnJvbSB0aGUgZmluZGluZ3MgcmVwb3J0IGZvciB2YXJpb3VzIHJl
YXNvbnMgKGUuZy4NCit0aGV5IGFyZSBpbXBvcnRlZCBmcm9tIGV4dGVybmFsIHNvdXJjZXMsIHRo
ZXkgZ2VuZXJhdGUgdG9vIG1hbnkgZmFsc2UNCitwb3NpdGl2ZSByZXN1bHRzLCBldGMuKS4NCiAN
CiBGb3IgdGhpcyByZWFzb24gdGhlIGZpbGUgZG9jcy9taXNyYS9leGNsdWRlLWxpc3QuanNvbiBp
cyB1c2VkIHRvIGV4Y2x1ZGUgZXZlcnkNCiBlbnRyeSBsaXN0ZWQgaW4gdGhhdCBmaWxlIGZyb20g
dGhlIGZpbmFsIHJlcG9ydC4NCkBAIC00MiwzICs0Miw1IEBAIEhlcmUgaXMgYW4gZXhwbGFuYXRp
b24gb2YgdGhlIGZpZWxkcyBpbnNpZGUgYW4gb2JqZWN0IG9mIHRoZSAiY29udGVudCIgYXJyYXk6
DQogDQogVG8gZWFzZSB0aGUgcmV2aWV3IGFuZCB0aGUgbW9kaWZpY2F0aW9ucyBvZiB0aGUgZW50
cmllcywgdGhleSBzaGFsbCBiZSBsaXN0ZWQgaW4NCiBhbHBoYWJldGljYWwgb3JkZXIgcmVmZXJy
aW5nIHRvIHRoZSByZWxfcGF0aCBmaWVsZC4NCitFeGNsdWRlZCBmb2xkZXIgcGF0aHMgc2hhbGwg
ZW5kIHdpdGggJy8qJyBpbiBvcmRlciB0byBtYXRjaCBldmVyeXRoaW5nIG9uIHRoYXQNCitmb2xk
ZXIuDQpkaWZmIC0tZ2l0IGEveGVuL3NjcmlwdHMveGVuX2FuYWx5c2lzL2V4Y2x1c2lvbl9maWxl
X2xpc3QucHkgYi94ZW4vc2NyaXB0cy94ZW5fYW5hbHlzaXMvZXhjbHVzaW9uX2ZpbGVfbGlzdC5w
eQ0KaW5kZXggNGE0N2E5MGY1OTQ0Li44NzFlNDgwNTg2YmIgMTAwNjQ0DQotLS0gYS94ZW4vc2Ny
aXB0cy94ZW5fYW5hbHlzaXMvZXhjbHVzaW9uX2ZpbGVfbGlzdC5weQ0KKysrIGIveGVuL3Njcmlw
dHMveGVuX2FuYWx5c2lzL2V4Y2x1c2lvbl9maWxlX2xpc3QucHkNCkBAIC0xMiwxNSArMTIsNiBA
QCBkZWYgX19jcHBjaGVja19wYXRoX2V4Y2x1ZGVfc3ludGF4KHBhdGgpOg0KICAgICAjIGNvZGVi
YXNlIGNvdWxkIGJlDQogICAgIHBhdGggPSAiKiIgKyBwYXRoDQogDQotICAgICMgQ2hlY2sgaWYg
dGhlIHBhdGggaXMgdG8gYSBmb2xkZXIgd2l0aG91dCB0aGUgd2lsZGNhcmQgYXQgdGhlIGVuZA0K
LSAgICBpZiBub3QgKHBhdGguZW5kc3dpdGgoIi5jIikgb3IgcGF0aC5lbmRzd2l0aCgiLmgiKSBv
ciBwYXRoLmVuZHN3aXRoKCIqIikpOg0KLSAgICAgICAgIyBUaGUgcGF0aCBpcyB0byBhIGZvbGRl
ciwgaWYgaXQgZG9lc24ndCBoYXZlIHRoZSBmaW5hbCAvLCBhZGQgaXQNCi0gICAgICAgIGlmIG5v
dCBwYXRoLmVuZHN3aXRoKCIvIik6DQotICAgICAgICAgICAgcGF0aCA9IHBhdGggKyAiLyINCi0g
ICAgICAgICMgU2luY2UgdGhlIHBhdGggaXMgYSBmb2xkZXIsIGFkZCBhIHdpbGRjYXJkIHRvIHRo
ZSBlbmQgc28gdGhhdA0KLSAgICAgICAgIyBjcHBjaGVjayB3aWxsIHJlbW92ZSBldmVyeSBpc3N1
ZSByZWxhdGVkIHdpdGggdGhpcyBwYXRoDQotICAgICAgICBwYXRoID0gcGF0aCArICIqIg0KLQ0K
ICAgICByZXR1cm4gcGF0aA0KIA0KIA0KSeKAmXZlIGluY2x1ZGVkIGFsc28geW91ciB3b3JkaW5n
IGFuZCBJ4oCZdmUgc3BlY2lmaWVkIGluIHRoZSBkb2NzIGhvdyB0byBleGNsdWRlIGEgZm9sZGVy
Lg0KDQpEbyB5b3UgdGhpbmsgaXTigJlzIG9rIHRvIHByb2NlZWQgaW4gdGhpcyB3YXk/DQoNCkNo
ZWVycywNCkx1Y2ENCg0KDQo=

