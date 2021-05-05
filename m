Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BDD3735D8
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 09:52:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122871.231808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCJv-0003LO-6y; Wed, 05 May 2021 07:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122871.231808; Wed, 05 May 2021 07:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCJv-0003J9-3u; Wed, 05 May 2021 07:51:47 +0000
Received: by outflank-mailman (input) for mailman id 122871;
 Wed, 05 May 2021 07:51:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0w6=KA=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1leCJs-0003J3-Ut
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 07:51:45 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::612])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62ce0968-639f-4806-b820-863912caccdd;
 Wed, 05 May 2021 07:51:42 +0000 (UTC)
Received: from AM5PR0202CA0022.eurprd02.prod.outlook.com
 (2603:10a6:203:69::32) by AM5PR0802MB2420.eurprd08.prod.outlook.com
 (2603:10a6:203:9e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.40; Wed, 5 May
 2021 07:51:40 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::88) by AM5PR0202CA0022.outlook.office365.com
 (2603:10a6:203:69::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Wed, 5 May 2021 07:51:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 07:51:40 +0000
Received: ("Tessian outbound 9a5bb9d11315:v91");
 Wed, 05 May 2021 07:51:39 +0000
Received: from fbb2d1a33498.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0CCFF538-6831-4542-855D-2F78452B5B97.1; 
 Wed, 05 May 2021 07:51:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fbb2d1a33498.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 May 2021 07:51:33 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6517.eurprd08.prod.outlook.com (2603:10a6:20b:31b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Wed, 5 May
 2021 07:51:23 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::856e:d103:212c:8f50]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::856e:d103:212c:8f50%4]) with mapi id 15.20.4087.044; Wed, 5 May 2021
 07:51:22 +0000
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
X-Inumbo-ID: 62ce0968-639f-4806-b820-863912caccdd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ei+MbNbWj9fMRiHITeteag47v3N76yJUMY45bCUTQxg=;
 b=pH9MHbqph+1D6nzAc+MtBLsovZbYdrJlsYtEj5ARGNjEreu3jOkdk8dZdRUYZbA5BIiL9Ilbryuelwzv98HOff743dvmfuTVPP3RGqqnG0cth1E9sTelCBn7pHYQlEwd8NapacBBpIvYkKrq7uYQyH+nlTenv9vVDnuNQnVhCQ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1fdb80b0f37297a8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4T1dZcR8z+3GxqKSqSXTztuVaxSW0YvyCdftEaLJdCkVBKWPE5w+S+CTA2MXbCiU86Ke6cNbyI5wILWvG6DAgDVGa33JSuosRAgbXyNmwUTGn61QDQjViZ6Kn3Tu+7suP9Rp50tXnO1L6H6CPNxbKSTxrvWZUm5dDwdBBeQROt+wYf8u2DOxIeFXx37uIKsIiRFeUPvaVnhqu9Fl1RLVXdK8jos2Qt22CJR+AYAcwRrXArgqflKo3bcs5TlrwQCsBwT8ms3ADmmSEVTZw1GhHTqPo3V8Og1AfbLcVrTRygtRyoMLYkG5q/7RMVEZM/cIO7/ygdG46xE+6yHohm41Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ei+MbNbWj9fMRiHITeteag47v3N76yJUMY45bCUTQxg=;
 b=GxUX4ZBnjH6OvXcl1KPVI7huPY86zQ2yWHZocA/2yiOsBpMfEuxl3WRtdZrFdfgrcta/I/qNYxMVJ5rI9Yznc+M0AoHNDaUiY8ciMHcZhaltKWhGoi5kZxUVc4Xi7yS8ik5GJznmSWmKqFqlrkYIkI3FN9FSC6s3H9qPNcqFJ+0e/mBifEw2ecGNjJ13szL5rNWoUpWirJOC6eZNa3GmU3EDvEnJsjwqpIuCtQkX9ZkrKV5vdZ0rXlkS1pa9KrZXr2wTOnBC8XVQV7hyZ/zCG5e6rAYamFKPXBLpmGqet43TRUsG07MgNnPXvmIgP+lEcvbcYjeEQ9AnpYLWCKWlaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ei+MbNbWj9fMRiHITeteag47v3N76yJUMY45bCUTQxg=;
 b=pH9MHbqph+1D6nzAc+MtBLsovZbYdrJlsYtEj5ARGNjEreu3jOkdk8dZdRUYZbA5BIiL9Ilbryuelwzv98HOff743dvmfuTVPP3RGqqnG0cth1E9sTelCBn7pHYQlEwd8NapacBBpIvYkKrq7uYQyH+nlTenv9vVDnuNQnVhCQ4=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant
	<paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 2/3] xen/pci: Refactor PCI MSI intercept related code
Thread-Topic: [PATCH v4 2/3] xen/pci: Refactor PCI MSI intercept related code
Thread-Index: AQHXPQaiQSZBgPx8y0KxY0XhVGEZGarR2gGAgAKy0wA=
Date: Wed, 5 May 2021 07:51:22 +0000
Message-ID: <2E9765F3-B820-4B8A-BE73-37583202196F@arm.com>
References: <cover.1619707144.git.rahul.singh@arm.com>
 <07cb9f45a91a283af1991c42266555bb0bfe3b71.1619707144.git.rahul.singh@arm.com>
 <65539f2a-8b0c-7f1a-6de1-4032140a4e0e@suse.com>
In-Reply-To: <65539f2a-8b0c-7f1a-6de1-4032140a4e0e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3dc48887-a028-46a7-e157-08d90f9a9e14
x-ms-traffictypediagnostic: AS8PR08MB6517:|AM5PR0802MB2420:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB2420F31569679CD016C87E80FC599@AM5PR0802MB2420.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4714;OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5ihKEJUX/8Q7yPQYduKScvcH9SOw6xldfBHkjFbDEpNtKdGjJjzsrtebG0khRZzLCQB3EK2BauiWZ9QQdN3YViIqb7Ls++fUNlP0o1n/FzaTPBa7tz4Qzhs/wxru28nAxVdYc/Ct1p7p4H0sYzJyYZo3ab4DfIEXVzITNgCdnuIBBgKSHpCWhCt/jJ3KhlC6bS1gUgFTjc/K0QT5+8qeG7b+Cb42tfdPjyY1cud007S6CsJzjXiKaKd8oXD6pi8bmb8tYVADOLtaIc7TkGF8S+DXDq0GOqHWyvrkLwkVf2O6xm2FSPce3HFc7XAoT2xuKdEKtrTV6lh6H5P+XTDMhYG7HGW+YyyIemq+vMse008k5mG86fhtN/2LjIvMBYPKgrcROSkKElHtAIIHabsOKtR2DiwQUcVhhbFp9ESyXd13T0UG/8xB9ltU9xxINO+wlQ8+cy4oJiyl2W0vcI/tySc3joX6Lso5zrSCjh5l2pnxBoe4rcNMrE37vVu9nJsMN2pd03KH8bXp2THR2EPHtv534T4iBckZMmrYtE9yZz2/jDF2pNbV1YmKZH/jxRVlIW1TK5lljHGn0kidPp36aC76wyDvuMyy2tOjSwwqjW8R98+u620CXn8w2TdV6Sg81nh8Bug+C/rAU4Ka3F93s+9KoJW8/rEYx4gWztdEqVREYXDY0Yjeuvzb0DtsdzNEKcAFcCtITdmzzzonVvV80okH+YdmL33dH3m86Rk1Zk2iCu+DGtQeG1EangbbW8XN+PFdeAdxR7xe1x0iEHYrTQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(316002)(5660300002)(6916009)(8936002)(186003)(33656002)(2616005)(8676002)(6486002)(4326008)(54906003)(36756003)(6512007)(2906002)(7416002)(53546011)(71200400001)(122000001)(38100700002)(66556008)(66476007)(64756008)(478600001)(66446008)(6506007)(66946007)(83380400001)(76116006)(91956017)(26005)(86362001)(2004002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 13OB7jPVLs3fo/cNDjdozTLm3F/FaQKbyC5mccpj1KXIyIX7EPZ9htCs91e9z6VQGF3cXDt2AfeWECLsFoxgeFJqUwMdt5wzZXm9EAVPA7aVC0CO4Xy91VpUT9TbIwfquWu76pZYoc6bzA52icQgp4R5VRlzofJEVKKE9d1xUQVCU56cdhsKULJPZJ3dGWTjn6MFE2Rfn4GuYLdHtR3ZpqcOumKxY2QVuEHl7FoIu8r3HJc+4bPVTVxOcqvW5fE69A6uFqw86Opx/DC+NKLjpu7En97257C5x8baeJZs9I/Pp+IcFGdIeTCFdd5YRSFxZksj8kaEw1zhOhxKhyNLN9CaAQlW/1LwU7bN42Q/qgNLtgjqxKAKyiqXdJfIupFDtlYkUYIuxA/HzY7QJnEl3j/r/G3cx6ss45vi/0+AADmtXJ/T+hrsu4dAkP0QT4u53pOkk7TLT/j1savoNc4rdebQUXVriraSpZZQiCxH0PyXj5lCV2f4o5Kcp+dk4/n8TdMEPveYvF7WH0vZWP3sJJBCiRIdjH7oJIsIrqIGdgZqCVkcnCjjrwjEf0ULfp5t63JWkPWaYCtPDNCNOQK8tqtaE3c4pEnyo7U5o+m8ZOqukVz+93zLMaQkMbJdkG/TN5PMXXqmTz/WHMWxZScaml0XvFe1oa335kGJhw3hknCZ2smiBTaml2eFIFbPd+0fAtPmKva8pVYLZ7jF/PvEPdyiQK1WeMy57ZsG16lOaoYB1kXJ9smn0PY+k1lnHOeX
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE79DE77437CB74E905604AB29DE9D49@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6517
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	de661956-c109-4abc-875c-08d90f9a93e0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x1Z1WCFejBuSCd38+Ow8CjfnYY/HsBVWMXQQLgLo9oPsFPnJhUQcsFkRfBnKseKtEZjf3At6k3M0qMmvvuCzE4buDc/FCqU6Ovuu4F+zEtBhQLou66UJQUDqk0/5b9FPUrZAA/JkuvYrKvZvjWMw76rzKEk9mNQpAYbDoBUiuevW5EsdE5gkMg9oMPJ1e5B6VXcd3pBbv/HVsJXdFM3N+VP5YRXWeQN/g/Ix1CZuC65K2oSGkZrIze8y15MjdI5/0mW9v3KZX75w2WK3bm9shW/Sb30SRItEcNVgcrYADe7tjZTZZDFoOP1NAtBOjMWraafR7FNRPmeeMVzT61Al/9vsYXPkeYiOlPajc3hBfA4GcidLkxmVSS0/e+DZ8Fsrgh+kdMwRbyq04lKDcTL+zItNDOfwd+0KgZIKDJ4+uNt1sag8yu1cXmGW/t9R+S83RjwrtLE0LaWR4zlTZmMQTm+zO3BVypu8rTby08wkDJuiUDEAVI2U+8g1PP6fHuHZK27WLLEXzqRKyazz1jHAwjnSM0DnmY5CMS/cit2uHSYRu6cSvabjjnMtVcT+B7JiDCCmJKBbfPKbkfLuD5B8eRNZQT9T2gF+m+rK+H9hrqtHekR/e6EQ2qlv9xDcK0ZLjtgZGE3TG+S1uzLkqeMDqAmIvKt69QbeRiBkryTgAl8IRAyCMIrpUmu9fwF6fEpu7pLDsSIVg2uaA5HlQX0jc2a56AeMMUdrEhOyz8yU7CDmSwwwwgjyjtIDNxu+Cl+S
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966006)(36840700001)(33656002)(82310400003)(26005)(47076005)(336012)(2906002)(6506007)(6512007)(478600001)(54906003)(2616005)(316002)(36860700001)(6862004)(53546011)(86362001)(36756003)(4326008)(70586007)(83380400001)(6486002)(70206006)(82740400003)(5660300002)(186003)(356005)(81166007)(8676002)(8936002)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:51:40.0355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc48887-a028-46a7-e157-08d90f9a9e14
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2420

SGkgSmFuLA0KDQo+IE9uIDMgTWF5IDIwMjEsIGF0IDM6MzggcG0sIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyOS4wNC4yMDIxIDE2OjQ2LCBSYWh1bCBT
aW5naCB3cm90ZToNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL21zaS1pbnRlcmNlcHQuYw0KPj4gQEAgLTAsMCArMSw1MyBAQA0KPj4gKy8qDQo+PiAr
ICogQ29weXJpZ2h0IChDKSAyMDA4LCAgTmV0cm9ub21lIFN5c3RlbXMsIEluYy4NCj4+ICsgKg0K
Pj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0
ZSBpdCBhbmQvb3IgbW9kaWZ5IGl0DQo+PiArICogdW5kZXIgdGhlIHRlcm1zIGFuZCBjb25kaXRp
b25zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSwNCj4+ICsgKiB2ZXJzaW9uIDIs
IGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLg0KPj4gKyAqDQo+
PiArICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIGl0IHdpbGwgYmUg
dXNlZnVsLCBidXQgV0lUSE9VVA0KPj4gKyAqIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRo
ZSBpbXBsaWVkIHdhcnJhbnR5IG9mIE1FUkNIQU5UQUJJTElUWSBvcg0KPj4gKyAqIEZJVE5FU1Mg
Rk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGlj
ZW5zZSBmb3INCj4+ICsgKiBtb3JlIGRldGFpbHMuDQo+PiArICoNCj4+ICsgKiBZb3Ugc2hvdWxk
IGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBh
bG9uZyB3aXRoDQo+PiArICogdGhpcyBwcm9ncmFtOyBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5n
bnUub3JnL2xpY2Vuc2VzLz4uDQo+PiArICovDQo+PiArDQo+PiArI2luY2x1ZGUgPHhlbi9pbml0
Lmg+DQo+PiArI2luY2x1ZGUgPHhlbi9wY2kuaD4NCj4+ICsjaW5jbHVkZSA8YXNtL21zaS5oPg0K
Pj4gKyNpbmNsdWRlIDxhc20vaHZtL2lvLmg+DQo+PiArDQo+PiAraW50IHBkZXZfbXNpeF9hc3Np
Z24oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiArew0KPj4gKyAg
ICBpbnQgcmM7DQo+PiArDQo+PiArICAgIGlmICggcGRldi0+bXNpeCApDQo+PiArICAgIHsNCj4+
ICsgICAgICAgIHJjID0gcGNpX3Jlc2V0X21zaXhfc3RhdGUocGRldik7DQo+PiArICAgICAgICBp
ZiAoIHJjICkNCj4+ICsgICAgICAgICAgICByZXR1cm4gcmM7DQo+PiArICAgICAgICBtc2l4dGJs
X2luaXQoZCk7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgcmV0dXJuIDA7DQo+PiArfQ0KPj4g
Kw0KPj4gK3ZvaWQgcGRldl9kdW1wX21zaShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+
ICt7DQo+PiArICAgIGNvbnN0IHN0cnVjdCBtc2lfZGVzYyAqbXNpOw0KPj4gKw0KPj4gKyAgICBs
aXN0X2Zvcl9lYWNoX2VudHJ5ICggbXNpLCAmcGRldi0+bXNpX2xpc3QsIGxpc3QgKQ0KPj4gKyAg
ICAgICAgcHJpbnRrKCItIE1TSXMgPCAlZCA+IiwgbXNpLT5pcnEpOw0KPiANCj4gT25seSB0aGUg
JWQgYW5kIGEgYmxhbmsgc2hvdWxkIGJlIHBhcnQgb2YgdGhlIGZvcm1hdCBzdHJpbmcgaW5zaWRl
IHRoZQ0KPiBsb29wIGJvZHk7IHRoZSByZXN0IHdhbnRzIHByaW50aW5nIGV4YWN0bHkgb25jZS4N
Cg0KWWVzIEkgYWdyZWUgSSBtaXNzZWQgdGhpcyBJIHdpbGwgZml4IHRoaXMgaW4gbmV4dCBwYXRj
aC4NCiANCj4gDQo+PiArc3RhdGljIGlubGluZSBzaXplX3Qgdm1zaXhfdGFibGVfc2l6ZShjb25z
dCBzdHJ1Y3QgdnBjaSAqdnBjaSwgdW5zaWduZWQgaW50IG5yKQ0KPj4gK3sNCj4+ICsgICAgcmV0
dXJuDQo+PiArICAgICAgICAobnIgPT0gVlBDSV9NU0lYX1RBQkxFKSA/IHZwY2ktPm1zaXgtPm1h
eF9lbnRyaWVzICogUENJX01TSVhfRU5UUllfU0laRQ0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgOiBST1VORFVQKERJVl9ST1VORF9VUCh2cGNpLT5tc2l4LT5tYXhfZW50cmll
cywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgOCksIDgpOw0KPiANCj4gSSdtIGFmcmFpZCBJIGRvbid0IHZpZXcgdGhpcyBhcyBhbiBh
Y2NlcHRhYmxlIHdheSBvZiB3cmFwcGluZyBsaW5lcy4NCj4gSG93IGFib3V0DQo+IA0KPiAgICBy
ZXR1cm4gKG5yID09IFZQQ0lfTVNJWF9UQUJMRSkNCj4gICAgICAgICAgID8gdnBjaS0+bXNpeC0+
bWF4X2VudHJpZXMgKiBQQ0lfTVNJWF9FTlRSWV9TSVpFDQo+ICAgICAgICAgICA6IFJPVU5EVVAo
RElWX1JPVU5EX1VQKHZwY2ktPm1zaXgtPm1heF9lbnRyaWVzLCA4KSwgOCk7DQoNCk9rLg0KDQo+
IA0KPj4gQEAgLTQyOCw2ICs0NTgsMzEgQEAgaW50IHZwY2lfbWFrZV9tc2l4X2hvbGUoY29uc3Qg
c3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgICAgcmV0dXJuIDA7DQo+PiB9DQo+PiANCj4+ICtp
bnQgdnBjaV9yZW1vdmVfbXNpeF9yZWdpb25zKGNvbnN0IHN0cnVjdCB2cGNpICp2cGNpLCBzdHJ1
Y3QgcmFuZ2VzZXQgKm1lbSkNCj4+ICt7DQo+PiArICAgIGNvbnN0IHN0cnVjdCB2cGNpX21zaXgg
Km1zaXggPSB2cGNpLT5tc2l4Ow0KPj4gKyAgICB1bnNpZ25lZCBpbnQgaTsNCj4+ICsgICAgaW50
IHJjOw0KPj4gKw0KPj4gKyAgICBmb3IgKCBpID0gMDsgbXNpeCAmJiBpIDwgQVJSQVlfU0laRSht
c2l4LT50YWJsZXMpOyBpKysgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICB1bnNpZ25lZCBsb25n
IHN0YXJ0ID0gUEZOX0RPV04odm1zaXhfdGFibGVfYWRkcih2cGNpLCBpKSk7DQo+PiArICAgICAg
ICB1bnNpZ25lZCBsb25nIGVuZCA9IFBGTl9ET1dOKHZtc2l4X3RhYmxlX2FkZHIodnBjaSwgaSkg
Kw0KPj4gKyAgICAgICAgICAgICAgICB2bXNpeF90YWJsZV9zaXplKHZwY2ksIGkpIC0gMSk7DQo+
PiArDQo+PiArICAgICAgICByYyA9IHJhbmdlc2V0X3JlbW92ZV9yYW5nZShtZW0sIHN0YXJ0LCBl
bmQpOw0KPj4gKyAgICAgICAgaWYgKCByYyApDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAg
ICAgcHJpbnRrKFhFTkxPR19HX1dBUk5JTkcNCj4+ICsgICAgICAgICAgICAgICAgICAgICJGYWls
ZWQgdG8gcmVtb3ZlIE1TSVggdGFibGUgWyVseCwgJWx4XTogJWRcbiIsDQo+PiArICAgICAgICAg
ICAgICAgICAgICBzdGFydCwgZW5kLCByYyk7DQo+IA0KPiBJbmRlbnRhdGlvbiBsb29rcyB0byBi
ZSBvZmYgYnkgb25lIHNwYWNlIG9uIHRoZSBsYXN0IHR3byBsaW5lcy4NCg0KT2suDQoNCj4gDQo+
PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbXNpLWludGVyY2VwdC5o
DQo+PiBAQCAtMCwwICsxLDQ5IEBADQo+PiArLyoNCj4+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMDgs
ICBOZXRyb25vbWUgU3lzdGVtcywgSW5jLg0KPj4gKyAqDQo+PiArICogVGhpcyBwcm9ncmFtIGlz
IGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkgaXQN
Cj4+ICsgKiB1bmRlciB0aGUgdGVybXMgYW5kIGNvbmRpdGlvbnMgb2YgdGhlIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlLA0KPj4gKyAqIHZlcnNpb24gMiwgYXMgcHVibGlzaGVkIGJ5IHRoZSBG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uDQo+PiArICoNCj4+ICsgKiBUaGlzIHByb2dyYW0gaXMg
ZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgaXQgd2lsbCBiZSB1c2VmdWwsIGJ1dCBXSVRIT1VUDQo+
PiArICogQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2Yg
TUVSQ0hBTlRBQklMSVRZIG9yDQo+PiArICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBP
U0UuICBTZWUgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvcg0KPj4gKyAqIG1vcmUg
ZGV0YWlscy4NCj4+ICsgKg0KPj4gKyAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkg
b2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFsb25nIHdpdGgNCj4+ICsgKiB0aGlz
IHByb2dyYW07IElmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4NCj4+
ICsgKi8NCj4+ICsNCj4+ICsjaWZuZGVmIF9fWEVOX01TSV9JTlRFUkNFUFRfSF8NCj4+ICsjZGVm
aW5lIF9fWEVOX01TSV9JTlRFUkNFUFRfSF8NCj4+ICsNCj4+ICsjaWZkZWYgQ09ORklHX0hBU19Q
Q0lfTVNJX0lOVEVSQ0VQVA0KPj4gKw0KPj4gKyNpbmNsdWRlIDxhc20vbXNpLmg+DQo+PiArDQo+
PiAraW50IHBkZXZfbXNpeF9hc3NpZ24oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHBjaV9kZXYg
KnBkZXYpOw0KPj4gK3ZvaWQgcGRldl9kdW1wX21zaShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRl
dik7DQo+PiArDQo+PiArI2Vsc2UgLyogIUNPTkZJR19IQVNfUENJX01TSV9JTlRFUkNFUFQgKi8N
Cj4+ICsNCj4+ICtzdGF0aWMgaW5saW5lIGludCBwZGV2X21zaXhfYXNzaWduKHN0cnVjdCBkb21h
aW4gKmQsIHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gK3sNCj4+ICsgICAgcmV0dXJuIDA7DQo+
PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBwZGV2X2R1bXBfbXNpKGNvbnN0IHN0
cnVjdCBwY2lfZGV2ICpwZGV2KSB7fQ0KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBwY2lfY2xlYW51
cF9tc2koc3RydWN0IHBjaV9kZXYgKnBkZXYpIHt9DQo+IA0KPiBJIGRvbid0IHRoaW5rIHRoaXMg
bGFzdCBvbmUgaXMgaW50ZXJjZXB0IHJlbGF0ZWQgKGFuZCBoZW5jZSBkb2Vzbid0IGJlbG9uZw0K
PiBoZXJlKT8NCj4gDQpPayBJIHdpbGwgbW92ZSB0aGlzIHRvIG5leHQgcGF0Y2ggaW4gc2VyaWVz
Lg0KPj4gQEAgLTE0OCw2ICsxNTAsNyBAQCBzdHJ1Y3QgdnBjaV92Y3B1IHsNCj4+IH07DQo+PiAN
Cj4+ICNpZmRlZiBfX1hFTl9fDQo+PiArI2lmZGVmIENPTkZJR19IQVNfUENJX01TSV9JTlRFUkNF
UFQNCj4gDQo+IFNpbmNlIGJvdGggc3RhcnQgYW5kIC4uLg0KPiANCj4+ICtzdGF0aWMgaW5saW5l
IHZvaWQgdnBjaV9tc2lfZnJlZShzdHJ1Y3QgdnBjaSAqdnBjaSkge30NCj4+ICsjZW5kaWYgLyog
Q09ORklHX0hBU19QQ0lfTVNJX0lOVEVSQ0VQVCAqLw0KPj4gI2VuZGlmIC8qIF9fWEVOX18gKi8N
Cj4gDQo+IC4uLiBlbmQgbG9vayB0byBtYXRjaCwgbWF5IEkgc3VnZ2VzdCB0byBzaW1wbHkgcmVw
bGFjZSB0aGUgX19YRU5fXyBvbmVzLA0KPiBhcyB0aGUgdGVzdCBoYXJuZXNzIGlzbid0IHN1cHBv
c2VkIHRvIChyYW5kb21seSkgZGVmaW5lIENPTkZJR18qPyBPcg0KPiBhbHRlcm5hdGl2ZWx5IGF0
IGxlYXN0IGNvbWJpbmUgYm90aCAjaWZkZWYtcz8NCg0KT2sgSSB3aWxsIHJlcGxhY2UgdGhlIGxp
bmUgIiNpZmRlZiBfX1hFTl9fIiAgd2l0aCAgIiAjaWZkZWYgQ09ORklHX0hBU19QQ0lfTVNJX0lO
VEVSQ0VQVOKAnQ0KDQpSZWdhcmRzLA0KUmFodWwNCg0KPiANCj4gSmFuDQo+IA0KDQo=

