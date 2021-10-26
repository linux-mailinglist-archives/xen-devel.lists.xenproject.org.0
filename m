Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8AA43B37A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 15:58:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216458.376082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfMy4-0003Jt-Fy; Tue, 26 Oct 2021 13:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216458.376082; Tue, 26 Oct 2021 13:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfMy4-0003GS-BE; Tue, 26 Oct 2021 13:58:20 +0000
Received: by outflank-mailman (input) for mailman id 216458;
 Tue, 26 Oct 2021 13:58:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93O1=PO=epam.com=prvs=093397e908=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mfMy3-0003GK-4H
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 13:58:19 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c564d932-3664-11ec-842f-12813bfff9fa;
 Tue, 26 Oct 2021 13:58:17 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QDsJR5002585; 
 Tue, 26 Oct 2021 13:58:15 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bxjy900ha-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 13:58:15 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4578.eurprd03.prod.outlook.com (2603:10a6:208:c9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Tue, 26 Oct
 2021 13:57:36 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.014; Tue, 26 Oct 2021
 13:57:35 +0000
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
X-Inumbo-ID: c564d932-3664-11ec-842f-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+erBh9SVxS+R0W2VO0m0tzDev03CKDFdMYg2WhIw6t/ZbhBxkUbM6ynwYngx/HAsA+/QLIihoyqqRTQpcyDbj1iNmOYQTctItvtXmhw5ViD/iWzy9bTyRJu+Mnf6cn4l+GEEsih4EFrKRKzQk1j3Ha6p3ugJ3Ru6efE1ALiHzizeaPvsxZjEKC1SOpO9Bh5GPWpFxicrQdAIONwpDDSaWDHMUqNP0f+SiWxDXgeKKUSP3ZzlRn/amCQI21wKqynv/rqUtCUkKof7f17XD0nkGXlG0eC81kJbFRSI+x+4k0MshTSl7oku4x2a8/iSwpnR0gLc6Xr4OUwpww4oGApBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIb7s5kCOSYjtnadfaRWim3gDZNecKxjxc4SqU6Yfb8=;
 b=Ufpqz5Frt9ERLiqw+5xauGog1s+roti170DWZHqzycAYrc4TVJunAYuCzZgZPZiwOpo5N795ht/o4pjDiwByymNvGCQzZlEJX7ZVBsY/JEbEWS10SyZ4sC26USAKQxmZVw78kVYUwvgkBG/aXgln2Gby9uzNzsLbY/ULfPme8Zr1eAxIN6b1VnErR0p59Fe0095armoVZOHkfvl/SsrTjKlFhFE9B8CAcd6I90brtkVR29O+IBMaqFbF8etUaGYxSKSMOOpbXEFy55wCpFd0FqPMlV8+DmZVvpbNodv9k1qwb7bLJfCtokOQ9KcwprMCbB65lx6cKfvAACc6LieFlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIb7s5kCOSYjtnadfaRWim3gDZNecKxjxc4SqU6Yfb8=;
 b=Vd3MWxJ6W0o9jj3+jRTbkkOlm2oJu+AJXX7j1TaSyRSrns5lPZr0GaVWRtCP8bvzUMEyQXantvSUf9oB7Hh6qOuAChuPLK8qAdXHPYnVs7vnuhTE9uXpvCy0jyAdOsi+H+PxC4F4KFT2c8btBZrbnO+bxMIkGxyYuLhAKupYHggZnR4y9zWNq1uTWepOeSNGM2kCBIWpRX4aU8JFHgHeyX62IKmvwbN4Ocq4AIUk3QfA5cBISAcCwSmPcAkX2UQGdpmImvLPFGM0z1xckwMIIRshHyTaBd+KwuLMvRNBvIiMjMkLT8AtCFCDErzH8JI6evzYSLfbYhUr3MvGm0hAlw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
Thread-Topic: [PATCH v3 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
Thread-Index: AQHXtdAlBwDHpaYUBUq6q0PlsxoTp6vlb5WAgAAHpYA=
Date: Tue, 26 Oct 2021 13:57:35 +0000
Message-ID: <6ce216ce-d25f-5016-3752-79b90a1112af@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-12-andr2000@gmail.com>
 <YXgC5QB2MDZlZeEZ@MacBook-Air-de-Roger.local>
In-Reply-To: <YXgC5QB2MDZlZeEZ@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2c91701-21e4-4b45-2090-08d9988890ae
x-ms-traffictypediagnostic: AM0PR03MB4578:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4578553CC8319A8B65F5889AE7849@AM0PR03MB4578.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 k95kOkoYKwtkiokk50+LdiOXowhXlHaUwEKgT0r/u5lRSdamKtOh4x1gTfRspC1guAyYjsGuhXW0yzoWacM57gl5KooS9XIJU9TpjHWCiwu/K9iiGwUDNnByNwLtIxa0JdixSXDB7Br0mCY3AeI57W5D379osn6RuLtMvYNDvRxxPoRwQrD8xO73fOeOEfpt9s+cP089OrNBdyzk1ya6QCUdJ9Jdjrya6RXS8Ik1TzoK+fWG2RSSlDyEixLSDw+gUx8ld15hBQe2Yts5n53u/CS1bTIz//v8cxfCvpMKx57H5mu67qf+9pTaEGphqJ/hKvvj/DE9477GOzLjUV0hAiJCPBJjjZxj1Yh3dc3VNEFH2eyC6q6bN12OTmGjNf9N4LGWKhplUc5TjAF1Z4+EnKOsaEF+Gv2+cORFp9D98pOri7EkdN9W0f+V5He4tWl95d5exRK5QPIye/doTm6mNOae1Rhs41If64N5x7GzrmxqV4q2BJGNX5SeBPNX6vqm1tVg7IUn3N9+09919/+PRW4fS+fyrMpcGhuztpVTUCrX+XJjMfiOX3kRH2n5w7cbWPxJECbKxfgL9cFJjWqVbaXuMReI0ZXixlaOtcUupYLN0IzkhcfEZ9WKDp7P8lJWQ0s9ZWTf8Hja4kctQTCdJgvgxVg7HDfy3OaD93hFHJiEA5KkvE+KsbyGRZ79XIAvEiOjkcyoEBcGP9Ou/+IywLx0Z/9lLzJl/AgZYX8+Rlbj8Ysvo7B/cmlYZRwld/pzCd6Ld1RWw3m7V8+1T96dU6npNpoI15Cl11QIc4hXN5Q3i64AMMStm4QLku2K/9DzilxiA45X9p7+mRIXBy2ZRg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(107886003)(2906002)(54906003)(71200400001)(36756003)(6512007)(2616005)(508600001)(8676002)(66556008)(316002)(83380400001)(966005)(26005)(53546011)(4326008)(8936002)(66446008)(31696002)(38070700005)(86362001)(91956017)(31686004)(5660300002)(6916009)(76116006)(66946007)(122000001)(38100700002)(186003)(66476007)(6506007)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MUxrUlJKbFZSVEJEMXB3Yk5zWlB2M1hLL1ZGemI0cjA5U1JaOUMxbVoreURx?=
 =?utf-8?B?S0IrYS9BaXljUnpiTDNhKzNWUlNuN0Fwam01bXErd1ZIMG1pRzRFUWk4TzJW?=
 =?utf-8?B?NldOM3prd3dSOVhtcnE3SGhEblIxTWNud1pxME9JdFpaZWtXamNVMEN0eHQ2?=
 =?utf-8?B?ZzVhME9URFVzNTJzZ0FHMzRTV0luZGhvWWdEbE93UG1KQ3hpZWFXODlrUllx?=
 =?utf-8?B?eXcxdXY5cVRoMkRENGNFZXN1ek96QmI0U01scFR1RER3elptOVFjUkE0YlNW?=
 =?utf-8?B?cGhQQnRaV0JoUk5xRXkrVk1EZ1BrKzgvcjFzMHBudGp0VW9YUWJTUkcxNmZK?=
 =?utf-8?B?SDV3MDQwSVpCU2ozaXpCOGZxVW9DVUwrSXRESUorWnFyRXBMZ0pIUnd0eElu?=
 =?utf-8?B?NjhVTWM0N2o2OVY4Z3gxQ2VKMXV0Myt4dXdsSWRPVzRKR1VzUFVaUGYyM3Y4?=
 =?utf-8?B?Q2JUWlJXMm9zLzBtVkcvdDhRQXlKbEY1Y0FTRmFMaXdsSWRrY3J2M1NYZ2dF?=
 =?utf-8?B?MGtwU2Zmdi9YMkdtVEEweEpSTCt0VnJMZVVnZFpFeEF2NCs5TUpkOVZxeSt2?=
 =?utf-8?B?Vm1JN2J5NFF3ZjVmWXJkZDRwd0Q1T0VUbHNTVEVpTktkald3RFgxQUtsWCtY?=
 =?utf-8?B?ZUlTdUVVU053ajFVb3FDZFZhblkvcloxbHo1WE52M3RsNkkzQzhWS29FbFoz?=
 =?utf-8?B?TXpmTTN4UXYrSkpkMWh1TncrYytCMWo5cEtFTlFLQ2pRMFBGcHNhR21xbklJ?=
 =?utf-8?B?bzBNNDFiQVA3M3RHQ2VKQis1dWd2c2U1c0t3aGU4UHVTS0o0SlNRNy9LdVNr?=
 =?utf-8?B?VTNsMHlzUFB1YmViWXBBTS85clIvamU3bHZwMGk1UWYzRG4rQzlrSTVkMnNv?=
 =?utf-8?B?UTRJWmYvdU9hZElTbXdtUWQyU1d1blpmRWIyUkEycVZlVUhOODZUT2QrQjlr?=
 =?utf-8?B?ZmZOUUJvdkRhWlc1M1hxTHYxRjZxZkJkelMxTG9qNlBYa2NYRUZMZVNKbEF4?=
 =?utf-8?B?N2RhcFV0UWV6aHIreHpzaHV3V0owT2QvTmRWbFZzNXRQWGI1ejBQa2tKa2JZ?=
 =?utf-8?B?SnhOa0RSdFFLNVFpSkZlZGJEcW5yblovYXQwVGVzYzZvWVpGMkJCQ3g3RDhL?=
 =?utf-8?B?aWpzbG8xMnVjMk5aM3FHU2Iwb3dxZXQ1aVB2UDh6RW82bVY4aDN2TGI4NzNv?=
 =?utf-8?B?YTBsbG1Pb0ZGbDZIVzJKWVg0VGY2L0J0OCsyOVhLR0ZMUFpqVkdRL2U3NUZ5?=
 =?utf-8?B?VjZlekxCL1IxNitoK2IvYSs5SXZwUGtDRS92TEQ2bFdGalQ5MnUybmRVUXlk?=
 =?utf-8?B?NkxvOUZGblI5N0xvSW1vajZSdDhwNFVBMk1MZzdGMGZvaVlWTWQ2Q1JoTm5r?=
 =?utf-8?B?WmgyelVZemgwMkJmWkdUZXl2cDkzVy9ORFE3R0UrK014MHpqb2RmTHJLclAz?=
 =?utf-8?B?M3RnVHdQWUJQbWllV2VHekI2TDNJeWtxdkNsRVgvQ2RBeXRsTkpuVm91WlJx?=
 =?utf-8?B?YmFENkI5ODFGSTdsRzlkTUFFeXltbmpSYjJzMnllT3ZUMFE0YnZJaG5tanlI?=
 =?utf-8?B?NldIdjZScjBEelB5ZzJ2K0xKQ3p4Z1dWYkM5TFlGTUhTbHlpT2ZCbXE0RlZZ?=
 =?utf-8?B?eHRSQzZialdERmllQkVvZWx0citmdU0vSStzdkp4SUtzaUdCOXdRSngwVlBu?=
 =?utf-8?B?azlSWStiMmxxb2lNcitkY1lnTUFNMTRtcmVIcmZvTmt2TWwzSDlsSEM2YTlE?=
 =?utf-8?B?NEN1WHJvejVjQ0E4RENmZy9uZlVkNUx3SE45ZDMrRlVUeGUrTDcyeWRZQkMz?=
 =?utf-8?B?UHYyT1p1MDRuL0xvMWZReDhsM21tcnhmWTRvSmFJRXVBVXZHWXlaNGo1OXMy?=
 =?utf-8?B?eW9lVkk3MUIzVnJzbEkyV0NrWUJpUlpSR3NyWXVTanlSVkgyZ1pZY0FhZXlP?=
 =?utf-8?B?TmE4NXZVaEVKU1lKSEV6TXRCU2l5bTJEaGNRbzVWN05oSFlDQTAyeXZqU0dn?=
 =?utf-8?B?TnpYUHNadnVTeTVJNTcwZVZqVkt6V1VwdGphRm1PUGFjNXdySm1pVGpia2V1?=
 =?utf-8?B?c3laUjlwZ1R6Q015R010VjFLTElRUDg0SU9wWFRyemNKYy83VVdET0t1YUds?=
 =?utf-8?B?V2Jha2cydTI1VGNGSysrRm92Q2Z4dWd0WGlPM2lhalZUL3p1cUVnaSttb2VH?=
 =?utf-8?B?ZmZJVjZ2N1UwU2NiRmN5WjJ4dHdZeUg1bG5TMHBqbUNYWHo2SmVadGc2NC9w?=
 =?utf-8?B?Rko1Z0xaRjI0MHNBMy8yR0k0bDNzcElra09pWVZmM3B6SXNUOVgxdVhYWGY4?=
 =?utf-8?B?b1RDTzhlRzIyRmJOR0N4MmlaQjJJcWxRRkUwUnVURjQwWWs1N0k0UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13294A9FFBEB5342A4E9A3B64211B394@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c91701-21e4-4b45-2090-08d9988890ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2021 13:57:35.8536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TmPyj8Fit9v1P6lBXSmgP92ZcwWnqu5v13HP1AyHy34mtGpCKahTVswp/76Dfvu5EdvyGQkb8Uk47kotB53m7VLZor3j7uZLQLs0Hw5OnnAlfQuozVi3FTVTbHrFaA9T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4578
X-Proofpoint-GUID: 3HBXLBYmg9d-AYtM2bGv6zZZabRw2C87
X-Proofpoint-ORIG-GUID: 3HBXLBYmg9d-AYtM2bGv6zZZabRw2C87
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_04,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110260081

SGksIFJvZ2VyIQ0KDQpPbiAyNi4xMC4yMSAxNjozMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW4uYyBiL3hlbi9hcmNoL2FybS9kb21h
aW4uYw0KPj4gaW5kZXggZmE2ZmNjNWU0NjdjLi4wOTU2NzE3NDJhZDggMTAwNjQ0DQo+PiAtLS0g
YS94ZW4vYXJjaC9hcm0vZG9tYWluLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW4uYw0K
Pj4gQEAgLTc5Nyw2ICs3OTcsNyBAQCB2b2lkIGFyY2hfZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRv
bWFpbiAqZCkNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBnZXRfb3JkZXJfZnJvbV9ieXRl
cyhkLT5hcmNoLmVmaV9hY3BpX2xlbikpOw0KPj4gICAjZW5kaWYNCj4+ICAgICAgIGRvbWFpbl9p
b19mcmVlKGQpOw0KPj4gKyAgICBkb21haW5fdnBjaV9mcmVlKGQpOw0KPiBJdCdzIGEgbml0LCBi
dXQgSSB0aGluayBmcm9tIGEgbG9naWNhbCBQb1YgdGhpcyBzaG91bGQgYmUgaW52ZXJ0ZWQ/DQo+
IFlvdSBmaXJzdCBmcmVlIHRoZSBoYW5kbGVycyBhbmQgdGhlbiB0aGUgSU8gaW5mcmFzdHJ1Y3R1
cmUuDQpJbmRlZWQsIHRoYW5rcw0KPg0KPj4gICB9DQo+PiAgIA0KPj4gICB2b2lkIGFyY2hfZG9t
YWluX3NodXRkb3duKHN0cnVjdCBkb21haW4gKmQpDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL3ZwY2kuYyBiL3hlbi9hcmNoL2FybS92cGNpLmMNCj4+IGluZGV4IDVkNmMyOWM4ZGNkOS4u
MjZlYzJmYTdjZjJkIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4gKysr
IGIveGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4gQEAgLTE3LDYgKzE3LDE0IEBADQo+PiAgIA0KPj4g
ICAjZGVmaW5lIFJFR0lTVEVSX09GRlNFVChhZGRyKSAgKCAoYWRkcikgJiAweDAwMDAwZmZmKQ0K
Pj4gICANCj4+ICtzdHJ1Y3QgdnBjaV9tbWlvX3ByaXYgew0KPj4gKyAgICAvKg0KPj4gKyAgICAg
KiBTZXQgdG8gdHJ1ZSBpZiB0aGUgTU1JTyBoYW5kbGVycyB3ZXJlIHNldCB1cCBmb3IgdGhlIGVt
dWxhdGVkDQo+PiArICAgICAqIEVDQU0gaG9zdCBQQ0kgYnJpZGdlLg0KPj4gKyAgICAgKi8NCj4+
ICsgICAgYm9vbCBpc192aXJ0X2VjYW07DQo+PiArfTsNCj4gSXMgdGhpcyBzdHJpY3RseSByZXF1
aXJlZD8gSXQgZmVlbHMgYSBiaXQgb2RkIHRvIGhhdmUgYSBzdHJ1Y3R1cmUgdG8NCj4gc3RvcmUg
YW5kIHNpbmdsZSBib29sZWFuLg0KPg0KPiBJIHRoaW5rIHlvdSBjb3VsZCByZXBsYWNlIGl0J3Mg
dXNhZ2Ugd2l0aCBpc19oYXJkd2FyZV9kb21haW4uDQpJIGFtIHdvcmtpbmcgb24gc29tZSAiZWFy
bGllciIgcGF0Y2ggZml4ZXMgWzFdIHdoaWNoIGFscmVhZHkgbmVlZHMgc29tZSBwcml2YXRlDQp0
byBiZSBwYXNzZWQgdG8gdGhlIGhhbmRsZXJzOiB3ZSBuZWVkIHRvIHNldCBzYmRmLnNlZyB0byB0
aGUgcHJvcGVyDQpob3N0IGJyaWRnZSBzZWdtZW50IGluc3RlYWQgb2YgYWx3YXlzIHNldHRpbmcg
aXQgdG8gMC4NCkFuZCB0aGVuIEkgY2FuIHBhc3MgInN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJy
aWRnZSIgYXMgdGhlIHByaXZhdGUgbWVtYmVyDQphbmQgdXNlIGlzX2hhcmR3YXJlX2RvbWFpbih2
LT5kb21haW4pIHRvIHNlZSBpZiB0aGlzIGlzIGd1ZXN0IG9yIGh3ZG9tLg0KU28sIEknbGwgcmVt
b3ZlIHRoZSBzdHJ1Y3R1cmUgY29tcGxldGVseQ0KDQpbc25pcF0NCg0KPj4gKyAqLw0KPj4gICBz
dGF0aWMgaW50IHZwY2lfc2V0dXBfbW1pb19oYW5kbGVyKHN0cnVjdCBkb21haW4gKmQsDQo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBjaV9ob3N0X2JyaWRn
ZSAqYnJpZGdlKQ0KPj4gICB7DQo+PiAtICAgIHN0cnVjdCBwY2lfY29uZmlnX3dpbmRvdyAqY2Zn
ID0gYnJpZGdlLT5jZmc7DQo+PiArICAgIHN0cnVjdCB2cGNpX21taW9fcHJpdiAqcHJpdjsNCj4+
ICsNCj4+ICsgICAgcHJpdiA9IHh6YWxsb2Moc3RydWN0IHZwY2lfbW1pb19wcml2KTsNCj4+ICsg
ICAgaWYgKCAhcHJpdiApDQo+PiArICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4+ICsNCj4+ICsg
ICAgcHJpdi0+aXNfdmlydF9lY2FtID0gIWlzX2hhcmR3YXJlX2RvbWFpbihkKTsNCj4+ICAgDQo+
PiAtICAgIHJlZ2lzdGVyX21taW9faGFuZGxlcihkLCAmdnBjaV9tbWlvX2hhbmRsZXIsDQo+PiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICBjZmctPnBoeXNfYWRkciwgY2ZnLT5zaXplLCBOVUxM
KTsNCj4+ICsgICAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4oZCkgKQ0KPj4gKyAgICB7DQo+PiAr
ICAgICAgICBzdHJ1Y3QgcGNpX2NvbmZpZ193aW5kb3cgKmNmZyA9IGJyaWRnZS0+Y2ZnOw0KPj4g
Kw0KPj4gKyAgICAgICAgYnJpZGdlLT5tbWlvX3ByaXYgPSBwcml2Ow0KPj4gKyAgICAgICAgcmVn
aXN0ZXJfbW1pb19oYW5kbGVyKGQsICZ2cGNpX21taW9faGFuZGxlciwNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjZmctPnBoeXNfYWRkciwgY2ZnLT5zaXplLA0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHByaXYpOw0KPj4gKyAgICB9DQo+PiArICAgIGVsc2UN
Cj4+ICsgICAgew0KPj4gKyAgICAgICAgZC0+dnBjaV9tbWlvX3ByaXYgPSBwcml2Ow0KPj4gKyAg
ICAgICAgLyogR3Vlc3QgZG9tYWlucyB1c2Ugd2hhdCBpcyBwcm9ncmFtbWVkIGluIHRoZWlyIGRl
dmljZSB0cmVlLiAqLw0KPj4gKyAgICAgICAgcmVnaXN0ZXJfbW1pb19oYW5kbGVyKGQsICZ2cGNp
X21taW9faGFuZGxlciwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHVUVTVF9W
UENJX0VDQU1fQkFTRSwgR1VFU1RfVlBDSV9FQ0FNX1NJWkUsDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcHJpdik7DQo+PiArICAgIH0NCj4+ICAgICAgIHJldHVybiAwOw0KPj4g
ICB9DQo+PiAgIA0KPj4gQEAgLTk1LDE0ICsxNTQsMjUgQEAgaW50IGRvbWFpbl92cGNpX2luaXQo
c3RydWN0IGRvbWFpbiAqZCkNCj4+ICAgICAgIGlmICggIWhhc192cGNpKGQpICkNCj4+ICAgICAg
ICAgICByZXR1cm4gMDsNCj4+ICAgDQo+PiArICAgIHJldHVybiBwY2lfaG9zdF9pdGVyYXRlX2Jy
aWRnZXMoZCwgdnBjaV9zZXR1cF9tbWlvX2hhbmRsZXIpOw0KPiBJIHRoaW5rIHRoaXMgaXMgd3Jv
bmcgZm9yIHVucHJpdmlsZWdlZCBkb21haW5zOiB5b3UgaXRlcmF0ZSBhZ2FpbnN0DQo+IGhvc3Qg
YnJpZGdlcyBidXQganVzdCBzZXR1cCBhIHNpbmdsZSBFQ0FNIHJlZ2lvbiBmcm9tDQo+IEdVRVNU
X1ZQQ0lfRUNBTV9CQVNFIHRvIEdVRVNUX1ZQQ0lfRUNBTV9TSVpFLCBzbyB5b3UgYXJlIGxlYWtp
bmcNCj4gbXVsdGlwbGUgYWxsb2NhdGlvbnMgb2YgdnBjaV9tbWlvX3ByaXYsIGFuZCBhbHNvIGFk
ZGluZyBhIGJ1bmNoIG9mDQo+IGR1cGxpY2F0ZWQgSU8gaGFuZGxlcnMgZm9yIHRoZSBzYW1lIEVD
QU0gcmVnaW9uLg0KPg0KPiBJTU8geW91IHNob3VsZCBpdGVyYXRlIGFnYWluc3QgaG9zdCBicmlk
Z2VzIG9ubHkgZm9yIHRoZSBoYXJkd2FyZQ0KPiBkb21haW4gY2FzZS4gRm9yIHRoZSB1bnByaXZp
bGVkZ2VkIGRvbWFpbiBjYXNlIHRoZXJlJ3Mgbm8gbmVlZCB0bw0KPiBpdGVyYXRlIGFnYWluc3Qg
dGhlIGxpc3Qgb2YgcGh5c2ljYWwgaG9zdCBicmlkZ2VzIGFzIHlvdSBlbmQgdXANCj4gZXhwb3Np
bmcgYSBmdWxseSBlbXVsYXRlZCBidXMgd2hpY2ggYmVhcnMgbm8gcmVzZW1ibGFuY2UgdG8gdGhl
DQo+IHBoeXNpY2FsIHNldHVwLg0KWWVzLCBJIGFtIG1vdmluZyB0aGlzIGNvZGUgaW50byB0aGF0
ICJlYXJsaWVyIiBwYXRjaCBbMV0gYW5kIGFscmVhZHkNCnNwb3R0ZWQgdGhlIGxlYWs6IHRodXMg
SSBhbSBhbHNvIHJlLXdvcmtpbmcgdGhpcyBjb2RlLg0KPg0KPj4gK30NCj4+ICsNCj4+ICtzdGF0
aWMgaW50IGRvbWFpbl92cGNpX2ZyZWVfY2Ioc3RydWN0IGRvbWFpbiAqZCwNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqYnJpZGdlKQ0K
Pj4gK3sNCj4+ICAgICAgIGlmICggaXNfaGFyZHdhcmVfZG9tYWluKGQpICkNCj4+IC0gICAgICAg
IHJldHVybiBwY2lfaG9zdF9pdGVyYXRlX2JyaWRnZXMoZCwgdnBjaV9zZXR1cF9tbWlvX2hhbmRs
ZXIpOw0KPj4gKyAgICAgICAgWEZSRUUoYnJpZGdlLT5tbWlvX3ByaXYpOw0KPj4gKyAgICBlbHNl
DQo+PiArICAgICAgICBYRlJFRShkLT52cGNpX21taW9fcHJpdik7DQo+PiArICAgIHJldHVybiAw
Ow0KPj4gK30NCj4+ICAgDQo+PiAtICAgIC8qIEd1ZXN0IGRvbWFpbnMgdXNlIHdoYXQgaXMgcHJv
Z3JhbW1lZCBpbiB0aGVpciBkZXZpY2UgdHJlZS4gKi8NCj4+IC0gICAgcmVnaXN0ZXJfbW1pb19o
YW5kbGVyKGQsICZ2cGNpX21taW9faGFuZGxlciwNCj4+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgIEdVRVNUX1ZQQ0lfRUNBTV9CQVNFLCBHVUVTVF9WUENJX0VDQU1fU0laRSwgTlVMTCk7DQo+
PiArdm9pZCBkb21haW5fdnBjaV9mcmVlKHN0cnVjdCBkb21haW4gKmQpDQo+PiArew0KPj4gKyAg
ICBpZiAoICFoYXNfdnBjaShkKSApDQo+PiArICAgICAgICByZXR1cm47DQo+PiAgIA0KPj4gLSAg
ICByZXR1cm4gMDsNCj4+ICsgICAgcGNpX2hvc3RfaXRlcmF0ZV9icmlkZ2VzKGQsIGRvbWFpbl92
cGNpX2ZyZWVfY2IpOw0KPiBXaHkgZG8gd2UgbmVlZCB0byBpdGVyYXRlIHRoZSBob3N0IGJyaWRn
ZXMgZm9yIHVucHJpdmlsZWdlZCBkb21haW5zPw0KTm8gbmVlZCwgSSBhbSB0YWtpbmcgY2FyZSBv
ZiB0aGlzDQo+IEFGQUlDVCBpdCBqdXN0IGNhdXNlcyBkdXBsaWNhdGVkIGNhbGxzIHRvIFhGUkVF
KGQtPnZwY2lfbW1pb19wcml2KS4gSQ0KPiB3b3VsZCBleHBlY3Qgc29tZXRoaW5nIGxpa2U6DQo+
DQo+IHN0YXRpYyBpbnQgYnJpZGdlX2ZyZWVfY2Ioc3RydWN0IGRvbWFpbiAqZCwNCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqYnJpZGdlKQ0KPiB7
DQo+ICAgICAgQVNTRVJUKGlzX2hhcmR3YXJlX2RvbWFpbihkKSk7DQo+ICAgICAgWEZSRUUoYnJp
ZGdlLT5tbWlvX3ByaXYpOw0KPiAgICAgIHJldHVybiAwOw0KPiB9DQo+DQo+IHZvaWQgZG9tYWlu
X3ZwY2lfZnJlZShzdHJ1Y3QgZG9tYWluICpkKQ0KPiB7DQo+ICAgICAgaWYgKCAhaGFzX3ZwY2ko
ZCkgKQ0KPiAgICAgICAgICByZXR1cm47DQo+DQo+ICAgICAgaWYgKCBpc19oYXJkd2FyZV9kb21h
aW4oZCkgKQ0KPiAgICAgICAgICBwY2lfaG9zdF9pdGVyYXRlX2JyaWRnZXMoZCwgYnJpZGdlX2Zy
ZWVfY2IpOw0KPiAgICAgIGVsc2UNCj4gICAgICAgICAgWEZSRUUoZC0+dnBjaV9tbWlvX3ByaXYp
Ow0KPiB9DQo+DQo+IEFsYmVpdCBJIHRoaW5rIHRoZXJlJ3Mgbm8gbmVlZCBmb3IgdnBjaV9tbWlv
X3ByaXYgaW4gdGhlIGZpcnN0IHBsYWNlLg0KPg0KPiBUaGFua3MsIFJvZ2VyLg0KVGhhbmsgeW91
LA0KT2xla3NhbmRyDQoNClsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3Qv
eGVuLWRldmVsL3BhdGNoLzIwMjExMDA4MDU1NTM1LjMzNzQzNi05LWFuZHIyMDAwQGdtYWlsLmNv
bS8=

