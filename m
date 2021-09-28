Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBA941A6D4
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 06:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197435.350473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV57T-0007Mt-Gw; Tue, 28 Sep 2021 04:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197435.350473; Tue, 28 Sep 2021 04:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV57T-0007KT-Bk; Tue, 28 Sep 2021 04:53:31 +0000
Received: by outflank-mailman (input) for mailman id 197435;
 Tue, 28 Sep 2021 04:53:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7uFz=OS=epam.com=prvs=0905849383=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mV57S-0007KJ-6h
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 04:53:30 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ba48712-0782-4cb0-9a67-33cf9cf2c361;
 Tue, 28 Sep 2021 04:53:29 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18S4iuCc001921; 
 Tue, 28 Sep 2021 04:53:27 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bbv9pg0h6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 04:53:27 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3587.eurprd03.prod.outlook.com (2603:10a6:208:44::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 04:53:24 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 04:53:24 +0000
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
X-Inumbo-ID: 1ba48712-0782-4cb0-9a67-33cf9cf2c361
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUEGE27lzY1gdjgV7uBtGFTYcgR0jqFxbtYlZiFu78GU0ala+Lwpr/Q/CJHSeweqj++1W8oCO4cSn9nQr2YuUc8xcTBhm8IRP42XIyRT3JX3GxFCcfExKe8Hzh+m9rRceL07nJPDbvBcLv9u1hIXNv7YAktkpjMGBIGYuU8ZAF57GjEcGSIw2X0vcFx4ep7LeFHecSELI3/iqez1p+jk2DRr8lX8YOhBpiekGBH2NCu7D7agXd0lvF5hW3zYf+UFyDbSwusJ70loVHnP7Sdxch4XXkXDDcyp5zu8pxjszFJ7Pm2IyvmbCwRSOw3/rp4E4BxKt/kr7MTPeRxSBdbAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=pUNoblaRZmNAu72mz3oju9rOzk8WG6gR72F8DGKJ3pg=;
 b=MjosxPEAZuO1zOoZ+9x1P02EYKgsxK9Sl1y7pm8WP/BcYqlsVWVO98yBmdmX6PZ5aBSaLUNFG4kGsX1qHyRZWUIrxs9se6bVkzfBhGljLiOeGQxoETqXdnW7RO2mSsfjiLMBD8+ELfwJ21TFrLhzzFmRw7Zq+BnfPIsI1iqLZ6wEx9wmDRlqeNIIUomCMu0AY9Mkvs5subD+nofWHyUbCvAJNkqA6GhDognLOs16qMo5eoBNdRdHnb1HN8XD/2Q7Gwlb8T6Z16U9e8xwRUfdTmNe/kMPJoKJB/HJfDdOKPBolvvHlePZi/iLmbOM4PXGprELZVHsfEHNAEHmLg+r/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUNoblaRZmNAu72mz3oju9rOzk8WG6gR72F8DGKJ3pg=;
 b=55dk78j2smNJMUrCb71bV6+ggq7fuL88+Vq3ip4XMiLtXbYP+qUXo3bCnRArl32Q96Pz5UsNi9N+DfFIVM7GRMTBpJ8MuCJP/lnGwk+M21dhijSp8UPsmx054244JrGCEu7E61VSLpeGNzOdnM3IGwKY6opdH0d/ZxWnbbUntOROhxuLrR7SA3zbLvvGzTw/3A1WOLlgGlKE3E4i+GnNukghStNyvyH1CgNYxzKEA3A2EbviWaj3msDKVmYvEWGL7pWsDCP8HgO2TlUTFWGFaOCQdlhZ9atlZOlz8gWhV8B/tQ0n3rizgezXXnysQFAimsIi0lO6yic8e7CQhICdHw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
        Juergen Gross
	<jgross@suse.com>
CC: Jan Beulich <jbeulich@suse.com>,
        "boris.ostrovsky@oracle.com"
	<boris.ostrovsky@oracle.com>,
        "julien@xen.org" <julien@xen.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 1/2] xen-pciback: prepare for the split for stub and PV
Thread-Topic: [PATCH v4 1/2] xen-pciback: prepare for the split for stub and
 PV
Thread-Index: AQHXs20TiZWMfq6cRkakGi7ds9CK56u3ezoAgAACbACAAAVGAIABVeSAgAAJ3AA=
Date: Tue, 28 Sep 2021 04:53:24 +0000
Message-ID: <1394cf31-3fdf-a8df-ebaf-90295c47d740@epam.com>
References: <20210927065822.350973-1-andr2000@gmail.com>
 <e472468a-625e-6c4d-a9c2-85594e2ff908@suse.com>
 <accd0220-a9d7-145b-6632-9dee085ffc65@epam.com>
 <1cf5fbf3-6453-e258-3940-8b5bb96117b6@suse.com>
 <alpine.DEB.2.21.2109272112150.5022@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109272112150.5022@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf201820-7316-49d5-978a-08d9823be76d
x-ms-traffictypediagnostic: AM0PR03MB3587:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB35874EE8700471D5AFE90DFEE7A89@AM0PR03MB3587.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9q+CVxIZhqR0QxgGSWzhknIhJ0RISH3lUpNaY3vp7qeQCsdiCLVN3CVYLl0uhTgcSwtloUj4sc3+EM6AduxlCRf7TAgTNq8LACmtPJim0j8MtbxSnKgpJ36lhEWGB24pIdrMSa37eL6Xsd/sTYN//h0SVvrLv7z/l6uhp0yUtVkwcbIo6ceF/h+9kzfIqroZVnpgMVtQEKjJR6gy4V38gGQBaPGf7+Mi/PufskzNB4Mr3L/1aGcA6nQljSiqS8UQKfYXkg9Q3E0dhhubGd02gOze2ek6LRGGKaZAH17dkzZZSsgYgianVAQBF3pV9gIetS7bQcu8VMmeDunNXgI59vDmpdxT4TksJqPXTwfret+yDuNzQF5+sb4J/rhcD+dpooyF1uLJDGuO+kyFVMzX1wO0llqh2CHTBLlgAgkqEjm5P0LKVewPXMJxImK+PwiO3n64tbYsVVxhLwPR6JNCebrZc07gkzjqI37PNyfa2h3/2GFz9OEqDMt1OQxkqV+Ahno7zyP2XIbcfVU2yoO6/rqXp/dxZD3w1gb6aP54CkERq4OOaPnHbB+44TgJFtofa4Xd2Vo6YqI8vuet631hGcWckPqJdEGQbzeHFxEswaQrBu8GXfagyYhrDJ2xCJQ7Pdoi18ixRkOUrShcL1ce27wIwESNbN4gNz8/TETs07qqS68IFa4kGKD9UxtCR5rcvIO7Hni7WTWPGI+ajE6M20vN102gw/p5eZ27TTNgverC/d53Zoj6jsSdRSZZtbEO
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(110136005)(38100700002)(8936002)(316002)(122000001)(107886003)(6512007)(6486002)(4326008)(66946007)(186003)(66446008)(66476007)(31686004)(66556008)(64756008)(76116006)(8676002)(91956017)(26005)(54906003)(5660300002)(86362001)(6506007)(71200400001)(38070700005)(83380400001)(36756003)(508600001)(53546011)(31696002)(2616005)(55236004)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YkpkWEFYenk1UlVDWVNIUWxMOFBlaWFpbTdkWnhnU1pBK3Q5T3hPeEIzNGdL?=
 =?utf-8?B?Q25WZHVwZ0pJNnVvN3hqbkxhTlQzUWlNOUVRNWp3U3pUUHhob09neFNHYTBt?=
 =?utf-8?B?T3VxbjArZ3V2Rko4NThKSThjTncrRCtzLzJiRWpHcnhTZTVQVUgrQU5GUTU2?=
 =?utf-8?B?bit5bFA4V0EzWlFJWFNIYnIwdEV1RUtCZm9lcEZZSXZCK2luRUFPVjRRYXJM?=
 =?utf-8?B?V1g5MHlheE9vOXNRa0hrWHM2cTBlK0xscXFYOTNWMlZBNWovN01hUEF2aUxo?=
 =?utf-8?B?SSt0TVB1SDQ0ak15V0kzWEZhU0NNN05SVTVXMlpCQ2x1S3I1WVRpdVJvWGV3?=
 =?utf-8?B?d2w2Yzl6NVJseVU4SGNNYXRqdlVheC8yTC9vZ2lQeFdIWkVZdGZ3QW9UN0k1?=
 =?utf-8?B?VDB0YmJwQ3M5aHJoMCtNSTBERWdaLzR4b2FYdWwzMkYwOGhWS0ZnNkhkS0RN?=
 =?utf-8?B?RmdGUmc1RzBRYURMN3d1RVQ3aU5vU01hamxxTFFkQVVUQ1AwL29BWjdjRTJG?=
 =?utf-8?B?WCt2NlBzSG5icU5zbzlNV25VZjhFSzJMa2x6QTN4SG1SWitleWJpQXZpUWZs?=
 =?utf-8?B?dHhVM0hGT2JFTnhndm9IQnRsU1UzSVdkNFd3MXpVNDFPK1V1V3BzeFUreHZq?=
 =?utf-8?B?S0lDSXlOdllacmJ6eStCd1YxekQwTUFYdkp5OHJtVll6U2lJVk13VFJOQzlX?=
 =?utf-8?B?UlZibnlsbEdKTjdqV3dGRWkwaUVyZjV2cHJ5VjRiR1VtYy9HQllvbXkwT3Nn?=
 =?utf-8?B?VVNTbmNFSE00NlRRSW1heGVDTUNyeWtsUGM5WkVEVWRzeGVpdXZNcWZXaTN1?=
 =?utf-8?B?VWM0S01EVjBZdXlGZzZqb3BzTGswdHJjZFp5VTYrbmRhTE5Bcm9XYlJMOG9o?=
 =?utf-8?B?RmJsaFNQZE81citDclZsVHpjSjl5c2NOY0N6ckpPRnc5TC9GeEN1V0VIK2R0?=
 =?utf-8?B?VC9BSFZkaUwvRnlJSkkrMHV5YnkrRmlYaExnRGhEd214VG04YVUrS3BSYUpS?=
 =?utf-8?B?ZEViNCsyQ2VvMW5HdmFkbDExbXdLYzVua0t4a01pYmVVSFBtR1BLcDhMZ2RM?=
 =?utf-8?B?SzVQTDVzdEpZQSs4L05hQW45RkpEbjc4Q2gxaGhkREpnK1I2ZWJBMHdsNlRp?=
 =?utf-8?B?d0VZLytXQW1QZDRsM2gyd2ltclQzMXRRSTQwZldac05nS1gwaXVXeUMvK2d5?=
 =?utf-8?B?OVl1a0c0WW9USmNmOWtTTmU1RmV1K2RUaW9XZjB4ZERHR1N6bWtZdW9oYi9K?=
 =?utf-8?B?cUNBTXE4QTNlR1VpeDZEc3FoRloyS1ZnaWFoZ0NScThSVTBIcDZwOEYzREQ4?=
 =?utf-8?B?U0JZLzNESG9uRkd5R1kyQUJIdDF4Q3JHdGJ0ZnRtcndpRmhlOUhqQXNnTHg3?=
 =?utf-8?B?T1l6K1VYdmRsYXNzR0IzWXRRNVQwVkZNNHRPaHdRVlRsUlRqcjh1dXh1S3o0?=
 =?utf-8?B?cWZQaUVYcm9pam0vbDlxWVZWR0lnUVRibzFyZkd5a294TXNRVFJXbmZTQTJx?=
 =?utf-8?B?TzdyV3BtSEVFa3pCT053NzUxU1lEUG5RZWJZbXFsWXRCREh6MzlSbVlZS3BN?=
 =?utf-8?B?RUVleTd4WnNJbnZhbkR4N2FMUUxneWVRd2dsazd1d0MrVWNQWThTS1BUd3hG?=
 =?utf-8?B?SmVLaXl0NERpMEc5cFRmUExqZHZoaUdSQUJDYWROVWhpU3VsbVZpVmtEcDl5?=
 =?utf-8?B?NXZQQldiU3hvMHA2elE4VHNHRmp0SGlMTVpaSzVjVnhSb1Z3akVHZS9oZEtF?=
 =?utf-8?B?bXdURjdOUnBxYml2d1gxZTZDQlJ6S3lxTUowRzVoK2hGbHhocFE1amM4aGZR?=
 =?utf-8?B?Rm95ZGNuZXFSWEVrUnpmdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F99D1FD42881B4E8ED17DB0ABF642CC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf201820-7316-49d5-978a-08d9823be76d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 04:53:24.6229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fuefLA2Uk6TzkvwYv+hx5cBmkz1K6pcTeRvLvfApOLBm/+PCY2lOlPBWM8M4kmshozxjjKzcNmwyRnHKSUCFsHeR2n6gUMH0df2nB4X7+ZgaHbT22S1+yAROTCoxRnOk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3587
X-Proofpoint-ORIG-GUID: QiHDHPtJT4t7S26omfZZTnoTa8xee28x
X-Proofpoint-GUID: QiHDHPtJT4t7S26omfZZTnoTa8xee28x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_03,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109280030

DQpPbiAyOC4wOS4yMSAwNzoxOCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBPbiBNb24s
IDI3IFNlcCAyMDIxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjcuMDkuMjEgMDk6MzUs
IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+IE9uIDI3LjA5LjIxIDEwOjI2LCBK
YW4gQmV1bGljaCB3cm90ZToNCj4+Pj4gT24gMjcuMDkuMjAyMSAwODo1OCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8
b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+Pg0KPj4+Pj4gQ3VycmVudGx5
IFBDSSBiYWNrZW5kIGltcGxlbWVudHMgbXVsdGlwbGUgZnVuY3Rpb25hbGl0aWVzIGF0IGEgdGlt
ZS4NCj4+Pj4+IFRvIG5hbWUgYSBmZXc6DQo+Pj4+PiAxLiBJdCBpcyB1c2VkIGFzIGEgZGF0YWJh
c2UgZm9yIGFzc2lnbmFibGUgUENJIGRldmljZXMsIGUuZy4geGwNCj4+Pj4+ICAgICAgIHBjaS1h
c3NpZ25hYmxlLXthZGR8cmVtb3ZlfGxpc3R9IG1hbmlwdWxhdGVzIHRoYXQgbGlzdC4gU28sDQo+
Pj4+PiB3aGVuZXZlcg0KPj4+Pj4gICAgICAgdGhlIHRvb2xzdGFjayBuZWVkcyB0byBrbm93IHdo
aWNoIFBDSSBkZXZpY2VzIGNhbiBiZSBwYXNzZWQgdGhyb3VnaA0KPj4+Pj4gICAgICAgaXQgcmVh
ZHMgdGhhdCBmcm9tIHRoZSByZWxldmFudCBzeXNmcyBlbnRyaWVzIG9mIHRoZSBwY2liYWNrLg0K
Pj4+Pj4gMi4gSXQgaXMgdXNlZCB0byBob2xkIHRoZSB1bmJvdW5kIFBDSSBkZXZpY2VzIGxpc3Qs
IGUuZy4gd2hlbiBwYXNzaW5nDQo+Pj4+PiAgICAgICB0aHJvdWdoIGEgUENJIGRldmljZSBpdCBu
ZWVkcyB0byBiZSB1bmJvdW5kIGZyb20gdGhlIHJlbGV2YW50DQo+Pj4+PiBkZXZpY2UNCj4+Pj4+
ICAgICAgIGRyaXZlciBhbmQgYm91bmQgdG8gcGNpYmFjayAoc3RyaWN0bHkgc3BlYWtpbmcgaXQg
aXMgbm90IHJlcXVpcmVkDQo+Pj4+PiAgICAgICB0aGF0IHRoZSBkZXZpY2UgaXMgYm91bmQgdG8g
cGNpYmFjaywgYnV0IHBjaWJhY2sgaXMgYWdhaW4gdXNlZCBhcyBhDQo+Pj4+PiAgICAgICBkYXRh
YmFzZSBvZiB0aGUgcGFzc2VkIHRocm91Z2ggUENJIGRldmljZXMsIHNvIHdlIGNhbiByZS1iaW5k
IHRoZQ0KPj4+Pj4gICAgICAgZGV2aWNlcyBiYWNrIHRvIHRoZWlyIG9yaWdpbmFsIGRyaXZlcnMg
d2hlbiBndWVzdCBkb21haW4gc2h1dHMNCj4+Pj4+IGRvd24pDQo+Pj4+PiAzLiBEZXZpY2UgcmVz
ZXQgZm9yIHRoZSBkZXZpY2VzIGJlaW5nIHBhc3NlZCB0aHJvdWdoDQo+Pj4+PiA0LiBQYXJhLXZp
cnR1YWxpc2VkIHVzZS1jYXNlcyBzdXBwb3J0DQo+Pj4+Pg0KPj4+Pj4gVGhlIHBhcmEtdmlydHVh
bGlzZWQgcGFydCBvZiB0aGUgZHJpdmVyIGlzIG5vdCBhbHdheXMgbmVlZGVkIGFzIHNvbWUNCj4+
Pj4+IGFyY2hpdGVjdHVyZXMsIGUuZy4gQXJtIG9yIHg4NiBQVkggRG9tMCwgYXJlIG5vdCB1c2lu
ZyBiYWNrZW5kLWZyb250ZW5kDQo+Pj4+PiBtb2RlbCBmb3IgUENJIGRldmljZSBwYXNzdGhyb3Vn
aC4gRm9yIHN1Y2ggdXNlLWNhc2VzIG1ha2UgdGhlIHZlcnkNCj4+Pj4+IGZpcnN0IHN0ZXAgaW4g
c3BsaXR0aW5nIHRoZSB4ZW4tcGNpYmFjayBkcml2ZXIgaW50byB0d28gcGFydHM6IFhlbg0KPj4+
Pj4gUENJIHN0dWIgYW5kIFBDSSBQViBiYWNrZW5kIGRyaXZlcnMuDQo+Pj4+Pg0KPj4+Pj4gU2ln
bmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28NCj4+Pj4+IDxvbGVrc2FuZHJfYW5k
cnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4+DQo+Pj4+PiAtLS0NCj4+Pj4+IENoYW5nZXMgc2lu
Y2UgdjM6DQo+Pj4+PiAtIE1vdmUgQ09ORklHX1hFTl9QQ0lERVZfU1RVQiB0byB0aGUgc2Vjb25k
IHBhdGNoDQo+Pj4+IEknbSBhZnJhaWQgdGhpcyB3YXNuJ3QgZnVsbHkgZG9uZToNCj4+Pj4NCj4+
Pj4+IC0tLSBhL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL01ha2VmaWxlDQo+Pj4+PiArKysgYi9k
cml2ZXJzL3hlbi94ZW4tcGNpYmFjay9NYWtlZmlsZQ0KPj4+Pj4gQEAgLTEsNSArMSw2IEBADQo+
Pj4+PiAgICAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPj4+Pj4gICAgIG9i
ai0kKENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQpICs9IHhlbi1wY2liYWNrLm8NCj4+Pj4+ICtv
YmotJChDT05GSUdfWEVOX1BDSURFVl9TVFVCKSArPSB4ZW4tcGNpYmFjay5vDQo+Pj4+IFdoaWxl
IGJlbmlnbiB3aGVuIGFkZGVkIGhlcmUsIHRoaXMgYWRkaXRpb24gc3RpbGwgZG9lc24ndCBzZWVt
IHRvDQo+Pj4+IGJlbG9uZyBoZXJlLg0KPj4+IE15IGJhZC4gU28sIGl0IHNlZW1zIHdpdGhvdXQg
Q09ORklHX1hFTl9QQ0lERVZfU1RVQiB0aGUgY2hhbmdlIHNlZW1zDQo+Pj4NCj4+PiB0byBiZSBu
b24tZnVuY3Rpb25hbC4gV2l0aCBDT05GSUdfWEVOX1BDSURFVl9TVFVCIHdlIGZhaWwgdG8gYnVp
bGQgb24gMzItYml0DQo+Pj4NCj4+PiBhcmNoaXRlY3R1cmVzLi4uDQo+Pj4NCj4+PiBXaGF0IHdv
dWxkIGJlIHRoZSBwcmVmZXJlbmNlIGhlcmU/IFN0ZWZhbm8gc3VnZ2VzdGVkIHRoYXQgd2Ugc3Rp
bGwgZGVmaW5lDQo+Pj4NCj4+PiBDT05GSUdfWEVOX1BDSURFVl9TVFVCLCBidXQgaW4gZGlzYWJs
ZWQgc3RhdGUsIGUuZy4gd2UgYWRkIHRyaXN0YXRlIHRvIGl0DQo+Pj4NCj4+PiBpbiB0aGUgc2Vj
b25kIHBhdGNoDQo+Pj4NCj4+PiBBbm90aGVyIG9wdGlvbiBpcyBqdXN0IHRvIHNxdWFzaCB0aGUg
dHdvIHBhdGNoZXMuDQo+PiBTcXVhc2hpbmcgd291bGQgYmUgZmluZSBmb3IgbWUuDQo+ICAgDQo+
IEl0IGlzIGZpbmUgZm9yIG1lIHRvIHNxdWFzaCB0aGUgdHdvIHBhdGNoZXMuDQo+DQo+IEJ1dCBp
biBhbnkgY2FzZSwgd291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIG1vZGlmeSB0aGF0IHNwZWNpZmlj
IGNoYW5nZSB0bzoNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL01h
a2VmaWxlIGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svTWFrZWZpbGUNCj4gaW5kZXggZTJjYjM3
NjQ0NGE2Li5lMjNjNzU4Yjg1YWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMveGVuL3hlbi1wY2li
YWNrL01ha2VmaWxlDQo+ICsrKyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL01ha2VmaWxlDQo+
IEBAIC0xLDYgKzEsNSBAQA0KPiAgICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAN
Cj4gLW9iai0kKENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQpICs9IHhlbi1wY2liYWNrLm8NCj4g
LW9iai0kKENPTkZJR19YRU5fUENJREVWX1NUVUIpICs9IHhlbi1wY2liYWNrLm8NCj4gK29iai0k
KENPTkZJR19YRU5fUENJX1NUVUIpICs9IHhlbi1wY2liYWNrLm8NCj4gICANCj4gICB4ZW4tcGNp
YmFjay15IDo9IHBjaV9zdHViLm8gcGNpYmFja19vcHMubyB4ZW5idXMubw0KPiAgIHhlbi1wY2li
YWNrLXkgKz0gY29uZl9zcGFjZS5vIGNvbmZfc3BhY2VfaGVhZGVyLm8gXA0KPg0KPg0KPiBpbnN0
ZWFkPw0KDQpZZXMsIGxvb2tzIHNpbXBsZXIgdGhlbi4gSSdsbCBzcXVhc2ggYW5kIGFkZCB0aGlz
IGNoYW5nZQ0KDQo=

