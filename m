Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E4840C0FD
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 09:54:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187250.336050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQPkd-0008Sn-3l; Wed, 15 Sep 2021 07:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187250.336050; Wed, 15 Sep 2021 07:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQPkd-0008R0-0H; Wed, 15 Sep 2021 07:54:39 +0000
Received: by outflank-mailman (input) for mailman id 187250;
 Wed, 15 Sep 2021 07:54:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFB7=OF=epam.com=prvs=9892afeb01=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mQPkb-0008Qu-58
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 07:54:37 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32cbf40c-2671-4095-a3fe-58f061578ea2;
 Wed, 15 Sep 2021 07:54:36 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18F7o3Sd005841; 
 Wed, 15 Sep 2021 07:54:33 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b3c8ug3et-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 07:54:33 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3374.eurprd03.prod.outlook.com (2603:10a6:803:18::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Wed, 15 Sep
 2021 07:54:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%3]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 07:54:30 +0000
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
X-Inumbo-ID: 32cbf40c-2671-4095-a3fe-58f061578ea2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzbNATN7UDSdM9fRW5sHGqBg25Isk8q1RQymYyrRc+1rtXmytE4IKklXAwd+sW52sMvrOnPoux4rUOJN9DH6tkIMSd9d1NY8li2QqzS0xnpkuxMGMBDJxg/WL8594Ql3Lczd4v7OuVBz7berQ/1ZjiBTLBDlfoLyiYyYtQjAoNIIwFu/Zy5ZpE89DkmthrjWxnlhcBLoNrcet5G+w0qJFP0ZAnFtr27olEDMoey3jQ3CWDItl8N86Ru8VYKHVBth/bJwyOQJSb4FNYPdS5F8XhFCS+8KUTgyc+B0xvc7SBiQkxJs7rcaP6ffbypT3IsufnHU73lVlC1T/jeNJWvijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ZCa6er99XD9a2CQzg8T0mQjKx6vdmU9JwbkP0jMKadQ=;
 b=mOKM+rcnRsMlXO8v44yJHo5WXzVxpO6dbzfwteNo9/ynD0QXHKGHzskxlr+1ceYfGjZgdRf6ucdph+79eiD67IwTGyPWj/Bkzh6N+7JyF0O6gLHmvjDAP1licUBcHKuMFLne+Q8T/GvpfnDbw+AjEWAMI6jMddGpbiGbkvEQBGosguvvI/No0uw4hU15fUVohuFi4U+K2BeTWtbzqSAWdVwOgeaGIDTjOkfZQaqpvj+uzHQLb8dkF49TYWrD9/N3MidOW4V/mUPnHKkExnHCMh5C3w0m2puLdwD++6u/ojeWmkdJkEwIKiftuaNBZ9zhumIT8iFuy9DtjGlOBGTOZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCa6er99XD9a2CQzg8T0mQjKx6vdmU9JwbkP0jMKadQ=;
 b=qnRA7Ypv0I2/21XF+rZpRHUmIVlmbLnX1/+vc9RcWr6c6eSjfq2y4oO6Yx5NH5EmaXl9HCOB7SLrkQxr0fRZaN5DhtaEyUZ/kfT9sGn+6qEsxIw1CF6sXob/9U0EndBd/5+DkFbC/iIwxVoj8BBo235d5sfl7Y29/PbyvyRARmd1vttcCmc5TXBStc7qtPouPrZI4z9LzLmtQg9qbdV0qkBm7jCHvj8xLsBGIxRqAqwMf3DDfKqHOmgEdqAzBVEnwpAzMNqztrOfKc9gF/1wJOjbrW/B2nI9ACGSEZynS7uW/0boNriU1MqVwQwfZDLiOHZmAjOzuO6ZZUuMeHbpHA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Rahul Singh <rahul.singh@arm.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 08/14] xen:arm: Implement pci access functions
Thread-Topic: [PATCH v1 08/14] xen:arm: Implement pci access functions
Thread-Index: AQHXqgbplAv3ejwcPEaBVpikglszUA==
Date: Wed, 15 Sep 2021 07:54:30 +0000
Message-ID: <6841a3c5-2565-9fee-8776-19d5c4a68fea@epam.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <c90c3088a592b41c477a0026446294a3b9422f76.1629366665.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109091639360.10523@sstabellini-ThinkPad-T480s>
 <E37D41BC-1ACB-4779-9A8F-379F0E7BCB1A@arm.com>
In-Reply-To: <E37D41BC-1ACB-4779-9A8F-379F0E7BCB1A@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f876b05f-41a4-40f9-35b5-08d9781e0c60
x-ms-traffictypediagnostic: VI1PR0302MB3374:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB33748616B877C03512A223C3E7DB9@VI1PR0302MB3374.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bxqWkarGUDFYBgNEUj/0zL4+K2nrFQhGBFiQtdHTe4GpFg1Qhp0JWPtgeQjyEABbPIsLspMQAeJqv8s6jtVDCSaVnz8C50fQRoyvf8hqRZaeVc9EovdFw34c+hE0C0lGwIrt4IwND8x16mtsCpUssHPTgXTmHNjO+YOknd1MUlP+fxnICncErqizrbmV1ccTK/c975ruPQlT8UbPjYs8Jwg6ld2F32bz9GtyZZMnoLWg4Uo2pbgFTCAyDj76oo8BLaUOYWzhDWstdvUw+r4X0bJNpH1I0ret7DAucZWGziO28zMVkrpy8vTqbRKGZnpydnbIRG1vRaBWL8Y7QXlVwkgQaUp7Y2ntJ17XgwxXLRyIKAACd71ZJG2VMqMGd/7ynk/EFZryYemugFMNFnQT8vCsvAnvNgudI5RbbME9fP7QvJqMZvfoY78d3wZdaCXGN4pWPsSERQcxV88gUByqKA7j9YwAa5NEyyMTXyzwwXBvO6AGbJTExFH+Lc3QbyqWN1AAcxh2Ww9JjfrBjaZdWcRce9m9TOO+wVuahMS16QqI8O6dJTcg5jRWF7n4GyPiaj5nzFELPF4mLLbyk8sIjBpRyrOueW/tAUVluV/n4rGEpvMymYlYc1HkJEMH4of4iTrm1GCdrhh7nqQGPZTFX8S2sM+vLZRniLheooEQlxhM7CQVFTeM5cGX8aRczNOzybmPVW3UYOOCLzNAce4QZ5h04f5eTJY6pZO5cK/hPb1HU9+bjvirWSLvpIazfUjE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(8936002)(31686004)(2616005)(2906002)(66556008)(5660300002)(55236004)(66446008)(186003)(38070700005)(6486002)(4744005)(36756003)(66476007)(6512007)(122000001)(64756008)(66946007)(71200400001)(86362001)(8676002)(54906003)(38100700002)(316002)(6506007)(110136005)(508600001)(107886003)(76116006)(4326008)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SGdzc0hObFhKeGwyV2ZFSzByb3JQY0lwN3JHbFdTeGZFc0ErNThQbFgveC9r?=
 =?utf-8?B?QXd0Q0U4ZDlQbDEzcERXYnU4L1RXd25YQXc5eWQxWm12enlPSTZTb2VrZURQ?=
 =?utf-8?B?ZnlUQ3VxbFRJTDVWNDczTXRGYTY0ZW1wUkUrWFQ3dW12SXFUOTNFdFJJUkxi?=
 =?utf-8?B?SzFaZlVCVitmSmJiK0VnakVqUmV3aUVGbldZNEFkeSt5L2JNK041WmFKb2dr?=
 =?utf-8?B?M0FtU0laSUY2NTA4TmMzd0p6VU9MNlIzVDNZTTYzT09sbUZKQmpLNTF5MmFk?=
 =?utf-8?B?T2tWVG10alhJUXZHakxIYXBpUkdNTnRoOEtmazJmTk5lV0UzOGpQaEpIcHFM?=
 =?utf-8?B?T2cyUVc5YVlGZGtBU0FqTDVlUUtVSGQ5NFArejZ1Z0xNTjQrRU5PUUYxdUdW?=
 =?utf-8?B?eWRrb2lWeXRUcFZrQnAweHdwcDM4MEpIdmI5QXVLdlBnVEJyd0JLTXFTNVRi?=
 =?utf-8?B?dVhYY2VFS2txdEJ1UHRIVWdWZXgwWGRLdmpBN3RLaytYcllzZGlCVzNFRzd2?=
 =?utf-8?B?aFk4YXVoSnpmRTBMdEcyMW9nejR4cVVLcndueWw1QVNxcFVkTHRSeCs0ZzRN?=
 =?utf-8?B?VHMyRlJNb1VhOFFGekpmV0Jhc0kvcFF1akF0aXJRbXFVVTNqSEtjeHhjV3RH?=
 =?utf-8?B?TW9BN3hweUJNWHY0cUpUekMxanRTQ3ZQSTFPNVRYZU1aamJ4ZXFnaDI3amZn?=
 =?utf-8?B?VkJPU2p1bzVoMy9oaXU2aTlrcDlDb2Z2OWN4UTY5azltR1FkaWE3RmhYZ0Z3?=
 =?utf-8?B?ZUxIejErTFZrSE1DWTVqWi9FZUs3UlVJLzFaY1UwOGtKMHYwMlNyNmtSa1ZL?=
 =?utf-8?B?TFlBeG8vQ0Q2VUJWcmQ3Z1pIWEtiZE1CMFFiNlFuR3lBOGgvTE04eG5oMDh3?=
 =?utf-8?B?cVZBaVIzTnQ5M2piWVRQYm5VOG5ZVXVFUitNa1RibFNYK3Y1Ry80a0l0MVQw?=
 =?utf-8?B?VEhXN0IrT3RiWmI3cXQ0eEpOcnlwZC9UNHVxRmpuREZ3RkpsTnMzcHZKMzZH?=
 =?utf-8?B?Y2ZOZ25HSFBGajAvT1doRm43bGFHbEw2YldwdStWOFRKd0xGMzFSV3BKMHM2?=
 =?utf-8?B?Y0lNUTdjaSt2ZjQvWGZPcXZyR1E5b2NJa3RjTEJ4RkI2eHEyaGZmRmhxakNZ?=
 =?utf-8?B?K25IM25WcWhPRDFOdmsyZ3U1TVE4YWkwSTl5cHJ4SHM1REtxZFp1NkNMZTRY?=
 =?utf-8?B?Z1N6Wi8vUHVNbmEralN0OTlYNUdldUM5b2cwUjRteW9aM21UUHROWm82ZUgy?=
 =?utf-8?B?OXVEMDBNc2F0TksrTDZVcXBjUlVnV3BXZTBsd0syd211R2JZeVJrdmU1U2FY?=
 =?utf-8?B?elNHUUswSzQwamxEa2t0ZXloRUlpL0RTWXRDemtWWkZNeG5rNVJEQlppQytk?=
 =?utf-8?B?MHdLRUw2MjRyNlAzZ3l0Nk9JS3hiMWt2Qk1ZQmxqUEdJY0swUW9IdTdxS0ox?=
 =?utf-8?B?d3BCelF4b3BSb3RjazZac1hqU3hEN29mc0dFazN5MHRkZVV4T29KTUFQc0J1?=
 =?utf-8?B?b1RudVJhbE9RaEFta04zMGhNMjloNnV0Z1M2MFVlaTlpMHhoRUVaQURxZVVN?=
 =?utf-8?B?U3dJVmlNeDVKYmtuamFOaGk2V2lFTjNvRCtkcCsvU1JXaHlrREJ0cEJUcG01?=
 =?utf-8?B?YWdOSFJkY1UzWVgyblVkeE12L0E5UW5UVytTeitTejJRSmFTMFRpeTltRVFw?=
 =?utf-8?B?REZJUFdDVmVUckc3MUt4bDVhT3AvM1BVTXV2UXRrTUZzbHVuam1DMzkxQllk?=
 =?utf-8?B?UE5lRXE2VFZBU1ZVOFpWRXJKSmNRekFXS1A3aHJJZ2RVVjFVTllGSEt0STdW?=
 =?utf-8?B?MTNraitveHJrczJmTFFoQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA1AEDEEAE0CD246B446D1066061BA2D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f876b05f-41a4-40f9-35b5-08d9781e0c60
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 07:54:30.0803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sWf4f0mS0lNPkLFiA0VexDbIYzkIX+II7a/gH3J7b9kAy164ZwgGrQNRy880mW5xVX/Dg1eli08j+4noXZ+Vst2N9K8L6U2wqcUCccZl79khHsSYLFSzggHH4xvOl6gs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3374
X-Proofpoint-ORIG-GUID: -n0GZ274pfsABakNjRUNRlrhxkxBZzM5
X-Proofpoint-GUID: -n0GZ274pfsABakNjRUNRlrhxkxBZzM5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-15_01,2021-09-14_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 mlxlogscore=851
 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109030001 definitions=main-2109150050

SGksIFJhaHVsIQ0KPj4+IHN0YXRpYyB2b2lkIHBjaV9jb25maWdfd3JpdGUocGNpX3NiZGZfdCBz
YmRmLCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGludCBsZW4sIHVpbnQzMl90IHZhbCkNCj4+PiB7DQo+Pj4gKyAgICBzdHJ1Y3Qg
cGNpX2hvc3RfYnJpZGdlICpicmlkZ2UgPSBwY2lfZmluZF9ob3N0X2JyaWRnZShzYmRmLnNlZywg
c2JkZi5idXMpOw0KPj4+ICsNCj4+PiArICAgIGlmICggdW5saWtlbHkoIWJyaWRnZSkgKQ0KPj4+
ICsgICAgew0KPj4+ICsgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJVbmFibGUgdG8gZmluZCBi
cmlkZ2UgZm9yICJQUklfcGNpIlxuIiwNCj4+PiArICAgICAgICAgICAgICAgIHNiZGYuc2VnLCBz
YmRmLmJ1cywgc2JkZi5kZXYsIHNiZGYuZm4pOw0KPj4gc2FtZSBoZXJlDQo+IFllcyBJIGFtIHBy
aW50aW5nIHdpdGgg4oCcUFJJX3BjaSIuDQoNCnZQQ0kgYW5kIHRoZSByZXN0IGFyZSB3aWRlbHkg
dXNpbmcNCg0KIMKgwqDCoMKgwqDCoMKgIHByaW50aygiJXBwXG4iLMKgICZzYmRmKTsNClNvLCBJ
IHRoaW5rIGlmIHdlIGhhdmUgU0JERiB0aGVuIGl0IGlzIGJldHRlciB0byB1c2UgJXBwIGluc3Rl
YWQgb2YgdHJ5aW5nIHRvIHVuZm9sZCBpdCBtYW51YWxseS4NCg==

