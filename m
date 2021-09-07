Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 216BB4025F2
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 11:07:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180670.327416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNX4x-0006Fb-KA; Tue, 07 Sep 2021 09:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180670.327416; Tue, 07 Sep 2021 09:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNX4x-0006De-Fl; Tue, 07 Sep 2021 09:07:43 +0000
Received: by outflank-mailman (input) for mailman id 180670;
 Tue, 07 Sep 2021 09:07:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hq6o=N5=epam.com=prvs=98842be756=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mNX4v-0006DW-Cn
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 09:07:41 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a95279b-1286-4476-a61b-23b964065993;
 Tue, 07 Sep 2021 09:07:40 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1877hNKW015205; 
 Tue, 7 Sep 2021 09:07:36 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57])
 by mx0a-0039f301.pphosted.com with ESMTP id 3awwwf94hj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 09:07:36 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AS8PR03MB6982.eurprd03.prod.outlook.com (2603:10a6:20b:290::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 09:07:27 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44%3]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 09:07:27 +0000
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
X-Inumbo-ID: 0a95279b-1286-4476-a61b-23b964065993
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+ta1QLp89UHIR9J/cwaHW0np4ecTqJ4FmG/2+AAujQ2YteC6/Frx0oEQIH4103DAQWCSKTGpg83FOa4Y+eHBmel26nkFoVuLQPyp+yTyit6g1+u1ZFco/ClGoI51SakDu/LYnRogjibxvy+lcjdj/YRYdAMY2BW1+wJNlCrhcBUHyznVCZo80JHBuAtSO/M1U6hqZqmpmKj4Tfsu/dhmlVZL1NfGFNkhZ2KSXvSxhqyz+TFfVlpyZUL6SaXVraieFXxIxk2ZTN4bdbt7XU5dcpvnybr3uPGN4dZU+Zw+2AAP4rPyfJ2OhHFlmr/E31Dsbk4JE2AJ7aQpN+jgaD0NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=iU06uG9UQghA0xEp3Kzkgh9kVYDqeW2pkTfpg5vmOdM=;
 b=eL3KyX+GJhjuPeIG96P/qSrdMTxvxsQ6grnVshpgnAjyNeqWYj+egtBO7AexJCKhMvpUws2rW4hLAN6KnR0kJbSFhjcXEilq9kwRorisKULGBvvFUhwZE1AOnD3ibm8pLQelAyilOhL9H9UIfASmNlYOe+WOfwnpM1gBKdZFD0vOyOXKmY+q1Km2GvqRafZjJ2RRvaIXr7yDhpNp9gtlPqhfr57bIHTdnhxMfX/UFSRbgRc0SloAdsU65Gazp5iDBAXncLGhPm+qOZzsl73mHL2q6kbAs6o6BDMWK/NNtw82BvTLewVEvINcpSVlXO3jbdRBVP0QGKv/6QbtLio6qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iU06uG9UQghA0xEp3Kzkgh9kVYDqeW2pkTfpg5vmOdM=;
 b=yRDwwYuhb8aPYAHqWR4lpaCDun7U7me78zYKjU8giykZZeH/bCC5Fp5Bvu+LsszkRGjrmu/8ebFsYyEPJRY6MS4vO4tJeMCvR6M0VVtfAzohEpCj9ox6rYuCuzlmkffsjk8/DBHEfUTVWGv/6m1LJETFOf/jZq23lHPolFWbxBj7JuIRcMcPzRjYfKEB97zcCF1ruO/qSrskiaLq6Y0AYiMHvm6cILCQ5JxTw8MDmXqIuCk1N9OsB18xrIljvfcdvPL+wVwTpmDGTE05/7+zmTcvpZmR0s3DWn5xGcqk5hf64H6zLXFYGtDsJSkZQ4ppk7cL7iq4e3wZDweD1qtDcw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 8/9] vpci/header: Reset the command register when adding
 devices
Thread-Topic: [PATCH 8/9] vpci/header: Reset the command register when adding
 devices
Thread-Index: 
 AQHXoKxjFI8WSqpeJkWkpzZfft/zi6uXHR6AgAEZm4CAAASsgIAABSgAgAAIrgCAAAT5AA==
Date: Tue, 7 Sep 2021 09:07:27 +0000
Message-ID: <5d0d345d-db16-f0c5-9a78-4ad5f4733886@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-9-andr2000@gmail.com>
 <ffddb533-399d-3b34-69f2-33ba1e977231@suse.com>
 <5366265c-d169-041d-f812-1c49260f6499@epam.com>
 <8f1816db-798b-15d9-7343-2199eb8f39e0@suse.com>
 <0e3942a5-9105-c99e-f15e-dcf35aae142a@epam.com>
 <c6702cee-9c37-8f0f-77d7-20da718e3e94@suse.com>
In-Reply-To: <c6702cee-9c37-8f0f-77d7-20da718e3e94@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92bba6b3-6a9c-491e-e1b7-08d971deea26
x-ms-traffictypediagnostic: AS8PR03MB6982:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AS8PR03MB69827F167C1F893442A3A0C2E7D39@AS8PR03MB6982.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CLqJcsRE6v6umDppl37yYDWl3klabIMmmbDDF/+Wxd5fGGlVe3zaAamXHl6P+dHPY7gWDLjqr7wV2lbaFNvkL/riiDyHvb7XdtYDiSzcCZNoJ259/F9QlflOvdJRIn2djFC/T9kGixgbE/P9bKzsnjWR6A25bjL5eqVIiZ0nJecWuTghtBrurU8IBYWgYIzQ41IQn5knDMW/ZgJGZmf82BYmZiOJ2GJLWXo2fJkc61RcfzcaGb17X86gbEmHiaXK35/nv8POAO2UlXPeVRcRp3NgZV6A9WGiA8kpmN7mwJS45+0N07fpwzePE9WWRInZpsvg4ElbWGA1GNAi/zSDb90vY4jEv8PEEoR5crJCbDXPgAEacSKC5MyH/vGe8E8poFoIy4/HdfXrI9oxExZDzXTFnyo6Pe0r426JWvA10cf8X614tH0Zs2nE/ldCmZySiiI+ZhpvLf/aTY4mOyGrsnDSjMdJqHAjRGt9nzXlt6bo/blt4wWYhE3DHwe7DHu6RDtGKiiqRLO25ETxkgLhgzvz1wpW3geGYL1shYqlCbIDdna2EFjrW9dOJEMmK0mowVwyXULdjSsv+0tgSBRvwqvt7YDDkvrml00/u3BNNIZtaT6nVWL9XeNSW1hn0ODhqL3JugGFTcdUAPOhbxRYtLI2hx8vAxAIPwskHR1l96uwub/THpw/rx83QJ7nu/eKnU2TLcKBB0WYt/6bLOJ+iwrW5/oShWyxQDjB5bZYZnh67tGRW7ack4+SSNVwi9eD
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(8936002)(2616005)(66556008)(66446008)(66476007)(8676002)(66946007)(26005)(36756003)(64756008)(316002)(2906002)(4326008)(6486002)(76116006)(71200400001)(91956017)(31686004)(53546011)(110136005)(54906003)(122000001)(5660300002)(478600001)(38100700002)(186003)(6512007)(38070700005)(86362001)(83380400001)(31696002)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UExGMWdDeE1VTld2RHhzOGVvRjlHRkVDVVp0U3FlcFhTUzI5UWtJNW5TdDNn?=
 =?utf-8?B?VWcyRkR5NmJodHdtdGk0YVFGSXM0T0J1MG5iMzVmYTNkQmc2d0dRYXpwK1pB?=
 =?utf-8?B?UjYvZDNpSi9LYXgxNCtNaTdpL2pERnZKYzZIa0Y4WHNzSHBGVGdjNGt1WXJP?=
 =?utf-8?B?N205eDYzVnFkTmNSOEhQSlN1UXR2RzFXYzVGeTlvSkpWcWZXY2ZJWW92T0lo?=
 =?utf-8?B?Q29MZ25iRHdtTitGUHhSMjJIK1FCWjhwWFV5QjlJZFJwSVp3ODEydG5NL2JK?=
 =?utf-8?B?RzMzRzZwYmUyY3lkRkx4MW9nTUYrNzJ6aFVHOGRORHh2bkhxWFdLT2E2R3d5?=
 =?utf-8?B?SE00RzRUSUJqOWtJRzNvSWFGTTA0QmxGdmk2NEl0Nmt5bEVROXpGakszVGUw?=
 =?utf-8?B?ZityTW00dTN4OXRuY2wrTVFERFI1R1VodFFkNDRGc240UVJxVkpJN290TGVG?=
 =?utf-8?B?Sk5NU1pCcDF5cWI1aGFTTHd1MlpGck1DY1ZNN0ZzamZVcTNCTUJORU1aSWpB?=
 =?utf-8?B?YTVKOW03dzRDNk0wcWMwdS9SSzA3TXZPVCtTUk5uMFh6Y3Z3cTVnNnB3WGNt?=
 =?utf-8?B?Y3pqdUxSQkcwQmVNcVBSRlFYQUY5aDc2SDNuaVVzT1hzK2NvbHVJNkNQRm4r?=
 =?utf-8?B?dEFOZmZwY0ZTMGVRVitkeFVPMTNxVXRrRHEvRXBkb1ZMckFWT0dBeE5PMkk3?=
 =?utf-8?B?TVhhamVIbzZTOHVVUjJRbFl3RFNWYzZiTWlCQTVocjB5VFNFSzdTUXp4cVlC?=
 =?utf-8?B?azdrZzBKU1IxT2hJSkNZZGJqeGpwZDlXZTJXaGNFL3QrUHZXNi9xeStlVzZW?=
 =?utf-8?B?RTBJTm02Rkh4S3lQSHBSVldqQ2dRUmxhKzB0SzVkNUI3c21wNU1mbFJhdjM1?=
 =?utf-8?B?NUJYTWJOVUUrMzVtMTFkYmZtYVQxZUlmOG1KdnRoSWZ1bldpTzdwY2xBNmRh?=
 =?utf-8?B?aFh3cXppUkR4b3dRSS9wbWVsN1RYUzRHMXBVWWw4ZStoTk1BOEpqdVdmRlhU?=
 =?utf-8?B?NVV2cDFzT3BWcjR2bG1GTFI2aTlHelhwcWtaUG8vbHJ6YW9acEdsR2Ztclhr?=
 =?utf-8?B?N0tON1Q4cFc3MEMyeGRDL3FBQTdkVllKdXpISlNrdVhrZDRFbE82NWpQdXVF?=
 =?utf-8?B?NHl5Z25PcHp2OXk0MlNjNmNIcENsTXFOdmxZQWQ4WnowTGtWR3RYMWRlaFg1?=
 =?utf-8?B?amxEWkZERjVyVWlzT3NKSjZWQjBKejZUVkJNbW9rSjhvemlpQ1FjQVFDSjF0?=
 =?utf-8?B?b0VMUWZyZVN6TkZYSWwyd2ZmRjlqNDFQd3RNMXB3VG5uYkEvRUdRV1A3VEk1?=
 =?utf-8?B?ZzJucktMWVBkYmVveE5KZlJPalBCcEhOOENTZW1zalVxTXpGSklJTXFFelBQ?=
 =?utf-8?B?ZzVPTkc0R3dvLzVseHhQeUNZNFF0MjMySS9IMnlZb0Vvdy9SYk1LNGI0WnJp?=
 =?utf-8?B?NEZsSFI0bVgyUDBkbE5CZ2pwRHhrbTVoemFiMlk5Q1Bodk1WSW1zNzBhVW00?=
 =?utf-8?B?VUZFcWFTeWliQkJoN25zRll5S2pMQVliUDY2bEx2RkViQUNwK2U0MS9lZ0tX?=
 =?utf-8?B?dlE4Z3VNNm9UK21mdnZvVHhyalBYVlhZcVVrbm5TTmFveVord01uUzc3aGdK?=
 =?utf-8?B?N0VxVXI4cG0vSUNhc24wOHg5VFhuejgzOUNpMDJEWk9yRDFxV3YzU3ZYNTgw?=
 =?utf-8?B?amIyeTd2bTFoZ2lCY0dUdG5aWU9WR1pTcjBXRklCS0ViOGlkdmFmb3AweHF1?=
 =?utf-8?Q?Q9pPfwWuiDm0Lk9DPtCvyyEIv6gJmtqxVa76iLF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5294CDD42335214FA71A1334D7A6EDD8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92bba6b3-6a9c-491e-e1b7-08d971deea26
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 09:07:27.3924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sWMAApXv0ofYfZSHYR7IdbA5Dr24P3Ssd/xx55njutynxSFuw13PnM9e16YiXhOJzbu2J2dvXHcllfkQMLKMxgzf96yrj/SeJEGKKeIpEzpEpJ+XFOM0Gy+PN4NvZoQw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6982
X-Proofpoint-GUID: fHIcg41XHYZlkLIiiZ7b4H4uxl28MIOu
X-Proofpoint-ORIG-GUID: fHIcg41XHYZlkLIiiZ7b4H4uxl28MIOu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_03,2021-09-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109070060

DQpPbiAwNy4wOS4yMSAxMTo0OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA3LjA5LjIwMjEg
MTA6MTgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDcuMDkuMjEgMTE6
MDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjA5LjIwMjEgMDk6NDMsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwNi4wOS4yMSAxNzo1NSwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+PiBPbiAwMy4wOS4yMDIxIDEyOjA4LCBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyB3cm90ZToNCj4+Pj4+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+Pj4+
Pj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4+IEBAIC04MTEsNiArODEx
LDE2IEBAIGludCB2cGNpX2Jhcl9hZGRfaGFuZGxlcnMoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwg
c3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+Pj4gICAgICAgICAgICAgZ3ByaW50ayhYRU5MT0df
RVJSLA0KPj4+Pj4+ICAgICAgICAgICAgICAgICAiJXBwOiBmYWlsZWQgdG8gYWRkIEJBUiBoYW5k
bGVycyBmb3IgZG9tJWRcbiIsICZwZGV2LT5zYmRmLA0KPj4+Pj4+ICAgICAgICAgICAgICAgICBk
LT5kb21haW5faWQpOw0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgIC8qDQo+Pj4+Pj4gKyAgICAgKiBS
ZXNldCB0aGUgY29tbWFuZCByZWdpc3RlcjogaXQgaXMgcG9zc2libGUgdGhhdCB3aGVuIHBhc3Np
bmcNCj4+Pj4+PiArICAgICAqIHRocm91Z2ggYSBQQ0kgZGV2aWNlIGl0cyBtZW1vcnkgZGVjb2Rp
bmcgYml0cyBpbiB0aGUgY29tbWFuZA0KPj4+Pj4+ICsgICAgICogcmVnaXN0ZXIgYXJlIGFscmVh
ZHkgc2V0LiBUaHVzLCBhIGd1ZXN0IE9TIG1heSBub3Qgd3JpdGUgdG8gdGhlDQo+Pj4+Pj4gKyAg
ICAgKiBjb21tYW5kIHJlZ2lzdGVyIHRvIHVwZGF0ZSBtZW1vcnkgZGVjb2RpbmcsIHNvIGd1ZXN0
IG1hcHBpbmdzDQo+Pj4+Pj4gKyAgICAgKiAoZ3Vlc3QncyB2aWV3IG9mIHRoZSBCQVJzKSBhcmUg
bGVmdCBub3QgdXBkYXRlZC4NCj4+Pj4+PiArICAgICAqLw0KPj4+Pj4+ICsgICAgcGNpX2NvbmZf
d3JpdGUxNihwZGV2LT5zYmRmLCBQQ0lfQ09NTUFORCwgMCk7DQo+Pj4+PiBDYW4geW91IHJlYWxs
eSBibGluZGx5IHdyaXRlIDAgaGVyZT8gV2hhdCBhYm91dCBiaXRzIHRoYXQgaGF2ZSB0byBiZQ0K
Pj4+Pj4gdW5kZXIgaG9zdCBjb250cm9sLCBlLmcuIElOVFhfRElTQUJMRT8gSSBjYW4gc2VlIHRo
YXQgeW91IG1heSB3YW50IHRvDQo+Pj4+PiBoYW5kIG9mZiB3aXRoIEkvTyBhbmQgbWVtb3J5IGRl
Y29kaW5nIG9mZiBhbmQgYnVzIG1hc3RlcmluZyBkaXNhYmxlZCwNCj4+Pj4+IGJ1dCBmb3IgZXZl
cnkgb3RoZXIgYml0IChpbmNsdWRpbmcgcmVzZXJ2ZWQgb25lcykgSSdkIGV4cGVjdCBzZXBhcmF0
ZQ0KPj4+Pj4ganVzdGlmaWNhdGlvbiAoaW4gdGhlIGNvbW1pdCBtZXNzYWdlKS4NCj4+Pj4gQWNj
b3JkaW5nIHRvICJQQ0kgTE9DQUwgQlVTIFNQRUNJRklDQVRJT04sIFJFVi4gMy4wIiBJIGhhdmUg
YXQgaGFuZCwNCj4+Pj4gc2VjdGlvbiAiNi4yLjIgRGV2aWNlIENvbnRyb2wiIHNheXMgdGhhdCB0
aGUgcmVzZXQgc3RhdGUgb2YgdGhlIGNvbW1hbmQNCj4+Pj4gcmVnaXN0ZXIgaXMgdHlwaWNhbGx5
IDAsIHNvIHRoaXMgaXMgd2h5IEkgY2hvc2UgdG8gd3JpdGUgMCBoZXJlLCBlLmcuDQo+Pj4+IG1h
a2UgdGhlIGNvbW1hbmQgcmVnaXN0ZXIgYXMgaWYgaXQgaXMgYWZ0ZXIgdGhlIHJlc2V0Lg0KPj4+
Pg0KPj4+PiBXaXRoIHJlc3BlY3QgdG8gaG9zdCBjb250cm9sOiB3ZSBjdXJyZW50bHkgZG8gbm90
IHJlYWxseSBlbXVsYXRlIGNvbW1hbmQNCj4+Pj4gcmVnaXN0ZXIgd2hpY2ggcHJvYmFibHkgd2Fz
IG9rIGZvciB4ODYgUFZIIERvbTAgYW5kIHRoaXMgbWlnaHQgbm90IGJlIHRoZQ0KPj4+PiBjYXNl
IG5vdyBhcyB3ZSBhZGQgRG9tVSdzLiBUaGF0IGJlaW5nIHNhaWQ6IGluIG15IGltcGxlbWVudGF0
aW9uIGd1ZXN0IGNhbg0KPj4+PiBhbHRlciBjb21tYW5kIHJlZ2lzdGVyIGFzIGl0IHdhbnRzIHdp
dGhvdXQgcmVzdHJpY3Rpb25zLg0KPj4+PiBJZiB3ZSBzZWUgaXQgZG9lcyBuZWVkIHByb3BlciBl
bXVsYXRpb24gdGhlbiB3ZSB3b3VsZCBuZWVkIGFkZGluZyB0aGF0IGFzDQo+Pj4+IHdlbGwgKGlz
IG5vdCBwYXJ0IG9mIHRoaXMgc2VyaWVzIHRob3VnaCkuDQo+Pj4+DQo+Pj4+IE1lYW53aGlsZSwg
SSBhZ3JlZSB0aGF0IHdlIGNhbiBvbmx5IHJlc2V0IElPIHNwYWNlLCBtZW1vcnkgc3BhY2UgYW5k
IGJ1cw0KPj4+PiBtYXN0ZXIgYml0cyBhbmQgbGVhdmUgdGhlIHJlc3QgdW50b3VjaGVkLiBCdXQg
YWdhaW4sIHdpdGhvdXQgcHJvcGVyIGNvbW1hbmQNCj4+Pj4gcmVnaXN0ZXIgZW11bGF0aW9uIGd1
ZXN0cyBjYW4gc3RpbGwgc2V0IHdoYXQgdGhleSB3YW50Lg0KPj4+IFllcywgd3JpdGVzIHRvIHRo
ZSByZWdpc3RlciB3aWxsIG5lZWQgZW11bGF0aW5nIGZvciBEb21VLg0KPj4gQnV0IHRoZW4gSSBh
bSB3b25kZXJpbmcgdG8gd2hhdCBleHRlbnQgd2UgbmVlZCB0byBlbXVsYXRlIHRoZSBjb21tYW5k
DQo+Pg0KPj4gcmVnaXN0ZXI/IFdlIGhhdmUgdGhlIGZvbGxvd2luZyBiaXRzIGluIHRoZSBjb21t
YW5kIHJlZ2lzdGVyOg0KPj4NCj4+ICNkZWZpbmXCoCBQQ0lfQ09NTUFORF9JT8KgwqDCoCDCoMKg
wqAgMHgxwqDCoMKgIC8qIEVuYWJsZSByZXNwb25zZSBpbiBJL08gc3BhY2UgKi8NCj4+ICNkZWZp
bmXCoCBQQ0lfQ09NTUFORF9NRU1PUlnCoMKgwqAgMHgywqDCoMKgIC8qIEVuYWJsZSByZXNwb25z
ZSBpbiBNZW1vcnkgc3BhY2UgKi8NCj4+ICNkZWZpbmXCoCBQQ0lfQ09NTUFORF9NQVNURVLCoMKg
wqAgMHg0wqDCoMKgIC8qIEVuYWJsZSBidXMgbWFzdGVyaW5nICovDQo+PiAjZGVmaW5lwqAgUENJ
X0NPTU1BTkRfU1BFQ0lBTMKgwqDCoCAweDjCoMKgwqAgLyogRW5hYmxlIHJlc3BvbnNlIHRvIHNw
ZWNpYWwgY3ljbGVzICovDQo+PiAjZGVmaW5lwqAgUENJX0NPTU1BTkRfSU5WQUxJREFURcKgwqDC
oCAweDEwwqDCoMKgIC8qIFVzZSBtZW1vcnkgd3JpdGUgYW5kIGludmFsaWRhdGUgKi8NCj4+ICNk
ZWZpbmXCoCBQQ0lfQ09NTUFORF9WR0FfUEFMRVRURSAweDIwwqDCoMKgIC8qIEVuYWJsZSBwYWxl
dHRlIHNub29waW5nICovDQo+PiAjZGVmaW5lwqAgUENJX0NPTU1BTkRfUEFSSVRZwqDCoMKgIDB4
NDDCoMKgwqAgLyogRW5hYmxlIHBhcml0eSBjaGVja2luZyAqLw0KPj4gI2RlZmluZcKgIFBDSV9D
T01NQU5EX1dBSVQgwqDCoMKgIDB4ODDCoMKgwqAgLyogRW5hYmxlIGFkZHJlc3MvZGF0YSBzdGVw
cGluZyAqLw0KPj4gI2RlZmluZcKgIFBDSV9DT01NQU5EX1NFUlLCoMKgwqAgMHgxMDDCoMKgwqAg
LyogRW5hYmxlIFNFUlIgKi8NCj4+ICNkZWZpbmXCoCBQQ0lfQ09NTUFORF9GQVNUX0JBQ0vCoMKg
wqAgMHgyMDDCoMKgwqAgLyogRW5hYmxlIGJhY2stdG8tYmFjayB3cml0ZXMgKi8NCj4+ICNkZWZp
bmXCoCBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUgMHg0MDAgLyogSU5UeCBFbXVsYXRpb24gRGlz
YWJsZSAqLw0KPj4NCj4+IFdlIHdhbnQgdGhlIGd1ZXN0IHRvIGFjY2VzcyBkaXJlY3RseSBhdCBs
ZWFzdCBJL08gYW5kIG1lbW9yeSBkZWNvZGluZyBhbmQgYnVzIG1hc3RlcmluZw0KPj4gYml0cywg
YnV0IGhvdyBkbyB3ZSBlbXVsYXRlIHRoZSByZXN0PyBEbyB5b3UgbWVhbiB3ZSBjYW4gbWF0Y2gg
dGhlIHJlc3QgdG8gd2hhdCBob3N0DQo+PiB1c2VzIGZvciB0aGUgZGV2aWNlLCBsaWtlIFBDSV9D
T01NQU5EX0lOVFhfRElTQUJMRSBiaXQ/IElmIHNvLCBhcyBwZXIgbXkgdW5kZXJzdGFuZGluZywN
Cj4+IHRob3NlIGJpdHMgZ2V0IHNldC9jbGVhcmVkIHdoZW4gYSBkZXZpY2UgaXMgZW5hYmxlZCwg
ZS5nLiBieSBMaW51eCBrZXJuZWwvZGV2aWNlIGRyaXZlciBmb3IgZXhhbXBsZS4NCj4gSSB3b3Vs
ZCBzdWdnZXN0IHRvIHRha2UgcWVtdSdzIGVtdWxhdGlvbiBhcyBhIHN0YXJ0aW5nIHBvaW50Lg0K
DQpTdXJlLCBJJ2xsIHRha2UgYSBsb29rIHdoYXQgUUVNVSBkb2VzLiBCdXQgSSBndWVzcyB0aGF0
IGVtdWxhdGlvbiBtYXkgZGVwZW5kDQoNCm9uIGhvc3QgYnJpZGdlIGVtdWxhdGlvbiBldGMuIHdo
aWNoIG1heSBub3QgYmUgYXBwbGljYWJsZSBmb3Igb3VyIGNhc2Ugd2l0aG91dA0KDQpzZXJpb3Vz
IGNvbXBsaWNhdGlvbnMuDQoNCj4NCj4+IFNvLCBpZiB3ZSBoYXZlIGEgaGlkZGVuIFBDSSBkZXZp
Y2Ugd2hpY2ggY2FuIGJlIGFzc2lnbmVkIHRvIGEgZ3Vlc3QgYW5kIGl0IGlzIGxpdGVyYWxseSB1
bnRvdWNoZWQNCj4+IChub3QgZW5hYmxlZCBpbiBEb20wKSB0aGVuIEkgdGhpbmsgdGhlcmUgd2ls
bCBiZSBubyBzdWNoIHJlZmVyZW5jZSBhcyAiaG9zdCBhc3NpZ25lZCB2YWx1ZXMiIGFzDQo+PiBt
b3N0IHByb2JhYmx5IHRoZSBjb21tYW5kIHJlZ2lzdGVyIHdpbGwgcmVtYWluIGluIGl0cyBhZnRl
ciByZXNldCBzdGF0ZS4NCj4gV2hhdCBtZWFuaW5nIG9mICJoaWRkZW4iIGRvIHlvdSBpbXBseSBo
ZXJlPyBEZXZpY2VzIHBhc3NlZCB0bw0KPiBwY2lfe2hpZGUscm99X2RldmljZSgpIG1heSBub3Qg
YmUgYXNzaWduZWQgdG8gZ3Vlc3RzIC4uLg0KWW91IGFyZSBjb21wbGV0ZWx5IHJpZ2h0IGhlcmUu
DQo+DQo+IEZvciBhbnkgb3RoZXIgbWVhbmluZyBvZiAiaGlkZGVuIiwgZXZlbiBpZiB0aGUgZGV2
aWNlIGlzIGNvbXBsZXRlbHkNCj4gaWdub3JlZCBieSBEb20wLA0KDQpEb20wbGVzcyBpcyBzdWNo
IGEgY2FzZSB3aGVuIGEgZGV2aWNlIGlzIGFzc2lnbmVkIHRvIHRoZSBndWVzdA0KDQp3aXRob3V0
IERvbTAgYXQgYWxsPw0KDQo+ICAgY2VydGFpbiBvZiB0aGUgcHJvcGVydGllcyBzdGlsbCBjYW5u
b3QgYmUgYWxsb3dlZA0KPiB0byBiZSBEb21VLWNvbnRyb2xsZWQuDQoNClRoZSBsaXN0IGlzIG5v
dCB0aGF0IGJpZywgY291bGQgeW91IHBsZWFzZSBuYW1lIGEgZmV3IHlvdSB0aGluayBjYW5ub3QN
Cg0KYmUgY29udHJvbGxlZCBieSBhIGd1ZXN0PyBJIGNhbiB0aGluayBvZiBQQ0lfQ09NTUFORF9T
UEVDSUFMKD8pLA0KDQpQQ0lfQ09NTUFORF9JTlZBTElEQVRFKD8pLCBQQ0lfQ09NTUFORF9QQVJJ
VFksIFBDSV9DT01NQU5EX1dBSVQsDQoNClBDSV9DT01NQU5EX1NFUlIsIFBDSV9DT01NQU5EX0lO
VFhfRElTQUJMRSB3aGljaCB3ZSBtYXkgd2FudCB0bw0KDQpiZSBhbGlnbmVkIHdpdGggdGhlICJo
b3N0IHJlZmVyZW5jZSIgdmFsdWVzLCBlLmcuIHdlIG9ubHkgYWxsb3cgdGhvc2UgYml0cw0KDQp0
byBiZSBzZXQgYXMgdGhleSBhcmUgaW4gRG9tMC4NCg0KPiAgIChJJ20gdGhlcmVmb3JlIG5vdCBz
dXJlIGluIGhvdyBmYXIgRG9tMCBjYW4NCj4gYWN0dWFsbHkgbGVnaXRpbWF0ZWx5ICJpZ25vcmUi
IGRldmljZXMuIEl0IG1heSBkZWNpZGUgdG8gbm90IGVuYWJsZQ0KPiB0aGVtLCBidXQgdGhhdCdz
IG5vdCAiaWdub3JpbmciLikNCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQoNCk9sZWtzYW5kcg0K

