Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C902141A98C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 09:17:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197614.350766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7MS-0004Ck-9q; Tue, 28 Sep 2021 07:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197614.350766; Tue, 28 Sep 2021 07:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7MS-0004AQ-5U; Tue, 28 Sep 2021 07:17:08 +0000
Received: by outflank-mailman (input) for mailman id 197614;
 Tue, 28 Sep 2021 07:17:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7uFz=OS=epam.com=prvs=0905849383=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mV7MQ-0004AK-Ee
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 07:17:06 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be6b7809-470f-4078-a60e-866deec3f95b;
 Tue, 28 Sep 2021 07:17:05 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18S73jMb006884; 
 Tue, 28 Sep 2021 07:17:04 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bbxb0r1uq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 07:17:03 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6898.eurprd03.prod.outlook.com (2603:10a6:20b:2d6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 07:17:00 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 07:17:00 +0000
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
X-Inumbo-ID: be6b7809-470f-4078-a60e-866deec3f95b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHxSZtAAYgSZx4fUo9YT7Qf60gg9XMngy6rh/m8I+AauKUod+NWPGbvJgCssbHu9Y60NbOxtUYgS2Mx6tGS6ke4RAM0A6MVSDfwWOjlB2R4pDohdFkXvZoWaGX7Taiy3cgrQGadi5n0g2y63jf//Li9dhxMDA9dSpifUjIaNn/5sQ3isNImVbSX0d/ggP06pdv8Wk4g7Cq9v/RgUbnl5KvsJa9ahLd5yd1MdiSayGuLwmd3iad33OnRhcCp1aruFSxaOXXqXb7GQC6Q1LylmWgiHU9+XqPjoTIBTCeJZE3xgOI/R+MkMz6Ot5sF1jaPQ2JFMai16qchuS0GezCt2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=aFfHw5u4eKbcsXOjtcO14Mn58U6WlfFn2mOLJ5ED/bE=;
 b=mIM4q3Cz5QcVEos/glIO/kRC4632EnWC7BOHK2Vvx5B6cdx4O/GWRu0IEhwg5RUOTblkiMCAMlVoVt8pFOK39s5vePnud+Fd4mVgxYfuSRLGDvolw6bmc/BexypFibXdiwhfIWBmlIai6MUH/AWZMt80mYazX2Nv4PJJFzibE8ed3aNQj4m3krMno8uwMencyORFzUTtU1ryydXFLAJczRajFExVJtcZcaOGL/Jbu9mkT+zk2TiYgYSDOBHk4lQ/siXy4/uUYtenC99b/ZY358U/NHIvY78LYsv3CpAXBvhK2HSCToamV3orAxufXRjfBWWoCzBPxxnuE7HEvmjfsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFfHw5u4eKbcsXOjtcO14Mn58U6WlfFn2mOLJ5ED/bE=;
 b=iulV8qGl+izbTWdB80zUzL/k83xAnwa8chVEwG3A/Jug4IMp4hwX9bWKRlT/Z8SdECkVxvxi4X0bSOzrSyI+TTBtwNsR+rRWmJz+D+YtzKSfcSeMGhaF31VrQlbfdpMhwMJrNI2uXhExUKtMFtzjQTpdx1gt9mpsejysI13nWB1cq3hliLrGvyq4klz7LhVJnRtCeskJ+QOuBAaqZalBM9BP/jn3ry8KL1WrUdCjxy38jYqQHnhn713wSRazmcaeGvdK7epBHaXS/PAtJizXPnnkTOuecI00f6NSENZbS3hNTrhl6DsBqO58Fb80jMUxJaaSeQw+fPpz7wCnNAdVyQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
        Stefano
 Stabellini <sstabellini@kernel.org>
CC: "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
        "julien@xen.org" <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 1/2] xen-pciback: prepare for the split for stub and PV
Thread-Topic: [PATCH v4 1/2] xen-pciback: prepare for the split for stub and
 PV
Thread-Index: 
 AQHXs20TiZWMfq6cRkakGi7ds9CK56u3ezoAgAACbACAAAVGAIABVeSAgAAoPoCAAAP7gIAAAMWAgAAFAAA=
Date: Tue, 28 Sep 2021 07:17:00 +0000
Message-ID: <51e38ddc-49df-2e70-d094-71d045297ab1@epam.com>
References: <20210927065822.350973-1-andr2000@gmail.com>
 <e472468a-625e-6c4d-a9c2-85594e2ff908@suse.com>
 <accd0220-a9d7-145b-6632-9dee085ffc65@epam.com>
 <1cf5fbf3-6453-e258-3940-8b5bb96117b6@suse.com>
 <alpine.DEB.2.21.2109272112150.5022@sstabellini-ThinkPad-T480s>
 <0b952b8d-0ebd-1c8c-84d4-f02e05bc2a2b@suse.com>
 <b4c8b964-56d7-c693-98e0-ecb435925eb0@epam.com>
 <da921aa0-0259-cd2e-5f43-5e2934ad3f82@suse.com>
In-Reply-To: <da921aa0-0259-cd2e-5f43-5e2934ad3f82@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80d5b3b3-0194-4077-1b57-08d9824ff708
x-ms-traffictypediagnostic: AM9PR03MB6898:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM9PR03MB689852C1196D1CD92D823A93E7A89@AM9PR03MB6898.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZzrQySVK6qBbfvwQqoeosUfG5By63/+WbTmuyM2yxQ1NL/FNhpfXo61dQnhj3zrpReJQcLte/4au2/7YeXDiXIqYR/cseGWNVlfc/zu4e+MArvYRef8au9mYcIHBFT3PltzQTiC7u35+X0cSe6gTWCiWhpy19e+M4zdtHNyblC+hVlDKWoxkxtYbu+Qj5hFgsXlCL8pHPArBnwuISXDyaf9CmAGEx0OCWo6lvNFrxdRmU6HVtl/+jKSG8wh1TFToD5Cap2m0CpUbCxjfP3JeCgidipkAgggSBkj2CPQKlW1aiHUojB6Ir2F+hekokfhRL7Vbxa3c25glPn9H0jbuZcFMKB+rrRdEEPock7LGl8TNI893LaWujvY2ZaSdDNy1VnYkZQb7w6dVtv1y/0KGQ4E5dS5UVvwZBxqJBMyo6GU+l1NSHTNWpmRoNf30gSEFZLQW1j0VBRXsbsp5HGcY6M86mDhioVkLJ3y1jBoWdFfWQh5OQ1tQhcb+slPnd8bHavydLp2Oy84HqX6KizAD4dQ1o6OlaoKBpuV8I1Sn5itDSCTQOwnOl1X716YdxbZT/YHd0xYq5lggQJ4kl8+oegpK2rmlyJGjmGEUuK94WfhZ+ijVJLjk1O37LSzEa9d862zgWrbMdaViGY7ow/1dPpKRXcEosr93j+Px5BCUHN4eqmpa6YYPg3wIUD87c3ObMptTSmDu1tvF30y9wOV9YQr0rWpbEI4MoHg6oRHbJDe1lNZGDQ0MmHBlwehpt7JA
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(38100700002)(508600001)(36756003)(83380400001)(53546011)(38070700005)(6506007)(86362001)(31696002)(2616005)(6486002)(6512007)(66946007)(31686004)(66556008)(55236004)(66476007)(2906002)(5660300002)(26005)(64756008)(66446008)(91956017)(110136005)(54906003)(71200400001)(186003)(76116006)(8936002)(107886003)(316002)(4326008)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N0dTaTFuVzVQcnhIRjRVOEh6QjEwdUk0enh4cFBrRjBQVXJLM040WGVrcUgr?=
 =?utf-8?B?M2JBZlUzRkJQTkFjVmtMVmRkMU9welc0cGdWclNyWU50MEQ5bERLWjN1M01D?=
 =?utf-8?B?L2tVVWJ1VXRTcjgxcmhBSy9lUnkyb1FNWmt4K0pIUHgrQVZaRllmMUNHdnRs?=
 =?utf-8?B?NXhUS3ZoWjZlcldsUGdyY2hXL0pDQzFIL1NsM0dGQmFtWjNiTEtFLy9LOW04?=
 =?utf-8?B?WHBqNEJSak8rbGowU0ttODVUYnlSSnFwelA4VzU5Tkh0QmVRcHNVZzRTdzhH?=
 =?utf-8?B?ajVWVTJocjA2YVgrajZPMEprRHVPVFFrZE1VZDNXVE5ucmlGSHBsOVR4RWd0?=
 =?utf-8?B?cTJ3eWUza2pjUDFoNWxZOVEvR1Q4TjRTb2t0RXUvTXFMalJsVFVDdWZyMTJm?=
 =?utf-8?B?RTN5R05lVVVVdVkyQlRqeWRnSlRoU3pVb2R1TGNnTG1BblV1MC9nR05RYUw0?=
 =?utf-8?B?d2NxUVlMTm5YRmJ4VlFDVWhIQmY5S3VxNjIvdXRDZE5Jc0FUeVhxUUF4cUdE?=
 =?utf-8?B?dFFKZEkxMU0yYThOREZLMFpGajI0c2JVSEZoTHBVS2psb1AyaXRta3lmemhs?=
 =?utf-8?B?RmMweXd0S2dObHdvVnMyd1V4ckZTQXdFbVJ3Wk15K1VKcnJTR0QzTnNnbHd2?=
 =?utf-8?B?SGpGRWNiekdPbjZpSDluZXZuanNLdmM0Y2loY05OTjB0TmJhenlyc1hFNTJW?=
 =?utf-8?B?MVhxbllwTXh2Qm5sT0hxMzNrRkt1RkRYVnRJT0pRSlZQTHI5RXhxb09PMlVu?=
 =?utf-8?B?ekdCb1QyZW9yWjhidFhDK3ltTWNZN2lobzQzMnR3cG9wQjcrQkROeGY5R2t5?=
 =?utf-8?B?UkRDUzBHN0Y1eDNKcVN0NW5YSFErT2JYV0tXcklzZmFoejdOendNdTB5UkJs?=
 =?utf-8?B?ZDRBN2gyOU1Xc1NLVlhMenMwdUM5QlNHYTliTGd6UmcyTVpKV282eTJ0bG9S?=
 =?utf-8?B?MzByaFBNbE5STGg0dG1aUEROM05WSG0vcDdSdGRkaVdYQkk1VEI2VkwzTEJu?=
 =?utf-8?B?VHczUWtRYXc3NUJRRjRQWU1VNWgvZEVlMXFwbU9vTmZRSnZJUXdNOXQzQzBF?=
 =?utf-8?B?WE1uNDZZMjZFT0s3akY3TmgrTWlKQ1B1TDlTaVdBZDUxZ0VnK2VTQWdMNVFM?=
 =?utf-8?B?TWZNdWI4ckVkMnhHWEs3dXJ2cWRmcy83dEJ1TDEzbi9CN1VEemlKbUtBSjRL?=
 =?utf-8?B?SHMvK0tVQWUvYXRrK1FtWmYreUJsVlUrdlU5TzJ5S1VzZlp2cGhEb3pUY05C?=
 =?utf-8?B?ZklNQXdGU3BvSUhqZjQ0VUhuYmMrTTFzTFoxdTNqN2lDWFNjeUtuNGx6SlM1?=
 =?utf-8?B?Nm1QVWtUNEkyeVNkdm9WTXY3RVZmdzM1VHl6TTFBKzRWc0JUVmc5Z1NLWkZi?=
 =?utf-8?B?YUN1ckJMWDJFVEJFRklHbUpmcEdwK2xlbCtXZHFjOTdud2lqZ3lTdFhFQXNC?=
 =?utf-8?B?cTRtUDAweENjYUhZczZDbGhaSnd1YWxSKzV4R2FDcDdsWHdZM3hoTEl5OUto?=
 =?utf-8?B?QTdpVyttQVJUTzlXdFhUUWtMdUo2S0Q0ZGFWNHVRMHVuVXMvaXBBbUNTOTNS?=
 =?utf-8?B?M2FHVldrMEp6T1hzNUhUTGUwZmhlbGNhb3RSejRSMHNOTk0za0JSY01qZGQ5?=
 =?utf-8?B?NGphWGhUb1FDSkI5V2xaQldGMTlUYTQ5eHV0ZU1xVmVwUUF6bytEbmRnMFh6?=
 =?utf-8?B?WlVhSVJ4YVIyakg5a3V0TzNqbG5nQ3ppZlcyR1BuNWZTL2ZIRUxKclBmeEpE?=
 =?utf-8?B?NVZzdzBhY2pselJGa2R5RUNpSG9DK0dNd0ZRWWtDbmFsZUk4UEpsR2o2YXFF?=
 =?utf-8?B?Ri9lWEZ0SUd1OUY5QnQ1UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C25F2D4F64B514D9301FFB8CA93B3BD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d5b3b3-0194-4077-1b57-08d9824ff708
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 07:17:00.7121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4OEKDi4qYwCRfJDpoA6K9N29VWLQ5ToHl3C+gnulFZ3Z95RCPeX7qHBVopVU4amkj8iOkhNHb7GHG/RP2yx5rwv15ubd0EF0vogEt5WXpOwZCpmN+WoV0RTSw8ShEx12
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6898
X-Proofpoint-ORIG-GUID: bVoE9D8zBRjNci62zRmOuA_Bul4VlAsB
X-Proofpoint-GUID: bVoE9D8zBRjNci62zRmOuA_Bul4VlAsB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_04,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109280042

DQpPbiAyOC4wOS4yMSAwOTo1OSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMjguMDkuMjEg
MDg6NTYsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4NCj4+IE9uIDI4LjA5LjIx
IDA5OjQyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAyOC4wOS4yMDIxIDA2OjE4LCBTdGVm
YW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4+IE9uIE1vbiwgMjcgU2VwIDIwMjEsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6DQo+Pj4+PiBPbiAyNy4wOS4yMSAwOTozNSwgT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gd3JvdGU6DQo+Pj4+Pj4gT24gMjcuMDkuMjEgMTA6MjYsIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4+Pj4+PiBPbiAyNy4wOS4yMDIxIDA4OjU4LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3
cm90ZToNCj4+Pj4+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJf
YW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBDdXJyZW50bHkgUENJ
IGJhY2tlbmQgaW1wbGVtZW50cyBtdWx0aXBsZSBmdW5jdGlvbmFsaXRpZXMgYXQgYSB0aW1lLg0K
Pj4+Pj4+Pj4gVG8gbmFtZSBhIGZldzoNCj4+Pj4+Pj4+IDEuIEl0IGlzIHVzZWQgYXMgYSBkYXRh
YmFzZSBmb3IgYXNzaWduYWJsZSBQQ0kgZGV2aWNlcywgZS5nLiB4bA0KPj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgIHBjaS1hc3NpZ25hYmxlLXthZGR8cmVtb3ZlfGxpc3R9IG1hbmlwdWxhdGVzIHRoYXQg
bGlzdC4gU28sDQo+Pj4+Pj4+PiB3aGVuZXZlcg0KPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIHRoZSB0
b29sc3RhY2sgbmVlZHMgdG8ga25vdyB3aGljaCBQQ0kgZGV2aWNlcyBjYW4gYmUgcGFzc2VkIHRo
cm91Z2gNCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBpdCByZWFkcyB0aGF0IGZyb20gdGhlIHJlbGV2
YW50IHN5c2ZzIGVudHJpZXMgb2YgdGhlIHBjaWJhY2suDQo+Pj4+Pj4+PiAyLiBJdCBpcyB1c2Vk
IHRvIGhvbGQgdGhlIHVuYm91bmQgUENJIGRldmljZXMgbGlzdCwgZS5nLiB3aGVuIHBhc3NpbmcN
Cj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoCB0aHJvdWdoIGEgUENJIGRldmljZSBpdCBuZWVkcyB0byBi
ZSB1bmJvdW5kIGZyb20gdGhlIHJlbGV2YW50DQo+Pj4+Pj4+PiBkZXZpY2UNCj4+Pj4+Pj4+IMKg
wqDCoMKgwqDCoCBkcml2ZXIgYW5kIGJvdW5kIHRvIHBjaWJhY2sgKHN0cmljdGx5IHNwZWFraW5n
IGl0IGlzIG5vdCByZXF1aXJlZA0KPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIHRoYXQgdGhlIGRldmlj
ZSBpcyBib3VuZCB0byBwY2liYWNrLCBidXQgcGNpYmFjayBpcyBhZ2FpbiB1c2VkIGFzIGENCj4+
Pj4+Pj4+IMKgwqDCoMKgwqDCoCBkYXRhYmFzZSBvZiB0aGUgcGFzc2VkIHRocm91Z2ggUENJIGRl
dmljZXMsIHNvIHdlIGNhbiByZS1iaW5kIHRoZQ0KPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIGRldmlj
ZXMgYmFjayB0byB0aGVpciBvcmlnaW5hbCBkcml2ZXJzIHdoZW4gZ3Vlc3QgZG9tYWluIHNodXRz
DQo+Pj4+Pj4+PiBkb3duKQ0KPj4+Pj4+Pj4gMy4gRGV2aWNlIHJlc2V0IGZvciB0aGUgZGV2aWNl
cyBiZWluZyBwYXNzZWQgdGhyb3VnaA0KPj4+Pj4+Pj4gNC4gUGFyYS12aXJ0dWFsaXNlZCB1c2Ut
Y2FzZXMgc3VwcG9ydA0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IFRoZSBwYXJhLXZpcnR1YWxpc2VkIHBh
cnQgb2YgdGhlIGRyaXZlciBpcyBub3QgYWx3YXlzIG5lZWRlZCBhcyBzb21lDQo+Pj4+Pj4+PiBh
cmNoaXRlY3R1cmVzLCBlLmcuIEFybSBvciB4ODYgUFZIIERvbTAsIGFyZSBub3QgdXNpbmcgYmFj
a2VuZC1mcm9udGVuZA0KPj4+Pj4+Pj4gbW9kZWwgZm9yIFBDSSBkZXZpY2UgcGFzc3Rocm91Z2gu
IEZvciBzdWNoIHVzZS1jYXNlcyBtYWtlIHRoZSB2ZXJ5DQo+Pj4+Pj4+PiBmaXJzdCBzdGVwIGlu
IHNwbGl0dGluZyB0aGUgeGVuLXBjaWJhY2sgZHJpdmVyIGludG8gdHdvIHBhcnRzOiBYZW4NCj4+
Pj4+Pj4+IFBDSSBzdHViIGFuZCBQQ0kgUFYgYmFja2VuZCBkcml2ZXJzLg0KPj4+Pj4+Pj4NCj4+
Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvDQo+Pj4+Pj4+PiA8
b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gLS0t
DQo+Pj4+Pj4+PiBDaGFuZ2VzIHNpbmNlIHYzOg0KPj4+Pj4+Pj4gLSBNb3ZlIENPTkZJR19YRU5f
UENJREVWX1NUVUIgdG8gdGhlIHNlY29uZCBwYXRjaA0KPj4+Pj4+PiBJJ20gYWZyYWlkIHRoaXMg
d2Fzbid0IGZ1bGx5IGRvbmU6DQo+Pj4+Pj4+DQo+Pj4+Pj4+PiAtLS0gYS9kcml2ZXJzL3hlbi94
ZW4tcGNpYmFjay9NYWtlZmlsZQ0KPj4+Pj4+Pj4gKysrIGIvZHJpdmVycy94ZW4veGVuLXBjaWJh
Y2svTWFrZWZpbGUNCj4+Pj4+Pj4+IEBAIC0xLDUgKzEsNiBAQA0KPj4+Pj4+Pj4gwqDCoMKgwqAg
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPj4+Pj4+Pj4gwqDCoMKgwqAgb2Jq
LSQoQ09ORklHX1hFTl9QQ0lERVZfQkFDS0VORCkgKz0geGVuLXBjaWJhY2subw0KPj4+Pj4+Pj4g
K29iai0kKENPTkZJR19YRU5fUENJREVWX1NUVUIpICs9IHhlbi1wY2liYWNrLm8NCj4+Pj4+Pj4g
V2hpbGUgYmVuaWduIHdoZW4gYWRkZWQgaGVyZSwgdGhpcyBhZGRpdGlvbiBzdGlsbCBkb2Vzbid0
IHNlZW0gdG8NCj4+Pj4+Pj4gYmVsb25nIGhlcmUuDQo+Pj4+Pj4gTXkgYmFkLiBTbywgaXQgc2Vl
bXMgd2l0aG91dCBDT05GSUdfWEVOX1BDSURFVl9TVFVCIHRoZSBjaGFuZ2Ugc2VlbXMNCj4+Pj4+
Pg0KPj4+Pj4+IHRvIGJlIG5vbi1mdW5jdGlvbmFsLiBXaXRoIENPTkZJR19YRU5fUENJREVWX1NU
VUIgd2UgZmFpbCB0byBidWlsZCBvbiAzMi1iaXQNCj4+Pj4+Pg0KPj4+Pj4+IGFyY2hpdGVjdHVy
ZXMuLi4NCj4+Pj4+Pg0KPj4+Pj4+IFdoYXQgd291bGQgYmUgdGhlIHByZWZlcmVuY2UgaGVyZT8g
U3RlZmFubyBzdWdnZXN0ZWQgdGhhdCB3ZSBzdGlsbCBkZWZpbmUNCj4+Pj4+Pg0KPj4+Pj4+IENP
TkZJR19YRU5fUENJREVWX1NUVUIsIGJ1dCBpbiBkaXNhYmxlZCBzdGF0ZSwgZS5nLiB3ZSBhZGQg
dHJpc3RhdGUgdG8gaXQNCj4+Pj4+Pg0KPj4+Pj4+IGluIHRoZSBzZWNvbmQgcGF0Y2gNCj4+Pj4+
Pg0KPj4+Pj4+IEFub3RoZXIgb3B0aW9uIGlzIGp1c3QgdG8gc3F1YXNoIHRoZSB0d28gcGF0Y2hl
cy4NCj4+Pj4+IFNxdWFzaGluZyB3b3VsZCBiZSBmaW5lIGZvciBtZS4NCj4+Pj4gwqDCoCBJdCBp
cyBmaW5lIGZvciBtZSB0byBzcXVhc2ggdGhlIHR3byBwYXRjaGVzLg0KPj4+Pg0KPj4+PiBCdXQg
aW4gYW55IGNhc2UsIHdvdWxkbid0IGl0IGJlIGJldHRlciB0byBtb2RpZnkgdGhhdCBzcGVjaWZp
YyBjaGFuZ2UgdG86DQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW4tcGNp
YmFjay9NYWtlZmlsZSBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL01ha2VmaWxlDQo+Pj4+IGlu
ZGV4IGUyY2IzNzY0NDRhNi4uZTIzYzc1OGI4NWFlIDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJz
L3hlbi94ZW4tcGNpYmFjay9NYWtlZmlsZQ0KPj4+PiArKysgYi9kcml2ZXJzL3hlbi94ZW4tcGNp
YmFjay9NYWtlZmlsZQ0KPj4+PiBAQCAtMSw2ICsxLDUgQEANCj4+Pj4gwqDCoCAjIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+Pj4+IC1vYmotJChDT05GSUdfWEVOX1BDSURFVl9C
QUNLRU5EKSArPSB4ZW4tcGNpYmFjay5vDQo+Pj4+IC1vYmotJChDT05GSUdfWEVOX1BDSURFVl9T
VFVCKSArPSB4ZW4tcGNpYmFjay5vDQo+Pj4+ICtvYmotJChDT05GSUdfWEVOX1BDSV9TVFVCKSAr
PSB4ZW4tcGNpYmFjay5vDQo+Pj4gQnV0IHRoYXQgd291bGRuJ3QgYWxsb3cgdGhlIGRyaXZlciB0
byBiZSBhIG1vZHVsZSBhbnltb3JlLCB3b3VsZCBpdD8NCj4+DQo+PiBFeGFjdGx5LiBJIGZvcmdv
dCB0aGF0IHdoZW4gcGxheWluZyB3aXRoIG1vZHVsZS9idWlsdC1pbiBJIHdhcyBub3QgYWJsZQ0K
Pj4NCj4+IHRvIGNvbnRyb2wgdGhhdCBhbnltb3JlIGJlY2F1c2UgQ09ORklHX1hFTl9QQ0lfU1RV
QiB3aWxsIGFsd2F5cyBiZQ0KPj4NCj4+IGluICJ5IiBzdGF0ZSwgdGh1cyBldmVuIGlmIHlvdSBo
YXZlIENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQ9bQ0KPj4NCj4+IHlvdSB3b24ndCBiZSBhYmxl
IHRvIGJ1aWxkIGl0IGFzIG1vZHVsZS4gU28sIEkgd2lsbCBwcm9iYWJseSBwdXQgYSBjb21tZW50
DQo+Pg0KPj4gYWJvdXQgdGhhdCBpbiB0aGUgTWFrZWZpbGUgZXhwbGFpbmluZyB0aGUgbmVlZCBm
b3INCj4+DQo+PiBvYmotJChDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EKSArPSB4ZW4tcGNpYmFj
ay5vDQo+PiBvYmotJChDT05GSUdfWEVOX1BDSURFVl9TVFVCKSArPSB4ZW4tcGNpYmFjay5vDQo+
DQo+IEluIGNhc2UgdGhlIHJlYWwgc3BsaXQgYmV0d2VlbiBib3RoIHBhcnRzIG9mIHhlbi1wY2li
YWNrIGlzIGRvbmUgdGhpcw0KPiB3aWxsIGJlIG5lZWRlZCBhbnl3YXkuDQoNClllcywgaXQgd2ls
bA0KDQpTbywgSSdsbCBwdXQgYSBjb21tZW50IGluIHRoZSBNYWtlZmlsZToNCg0KIyBOLkIuIFRo
aXMgY2Fubm90IGJlIGV4cHJlc3NlZCB3aXRoIGEgc2luZ2xlIGxpbmUgdXNpbmcgQ09ORklHX1hF
Tl9QQ0lfU1RVQg0KDQojIGFzIGl0IGFsd2F5cyByZW1haW5zIGluICJ5IiBzdGF0ZSwgdGh1cyBw
cmV2ZW50aW5nIHRoZSBkcml2ZXIgdG8gYmUgYnVpbHQgYXMNCg0KIyBhIG1vZHVsZS4NCg0Kb2Jq
LSQoQ09ORklHX1hFTl9QQ0lERVZfQkFDS0VORCkgKz0geGVuLXBjaWJhY2subw0Kb2JqLSQoQ09O
RklHX1hFTl9QQ0lERVZfU1RVQikgKz0geGVuLXBjaWJhY2subw0KDQpXaWxsIHRoaXMgYmUgb2sg
b3IgbmVlZHMgc29tZSByZS13b3JkaW5nPw0KDQo+DQo+DQo+IEp1ZXJnZW4NCj4NClRoYW5rIHlv
dSwNCg0KT2xla3NhbmRyDQo=

