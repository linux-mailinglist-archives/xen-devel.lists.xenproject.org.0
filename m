Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767F2455FD0
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 16:47:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227494.393464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnjca-00069k-NA; Thu, 18 Nov 2021 15:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227494.393464; Thu, 18 Nov 2021 15:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnjca-000674-Jl; Thu, 18 Nov 2021 15:46:44 +0000
Received: by outflank-mailman (input) for mailman id 227494;
 Thu, 18 Nov 2021 15:46:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVvB=QF=epam.com=prvs=1956dce401=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mnjcY-00066y-PU
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 15:46:42 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b899ec06-4886-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 16:46:41 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AIEwYQe027008;
 Thu, 18 Nov 2021 15:46:35 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cds2m86rw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 15:46:35 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5700.eurprd03.prod.outlook.com (2603:10a6:208:16f::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 15:46:28 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 15:46:28 +0000
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
X-Inumbo-ID: b899ec06-4886-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2uKKcdcnfsqpz/bm6qbmLvmk1lh6/JxJDVmeE8DE7+FGPHlerxiK9PVSFLFzvBZkqDYc7DI9PSbXLwsQy/rCg/SWC32Yn8VeyH4TRIaz58znTxNlbtDRMuVOa7D/5U8wWOwy0lPi7ey54+RpJqKkxnsuwvwVZO4wmaVxfk21BE2Jd/HMlpg+OJ8d1EjZWvzuv2vM0jlWtLDNpxNo5g+JlXgv4Reco7NgtTP8EDQl3gMX4TOVi4W37A9p5FOJTG4D84iMOWVrpQ3A9FTUrZTmSSQQr84xSmcAL4BKZjUeo/cY01kGEODwwOzCCVNqImCgJI6m5DjUq+r7OfHTwitvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSyhJBEbCV8iyrnV17bf/LoDjHQIFOEnKl3ul0JENYQ=;
 b=S2qHi8EUDlXGZf1OmzeuoN9bxsydN2jxJIajDAxi4lH2AL0RUO+cmlFeR9LtPfnZbd8R5OxYtCephwt6asdiAdQVLfzFPPj3pdHGQTJZe+KoAb+Z1N70th4t9RajjGGbBFYDUZ1y5ACd6VkUhIaFO80ii6xdCNgiF3vrnT5pheddNc3s62EnmFOnlDWsQbofTt3I/rC2aAokw1cdWQNWRyLexg8T/JG0ThiBr38Hz1HEQLLyQGmcxAhBc2n/XNUU/PRo7IhkjDUR1ezihR6wxWfKhMBPqkMLYCPKQtAq7b8enw+U7qYOzrzpuM1yL5IiOMoG2YI4VDBCyqP9UT5sAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSyhJBEbCV8iyrnV17bf/LoDjHQIFOEnKl3ul0JENYQ=;
 b=IXhajDrWUygsqzNBJoUHD50nqMp3wn3fKXvkKB9Tb3uJArebyg2wrlpqeLJ8W3v12tcWHymb2758aZHcoYI+hScfYPJmdK7x4lIQ53c+/BrGV7hUJpx1BP7bR4R/Tfsnew59pH6Os6UZF+S6/Pu3YVLxeOqlDgoPm/Sv3BREUu10esGa9Xn2GQaoU8yHx/WqqHMJCtn8g5f3XOWhzK4wScYZb6kU9rVRkSMQoeOyqExEi6MrbaSXlIJk6JUpfpq96TZeVDQexaQkmAhfLRSS2cJkgwDJOL6SM0/EW4iJgGbpVgi+Fg0l0oQ0XrhBMuuIC4kCBLQWfeSq4UUlMw3ifQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Index: 
 AQHX0hJIYALl/D9fL0OD6N0XGDJh2awHdhMAgAGHTYCAAA1EAIAABOkAgAAF6YCAAATnAIAAQRQAgAAGPgCAAAR1gIAAAvIAgAAFxACAAAoGAIAAAXMAgAABgYCAAAVtAIAAAX+A
Date: Thu, 18 Nov 2021 15:46:28 +0000
Message-ID: <00e78d11-8e7b-84d2-5aa0-0a7f82f13af6@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <cf0d5566-5629-76f2-ec8d-a05e6ecb4248@suse.com>
 <e2e83bee-5191-761d-f38b-55605de51002@epam.com>
 <d9620e9c-ef21-ea7b-0b25-16770fa47073@suse.com>
 <e77ebf8d-0be2-7b4c-4169-db239bfa8e80@epam.com>
 <e17ee963-d498-00ef-a5c5-1fea73ed4898@suse.com>
 <d9692f93-a58d-1513-1f22-7d0cbc7b3b6e@epam.com>
 <b45c172d-ab51-a02a-8e29-3b31b6319f4d@suse.com>
 <17c7485a-2c44-63ec-553c-5caa9b8eb70c@epam.com>
 <YZZdU1oCaMt1HxTj@Air-de-Roger>
 <b7cb9ce7-fee9-f16d-572c-c39b3ff75d62@epam.com>
 <bf8f1c03-d872-094b-4a3c-3b15706babdf@suse.com>
 <816d3519-f007-80e2-e07f-ff285640926b@epam.com>
 <ecd83d8f-f290-295c-e073-583aa70a8c1e@suse.com>
 <2db325e9-0349-1cc3-1c4a-fefa048f181b@epam.com>
 <ac0cc710-05b9-bdae-c31c-d159b4de0105@suse.com>
In-Reply-To: <ac0cc710-05b9-bdae-c31c-d159b4de0105@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2821c7dc-4017-4336-879d-08d9aaaa95bb
x-ms-traffictypediagnostic: AM0PR03MB5700:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5700BAD41863039E1A04B591E79B9@AM0PR03MB5700.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Nc4INfvte20D6Hpp3Bt7UBEfqk9c0/mynKQibHmQ+HgyZAji/Dz59SAg3Z+QxtiQCK8PbySyjfNTvA+rCFioBuXKtRzlyhjWmaOq7UUYO86DeORHft6MxymNrtW7h472VJhL7HwmYeKl5lwfdHfi49miz8SexTg+M7rfNZUB37c4JqBdhJc95m3wkKX6cFUi3wTmQXH82IZF35sMjXXQghcfYcvAj5Xk/tTjxdRL7t2gSCv3WzIePK4G/vte0Y4j7f+/CDUsPesx2gdJXmb7TW5mIvXGItwgD230jb+IcJNaMl6MiswV6xAD2MmDRCECiubJuO8fJ1wxYA07VbHJrDA8SOBe5fv95ZaaPOwwOVCH+QZcqS+d/ogahyBubb2vCef1eWUo/TNZxpSxzlG2yXoTNgsXXJhkSMmbbG7fYhx3xeoEU2p0+uPxIh3GH/HPCIBj/eeTCXedoxOWy9lgSJ5w5b6zkXT3Pki60eTbmaLQPem3vC5Amy8g1pYVVxkz43e8fj7ZEJWo3soggGpCDaEzoWWaZ0vhKwPZRg+BGAU/jnwgfwEgpwUIleDGQue+oGCUsIpOtuKNgkfX2BPx4g5Xkgvl7GMMgLesSd1Zg07RU7GfZzHPBkb0Fl0ox2U11UhBhswqWKzA5D8qoBZ7Kf5sQdaN0HksyEqB1dyJBEa1r1O/udtZj3s3fc5hXSk0sfI5i4ildRXOxhBluiLwe/Ot6z08WUpJhbbLAO4ARw0hHJDOcMkwW888eg7fBWVL
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(66476007)(6506007)(53546011)(66946007)(66556008)(6916009)(2616005)(8936002)(122000001)(91956017)(6486002)(5660300002)(7416002)(76116006)(66446008)(64756008)(186003)(31696002)(86362001)(107886003)(38100700002)(31686004)(83380400001)(6512007)(2906002)(54906003)(36756003)(4326008)(26005)(71200400001)(38070700005)(316002)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YWwvU09xMU5XMWxoNEtZcHFBU0ZiTmN0RXNLQmdrZ2NoUjJ5azljMWVyVENF?=
 =?utf-8?B?cm9pcVNPMTgwWU5NWEY0cjZqamJJdUpGRDdJeHVyN1MyYlRXdlJxTWgyTWtG?=
 =?utf-8?B?V3FPSlZTVWVlRlJ4S1NRbVBDRE1QUjZXWmtCamJ3U0JSUHNGU29NeUZabkZ4?=
 =?utf-8?B?dVgycVA5R0dPMzFCZWV5UWw1azlaNjVGNzk3c01IdmtsMk1VL3NOYkQ1K1l4?=
 =?utf-8?B?OFBvWHhnOHQrMFpTUzBHaUpJbU9LdWdMNWhHbkZLUUd4YXZ1OWhtNUJqRll3?=
 =?utf-8?B?Vm5TUldHTmNSMm5ZYXZvQkNqUExtb0ROVWkxT2hOUmxEK21XN3RKMFFMR3Z2?=
 =?utf-8?B?SU9wOGx1TERqUWxVcVRXeWJ1bmZRVDVMMUVoeS8wV3B3amo2UmpPZkhHR1Uz?=
 =?utf-8?B?a3V3YmdBUXl2a0QyeG5hVXNzemVubVBOaFpzM2N0cHBaYXM0RWZwcmtsdW9n?=
 =?utf-8?B?cjB6dENwRjdneGcwRW5BQXRJaFlXTzc1TjQyMXhKKy9VL05VcWMwUEVyRGdh?=
 =?utf-8?B?M3V4a3lOOTBxUG5hMmk1bGVvOXZMcXVFMmZoVGJsM2podzRPR0N5Ny9OWjd0?=
 =?utf-8?B?bGJSRTJQM0lZMk9RQ2dLZkZPMVlvTk4xY0dsYjhaUEh2UU01aUUxUi9qenc2?=
 =?utf-8?B?UnJGZWxBdXloSG9VdGcvZmllUHVoclZNUHJodHdvTUYxeW9OeHViYjY3MWNY?=
 =?utf-8?B?UFJIQ1FSSUQ3THh5cHM0Q2VVcm5GZlpDbVEwVDYwelVtNnF4RklhZk1GZ3M2?=
 =?utf-8?B?cXNCZWU3czdDSFMrbWt1YVJsNlFPSGFpd2dMbzU5UXYvSE00eWlMUmRWeDN3?=
 =?utf-8?B?a3ErTnNFdXoyWEJaN1QrbElPbGdvSjF0cnhieU9CbGVBdnJ6REViU3FhdWJo?=
 =?utf-8?B?Y01Wd0QzZFVaWkM3elpmODBUZXIyd3JUbEFmdU5TR1cvcXpoQnBHeWc3SW1x?=
 =?utf-8?B?a1M0RFFXVmZtT1V1Z1prcnhYYUpWRFBYa3JHa29RVkdHRGtONDg2bDFRaUYz?=
 =?utf-8?B?OHFlV21EemFWcDhQdmx1L3lQTEQ4ZjYvK0xxdjdGWlM3SUh0NUtXYkVqbDRj?=
 =?utf-8?B?VDIvNS80Z0t5R2lVSG1oTFpnSTUvNUxuZnd4ZTF5RE4zcnFZeVpoRGpGQUd5?=
 =?utf-8?B?MGpKYmFqQWhJWVBwZ090Wnd4ejA0YmhXc0djZVZlN2ZON3QwS2JTMUJDWkR6?=
 =?utf-8?B?RnFEamtBMTNORmxpYzJLajV0azAwcTRlQXZsWUtEZG1yZktGT015ZERxUlBh?=
 =?utf-8?B?c2c5N2JpVXRNYi8zcEtuSEV0VTFBQkhZZEdqUkVvN1dGdzJFaDc3UmU5cEpE?=
 =?utf-8?B?QlFTWlBoakNrcEVOOWVOa2E1RHBsWU9OTUt4YWJTTVZJVVNsVDVxc2xaekEy?=
 =?utf-8?B?Z3F6NDhQcFVBa3dIRGNRRnQ2SEtra3V4cmtWcVVkN2V1bWdqa1k1aGxkc21a?=
 =?utf-8?B?Ly92NjB6QlI2Z09pK1dyaFFpZmcyMU9NMFhESWhQUlF3NUJuU0VIM0U0ellW?=
 =?utf-8?B?UHF3ay80Z1JzZW1QR25YNkNlRFhybnFGaE80U00rRHFuVzJyZjB2TjluNnlB?=
 =?utf-8?B?QThadXNmYkk1STMvcTBHQ0tLY2RuZ1NXL3JtV2t3VHJURkZDQi9FdllxUkVu?=
 =?utf-8?B?cTkwT2VkZ0c0T3hBTWdiUkoyVHpqNFdadHF5MVRxd2pLZG9FK1Q4NXhnVVpY?=
 =?utf-8?B?TnVSdG1SbzVyYkg0UkRNemVtZk53QXBMMEVXWVlUVTZBeFVyaVIrUnQvNUl1?=
 =?utf-8?B?ZGFOZStZMU5CM05kU3V6NmFqVnpIdW15b1BTMml1YUFEbXlCTlRPRGVxUUw1?=
 =?utf-8?B?RDYyWk82Nm5KWnNmSVY4VmtiT3Y0ODZCaFc5aEIyM3dQbWpoaXNTQnRETVdy?=
 =?utf-8?B?bHBmZnJKVVY3OGhhNURUUENlbzlIVUFrcWJhNDZaTDJmK1VkVXpVbThWZFd1?=
 =?utf-8?B?dWxwM3M0R3VFcE5lYkRCN0k0SlVnYzRnRkVXRmp3S1RrY1YrQjh1aG1mcmhx?=
 =?utf-8?B?bE1nRkV3WnNqdEU3eEN2Y1kxcWpyMG5rV1BBVTVvL2lxbmVNNFNjZHc1QnEr?=
 =?utf-8?B?anQraGFmd2FKZy9tUkJZN0lLbzRHekJyT0ZjS0s5NndGaEc0NFZzNG93MkYw?=
 =?utf-8?B?ZytBNEMwQ3ZvdGtjdVR5aG5YaUJXWEh2dHpIZklsWDhNZEdBMzA5c0FFZFBP?=
 =?utf-8?B?OHh1dW1RNHljUEhCRjgrcEZRSU9nOXlGS1Y4L1ZremN4ZC9QTXN3TDdYWFc0?=
 =?utf-8?B?V2R1QklpVVFDQ0VvOHVibWcrMGtCd1ZiZFNGVzZhc1diNVMzcGQwS3ZyQko4?=
 =?utf-8?B?ZGFSeUZDNUhpallZYkZ5d1VsZnBSQU1iVTg2alBqczlZdzlsWXptdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3BDE2839254634B840B8208109E34A1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2821c7dc-4017-4336-879d-08d9aaaa95bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 15:46:28.1091
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oq6stkXWS1NFmUYglJGWlVzzPtQqVYaxTN9Oo1qnBLH5LwXw/INxBLuxjFaIFGxJgYMS1L6jn8cB5N0e01ssGSdHA9+0Q52RUejvgdVZkfb1RBJFOIbAcjLNDCljB1kL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5700
X-Proofpoint-GUID: 4SBDhJJNp8Ae2swC1PrOIfFBBBjSXmYG
X-Proofpoint-ORIG-GUID: 4SBDhJJNp8Ae2swC1PrOIfFBBBjSXmYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_12,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111180087

DQoNCk9uIDE4LjExLjIxIDE3OjQxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTguMTEuMjAy
MSAxNjoyMSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxOC4xMS4yMSAx
NzoxNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTguMTEuMjAyMSAxNjoxMSwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IE9uIDE4LjExLjIxIDE2OjM1LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4+IE9uIDE4LjExLjIwMjEgMTU6MTQsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOg0KPj4+Pj4+IE9uIDE4LjExLjIxIDE2OjA0LCBSb2dlciBQYXUgTW9ubsOp
IHdyb3RlOg0KPj4+Pj4+PiBJbmRlZWQuIEluIHRoZSBwaHlzZGV2b3AgZmFpbHVyZSBjYXNlIHRo
aXMgY29tZXMgZnJvbSBhbiBoeXBlcmNhbGwNCj4+Pj4+Pj4gY29udGV4dCwgc28gbWF5YmUgeW91
IGNvdWxkIGRvIHRoZSBtYXBwaW5nIGluIHBsYWNlIHVzaW5nIGh5cGVyY2FsbA0KPj4+Pj4+PiBj
b250aW51YXRpb25zIGlmIHJlcXVpcmVkLiBOb3Qgc3VyZSBob3cgY29tcGxleCB0aGF0IHdvdWxk
IGJlLA0KPj4+Pj4+PiBjb21wYXJlZCB0byBqdXN0IGRlZmVycmluZyB0byBndWVzdCBlbnRyeSBw
b2ludCBhbmQgdGhlbiBkZWFsaW5nIHdpdGgNCj4+Pj4+Pj4gdGhlIHBvc3NpYmxlIGNsZWFudXAg
b24gZmFpbHVyZS4NCj4+Pj4+PiBUaGlzIHdpbGwgc29sdmUgb25lIHBhcnQgb2YgdGhlIGVxdWF0
aW9uOg0KPj4+Pj4+DQo+Pj4+Pj4gcGNpX3BoeXNkZXZfb3ANCj4+Pj4+PiAgICAgICAgICAgIHBj
aV9hZGRfZGV2aWNlDQo+Pj4+Pj4gICAgICAgICAgICAgICAgaW5pdF9iYXJzIC0+IG1vZGlmeV9i
YXJzIC0+IGRlZmVyX21hcCAtPiByYWlzZV9zb2Z0aXJxKFNDSEVEVUxFX1NPRlRJUlEpDQo+Pj4+
Pj4gICAgICAgICAgICBpb21tdV9hZGRfZGV2aWNlIDwtIEZBSUxTDQo+Pj4+Pj4gICAgICAgICAg
ICB2cGNpX3JlbW92ZV9kZXZpY2UgLT4geGZyZWUocGRldi0+dnBjaSkNCj4+Pj4+Pg0KPj4+Pj4+
IEJ1dCB3aGF0IGFib3V0IHRoZSBvdGhlciBvbmUsIGUuZy4gdnBjaV9wcm9jZXNzX3BlbmRpbmcg
aXMgdHJpZ2dlcmVkIGluDQo+Pj4+Pj4gcGFyYWxsZWwgd2l0aCBQQ0kgZGV2aWNlIGRlLWFzc2ln
biBmb3IgZXhhbXBsZT8NCj4+Pj4+IFdlbGwsIHRoYXQncyBhZ2FpbiBpbiBoeXBlcmNhbGwgY29u
dGV4dCwgc28gdXNpbmcgaHlwZXJjYWxsIGNvbnRpbnVhdGlvbnMNCj4+Pj4+IG1heSBhZ2FpbiBi
ZSBhbiBvcHRpb24uIE9mIGNvdXJzZSBhdCB0aGUgcG9pbnQgYSBkZS1hc3NpZ24gaXMgaW5pdGlh
dGVkLA0KPj4+Pj4geW91ICJvbmx5IiBuZWVkIHRvIGRyYWluIHJlcXVlc3RzIChmb3IgdGhhdCBk
ZXZpY2UsIGJ1dCB0aGF0J3MgdW5saWtlbHkNCj4+Pj4+IHRvIGJlIHdvcnRod2hpbGUgb3B0aW1p
emluZyBmb3IpLCB3aGlsZSBlbnN1cmluZyBubyBuZXcgcmVxdWVzdHMgY2FuIGJlDQo+Pj4+PiBp
c3N1ZWQuIEFnYWluLCBmb3IgdGhlIGRldmljZSBpbiBxdWVzdGlvbiwgYnV0IGhlcmUgdGhpcyBp
cyByZWxldmFudCAtDQo+Pj4+PiBhIGZsYWcgbWF5IHdhbnQgc2V0dGluZyB0byByZWZ1c2UgYWxs
IGZ1cnRoZXIgcmVxdWVzdHMuIE9yIG1heWJlIHRoZQ0KPj4+Pj4gcmVnaXN0ZXIgaGFuZGxpbmcg
aG9va3MgbWF5IHdhbnQgdGVhcmluZyBkb3duIGJlZm9yZSBkcmFpbmluZyBwZW5kaW5nDQo+Pj4+
PiBCQVIgbWFwcGluZyByZXF1ZXN0czsgd2l0aG91dCB0aGUgaG9va3MgaW4gcGxhY2Ugbm8gbmV3
IHN1Y2ggcmVxdWVzdHMNCj4+Pj4+IGNhbiBwb3NzaWJseSBhcHBlYXIuDQo+Pj4+IFRoaXMgY2Fu
IGJlIHByb2JhYmx5IGV2ZW4gZWFzaWVyIHRvIHNvbHZlIGFzIHdlIHdlcmUgdGFsa2luZyBhYm91
dA0KPj4+PiBwYXVzaW5nIGFsbCB2Q1BVczoNCj4+PiBJIGhhdmUgdG8gYWRtaXQgSSdtIG5vdCBz
dXJlLiBJdCBtaWdodCBiZSBlYXNpZXIsIGJ1dCBpdCBtYXkgYWxzbyBiZQ0KPj4+IGxlc3MgZGVz
aXJhYmxlLg0KPj4+DQo+Pj4+IHZvaWQgdnBjaV9jYW5jZWxfcGVuZGluZyhjb25zdCBzdHJ1Y3Qg
cGNpX2RldiAqcGRldikNCj4+Pj4gew0KPj4+PiAgICDCoMKgwqAgc3RydWN0IGRvbWFpbiAqZCA9
IHBkZXYtPmRvbWFpbjsNCj4+Pj4gICAgwqDCoMKgIHN0cnVjdCB2Y3B1ICp2Ow0KPj4+PiAgICDC
oMKgwqAgaW50IHJjOw0KPj4+Pg0KPj4+PiAgICDCoMKgwqAgd2hpbGUgKCAocmMgPSBkb21haW5f
cGF1c2VfZXhjZXB0X3NlbGYoZCkpID09IC1FUkVTVEFSVCApDQo+Pj4+ICAgIMKgwqDCoMKgwqDC
oMKgIGNwdV9yZWxheCgpOw0KPj4+Pg0KPj4+PiAgICDCoMKgwqAgaWYgKCByYyApDQo+Pj4+ICAg
IMKgwqDCoMKgwqDCoMKgIHByaW50ayhYRU5MT0dfR19FUlINCj4+Pj4gICAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAiRmFpbGVkIHRvIHBhdXNlIHZDUFVzIHdoaWxlIGNhbmNlbGluZyB2
UENJIG1hcC91bm1hcCBmb3IgJXBwICVwZDogJWRcbiIsDQo+Pj4+ICAgIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgJnBkZXYtPnNiZGYsIHBkZXYtPmRvbWFpbiwgcmMpOw0KPj4+Pg0KPj4+
PiAgICDCoMKgwqAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQ0KPj4+PiAgICDCoMKgwqAgew0KPj4+
PiAgICDCoMKgwqDCoMKgwqDCoCBpZiAoIHYtPnZwY2kubWFwX3BlbmRpbmcgJiYgKHYtPnZwY2ku
cGRldiA9PSBwZGV2KSApDQo+Pj4+DQo+Pj4+IFRoaXMgd2lsbCBwcmV2ZW50IGFsbCB2Q1BVcyB0
byBydW4sIGJ1dCBjdXJyZW50LCB0aHVzIG1ha2luZyBpdCBpbXBvc3NpYmxlDQo+Pj4+IHRvIHJ1
biB2cGNpX3Byb2Nlc3NfcGVuZGluZyBpbiBwYXJhbGxlbCB3aXRoIGFueSBoeXBlcmNhbGwuDQo+
Pj4+IFNvLCBldmVuIHdpdGhvdXQgbG9ja2luZyBpbiB2cGNpX3Byb2Nlc3NfcGVuZGluZyB0aGUg
YWJvdmUgc2hvdWxkDQo+Pj4+IGJlIGVub3VnaC4NCj4+Pj4gVGhlIG9ubHkgY29uY2VybiBoZXJl
IGlzIHRoYXQgZG9tYWluX3BhdXNlX2V4Y2VwdF9zZWxmIG1heSByZXR1cm4NCj4+Pj4gdGhlIGVy
cm9yIGNvZGUgd2Ugc29tZWhvdyBuZWVkIHRvIGhhbmRsZS4uLg0KPj4+IE5vdCBqdXN0IHRoaXMu
IFRoZSAtRVJFU1RBUlQgaGFuZGxpbmcgaXNuJ3QgYXBwcm9wcmlhdGUgdGhpcyB3YXkNCj4+PiBl
aXRoZXIuDQo+PiBBcmUgeW91IHRhbGtpbmcgYWJvdXQgY3B1X3JlbGF4KCk/DQo+IEknbSB0YWxr
aW5nIGFib3V0IHRoYXQgc3Bpbi13YWl0aW5nIGxvb3AgYXMgYSB3aG9sZS4NCj4NCj4+PiAgICBG
b3IgdGhlIG1vbWVudCBJIGNhbid0IGhlbHAgdGhpbmtpbmcgdGhhdCBkcmFpbmluZyB3b3VsZA0K
Pj4+IGJlIHByZWZlcmFibGUgb3ZlciBjYW5jZWxpbmcuDQo+PiBHaXZlbiB0aGF0IGNhbmNlbGxh
dGlvbiBpcyBnb2luZyB0byBoYXBwZW4gb24gZXJyb3IgcGF0aCBvcg0KPj4gb24gZGV2aWNlIGRl
LWFzc2lnbi9yZW1vdmUgSSB0aGluayB0aGlzIGNhbiBiZSBhY2NlcHRhYmxlLg0KPj4gQW55IHJl
YXNvbiB3aHkgbm90Pw0KPiBJdCB3b3VsZCBzZWVtIHRvIG1lIHRoYXQgdGhlIGNvcnJlY3RuZXNz
IG9mIGEgZHJhaW5pbmcgYXBwcm9hY2ggaXMNCj4gZ29pbmcgdG8gYmUgZWFzaWVyIHRvIHByb3Zl
IHRoYW4gdGhhdCBvZiBhIGNhbmNlbGluZyBvbmUsIHdoZXJlIEkNCj4gZXhwZWN0IHJhY2VzIHRv
IGJlIGEgYmlnZ2VyIHJpc2suIEVzcGVjaWFsbHkgc29tZXRoaW5nIHRoYXQgZ2V0cw0KPiBleGVj
dXRlZCBpbmZyZXF1ZW50bHksIGlmIGV2ZXIgKGVycm9yIHBhdGhzIGluIHBhcnRpY3VsYXIpLCBr
bm93aW5nDQo+IHRoaW5ncyBhcmUgd2VsbCBmcm9tIHRlc3RpbmcgaXNuJ3QgdHlwaWNhbGx5IHBv
c3NpYmxlLg0KQ291bGQgeW91IHBsZWFzZSB0aGVuIGdpdmUgbWUgYSBoaW50IGhvdyB0byBkbyB0
aGF0Og0KMS4gV2UgaGF2ZSBzY2hlZHVsZWQgU09GVElSUSBvbiB2Q1BVMCBhbmQgaXQgaXMgYWJv
dXQgdG8gdG91Y2ggcGRldi0+dnBjaQ0KMi4gV2UgaGF2ZSBkZS1hc3NpZ24vcmVtb3ZlIG9uIHZD
UFUxDQoNCkhvdyBkbyB3ZSBkcmFpbiB0aGF0PyBEbyB5b3UgbWVhbiBzb21lIGF0b21pYyB2YXJp
YWJsZSB0byBiZQ0KdXNlZCBpbiB2cGNpX3Byb2Nlc3NfcGVuZGluZyB0byBmbGFnIGl0IGlzIHJ1
bm5pbmcgYW5kIGRlLWFzc2lnbi9yZW1vdmUNCm5lZWRzIHRvIHdhaXQgYW5kIHNwaW5uaW5nIGNo
ZWNraW5nIHRoYXQ/DQo+DQo+IEphbg0KPg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

