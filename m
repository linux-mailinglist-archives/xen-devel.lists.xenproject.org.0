Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2174170F8
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 13:38:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195330.347992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTjXB-0007bH-F2; Fri, 24 Sep 2021 11:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195330.347992; Fri, 24 Sep 2021 11:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTjXB-0007ZM-Ba; Fri, 24 Sep 2021 11:38:29 +0000
Received: by outflank-mailman (input) for mailman id 195330;
 Fri, 24 Sep 2021 11:38:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Coby=OO=epam.com=prvs=9901c588ba=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mTjXA-0007ZA-Il
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 11:38:28 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eedd39fa-1d2b-11ec-bac2-12813bfff9fa;
 Fri, 24 Sep 2021 11:38:27 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18OAO96Z019791; 
 Fri, 24 Sep 2021 11:38:26 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 by mx0a-0039f301.pphosted.com with ESMTP id 3b9cvy8e3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 11:38:25 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5939.eurprd03.prod.outlook.com (2603:10a6:208:15e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 11:38:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 11:38:22 +0000
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
X-Inumbo-ID: eedd39fa-1d2b-11ec-bac2-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpNYp0N5ejI+ACQ5gdG3WqDY116mkchXXi4mtqmP9YDrDfabvatVnRAqd3g+2CfvvaG3gzdz0hPS8GMuOTG5ZNReMo9llErhWYIEZ1zwQ60IFN9UjmauO/WabCqmNvbzta5rx7sWwrqAvrqs3JSeuZK6sdGfBai5Hnk8zlrH64DWKITipDCTvhJP61vBu6h5JTwZOmuImXHA8VIBfCHxiKrOzidAWo6HkzgA4VE9kBhHoI3HyXx/B83BH55tMYbG5ZJZLP5kMM9BpeREdh0HP7MsPB8PwfHFVMDNu4AZyfHlUCXaiXRET1z4zU6OtR/erUvrWM00P7tqKYyWqCNlDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=IOmFWBEPT++RtLjxPBdbE8hk0xmS1z+BauBEJuz3d40=;
 b=WSOmVbdeOk3sSmGkYwWheHNEgNiHRrqUSYL93YubqiNiAbERae8cx2NOXNbhqzOk/ExikaE0v0AOiHEcPIEplUq1hylXqFBkHXPviTQWp2YXh/cOl3TYynusdpsVXbWI3KIqno1SiXVX/OHFaPBSuTu+w5PInMDheIdDSC+FS8Y2w964EIrhIP7AlkJ5PjyHE2d3B5q0BpHWrwlTf2SNvPuQsej1LCXq9D+hO7Hj7Ac63NvnD2uNgS8QztdiTAf8BR209KEp2MrC+JV2RnxBwVYU7ssEpmdOeQwS8VVJRaF8wqo8M4MD0kG371Jiql78dw1g7HDhRruYFgEE5zJQKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOmFWBEPT++RtLjxPBdbE8hk0xmS1z+BauBEJuz3d40=;
 b=2JrtRI2eV5kn0yKO98C3iLKblqps0BDZSeX/2c3Zp3g3MEqWtQhiuB63E2PGRsu011cVrw/iG5CIw3L9Gsbj1Qyf5Uo0ut31eL1Ow+GIq1+F0Cr7L/JJgIFV1OSSTWS0n3sDVnvWFYvtZ0HrolVovfS3N1yN2TGg90ZMWNhTRnPA4Rshc2D8u3jDErTAeljrP8WRjj+cMCOhtVdttmI58G7M8MgGfDpY3z+eUngxfgNgxcxojSHdr89dh2HGtpAeFa6HdHpAiZqPWZ2KSnQN4nnpXY1e7ulPVzbXyNkHZd2GrBagYp2DxcuXnM7eXdvOPr2pFI/8Bizj8GBsX3+1mA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
        "jgross@suse.com"
	<jgross@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
        "julien@xen.org"
	<julien@xen.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Anastasiia
 Lukianenko <Anastasiia_Lukianenko@epam.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 2/2] xen-pciback: allow compiling on other archs than
 x86
Thread-Topic: [PATCH v3 2/2] xen-pciback: allow compiling on other archs than
 x86
Thread-Index: AQHXsGDrkewW5NG+ZkqXauJ2P2aIyauyCpkAgACjoYCAAGJfAA==
Date: Fri, 24 Sep 2021 11:38:22 +0000
Message-ID: <7310d23e-4193-3f4c-06da-606b30e73f24@epam.com>
References: <20210923095345.185489-1-andr2000@gmail.com>
 <20210923095345.185489-2-andr2000@gmail.com>
 <alpine.DEB.2.21.2109231252270.17979@sstabellini-ThinkPad-T480s>
 <f62a1e2c-4253-c998-c206-6bb0681a84fb@epam.com>
In-Reply-To: <f62a1e2c-4253-c998-c206-6bb0681a84fb@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc37a11a-0a6b-4031-db13-08d97f4fd08b
x-ms-traffictypediagnostic: AM0PR03MB5939:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB5939AE8DC12BA434BA13BEEEE7A49@AM0PR03MB5939.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TBSm1sZMWUHxVNKI1dhZnri7HvMHKM7Xpp2ekkCt2CSZR+Sx8tz4ztnYg6FhuwL1uBQFHEehYh1TSgpEhfzfcMMDWeBpqqV2+bDQ3qpidvbiXSsZI+ZTDgp/YcbZ7N/9iNgVxV4b6+aPnd75Eh8G4wq52vVPt2aETg+5HKEmgCm4dwrWQsSosKwstUKP309KbFaOCIWXHmXkcgut8xaWyAq4nu0ZWfOoDMTsAfDKA2Cr60rSEj7SN3O+t183kHSStl44MkyG1pNLpGdtZnNxv2bfV7ig5nicWIXeXAMWoY7DrFVzotMAxi+BZ5dRaQ01fdpJFgnDYJUNf/SlDNYlXT4Oi1AcCbxeTsGGp3gJ0RT4Hfp5fbzWII1/bKo0vz1AheAf9A/2HNYXaZZCRSwjfnzBsROfOHy4KVnYx69rP2fuXbSB18GjkB7pIIVuZfXSsrJdnq1ndfrO1RfbyPzMxyP5A1KLV0DW6+ePg2tRe3sxqCPavkSeDU+2HxQ2lmAfUFB4BAVL29uoTv6Yr49h/U3Mab6p5V+9vgdnm2FgSTIdlbw7b3nxpLONiUkGstn/yMQbbJAxng6Iw6HtMC6EeXMD+v8riHG5WLpK6nTL9oFEbcHHdB1xSTOPQJG5AK0gpsw7NmRirSLs/LbOoqS0Y7D9/O1O8U82sGNiypFif7D4xgnVK1HaK4WpWZXwr8KTqpIvGb9BxIvz/OJ7Z0fky692j62X5qf81LARTHL7GAZiO4IiN4uq68IVx2oDhHsy
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55236004)(6506007)(31686004)(66946007)(91956017)(64756008)(53546011)(66556008)(83380400001)(26005)(54906003)(36756003)(8936002)(6486002)(4326008)(71200400001)(2906002)(110136005)(66476007)(66446008)(76116006)(38070700005)(6512007)(316002)(122000001)(508600001)(5660300002)(2616005)(186003)(8676002)(86362001)(38100700002)(31696002)(107886003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aEZkWDByK2RZR2tHdXpvNWdiVU5aemIzMHNKWWRTd2pqeS9OQU14RW5QWERX?=
 =?utf-8?B?WGg1bnBMdSs2Z3VxcDVHeTJLTkNmZEJtMitoQlgyQkd2WVVpcmJzV1RIOSsy?=
 =?utf-8?B?LzN0VDNkaWM5ckNqK0pWNHZ0U2tDeEc5RUYzWUhFOUZGVzRFY0tsNVF2MXlW?=
 =?utf-8?B?SkxYZlJSUmI0bzdyblZ4TE9YdlRjZ1NnTlJoamNITCtycnc4VU8xU0llZVow?=
 =?utf-8?B?TWhNby9jMDFoeFl0Rm5FNnFlZGlGZmh4OXdCbUxBRnpzWVJvT1BhL1hHcE1j?=
 =?utf-8?B?cS9rZ2VhUmdxSmttZEFkSVV1S25tM1dVYTNCRDg2NHBSRytKcG16MnBjck5O?=
 =?utf-8?B?Zm1jZkp0eUxYb1N1ODJiL2lpVkx5ZTViNmxSb3JwajBBWGRuR2ZDK0lza0NF?=
 =?utf-8?B?OStsaHh3NUpwNW9TdU1jU3ZnZ0pOZDJ6dnBsdkJ3MXhScDVxKzh5eEZxYnlv?=
 =?utf-8?B?RTdhb0Z1YStOYmdVdE8rRUhMVTg1eVNlMElGTUNkQkxxNnYvcml0VFRIV2w0?=
 =?utf-8?B?WkVrWGE2cHo0RzQycGpnMXp3RFJhQlhzY1F2aWJMdmJwSnA3LzVTRzJaZm9N?=
 =?utf-8?B?aktwOTlXOFZwVjZJQ3MyVzh3bGdDLzRmb3laczdVSWIzLzhNTkJHZFRrRlRG?=
 =?utf-8?B?ZU5Uem1YZitZZ20wM2IyelJzVUhQaTVyMXBzeDR1TWt5WmtNcVFUM1ZTUmlY?=
 =?utf-8?B?RXVFN2lmUm9HdWhLb3Y4cERocGNuSTNGbjNyb0FLQWExTnhjcXZ0cVZYcldu?=
 =?utf-8?B?THpkSi9TTkxzenlMZ21wSDV3T0o2L2xOSDFoMm5iRSttQTBwb3c5dWVBWVo2?=
 =?utf-8?B?ZzZRZmVKZDMwWTZsc1ROdkhZeU5HOWpRMXhWT1Fwd2NNSVNESmVibXFVNW5s?=
 =?utf-8?B?K0NMMHVCMC9KdkYwV1BrYVBsQ2ZtaHBMQ0dWZEpXdkIzdDVHSFViUXl6RmJ5?=
 =?utf-8?B?WGR3aVlqbnVwTXB3VWdza2lTdDRQeEZkOUFsOU13U1BJS0Q0U2RoYUQ5VE9S?=
 =?utf-8?B?SHZwK0hrUmlmTy96UlIxL0NaNHZqTkN5QlBOK0JMZWNnMUtoT0FPZGJ2cU14?=
 =?utf-8?B?MThCU3VVL3oyTHMwbHlHRFRHck45Ni9ab3Q5eFpvL0gvRTR4TnhUc0xVYTI5?=
 =?utf-8?B?VFNHMG1BU0NmcUpTRTBacEZEcC9WUE5DQS9vdTFoZmpOcU5NdzFSK2Fja0sx?=
 =?utf-8?B?c0pFWTdKc3NPL1ZHS0xqNjdtQnNOZjlNbkxyK0s4VHpWZGdIOHpGeGxzZ0p4?=
 =?utf-8?B?TlFyaUkxaWp4dFdrOTZQMVVjU1RicnJGelE0T3Nwb0N2MElycmMzTEtBUHhD?=
 =?utf-8?B?ZjQyaEhicG5LMWFicFppN1BnKzBhMEg2cmJ0MUZvWEpad0JENjVOZGhXK1Ro?=
 =?utf-8?B?VUk5b05OTjExSVI3aWUrWmh0UzdIMk1TbzFQK0QrSlBLekloZ2tOYzJNcHN2?=
 =?utf-8?B?ZlRoamFWdHRabC9BQzBmZ0hYK2haQTcxRWNib2JQU3NRR2hIWDYwTWtUbTU4?=
 =?utf-8?B?MVNjT1pJRTdBZExPRmYraUx0bmhzTUxocXZlTjdFcjhGcThoYWxLUVZITmtU?=
 =?utf-8?B?ekJDa1RES2ZQVnlHclJpU1RkNnVYOVRjcGlaS2Z1cmhMdXJNREE4NUtnWm1w?=
 =?utf-8?B?VXBJRmEyMG1MMHZYeEx4bUVyYzVJVEVMVFRhVDU2UEJoMlNhUHZ0bUdTSG9w?=
 =?utf-8?B?QVRQWFpZUDB5WVZZSDA2dWZBTUNLSkNpQVpTbjgrOUNyK1FleE9Hblk2a3lX?=
 =?utf-8?B?UXc3M3k4aGNTSFVveVF2R3JUTnFlV3RHeGVsOUJ2MDl0MW1XdnJ2UExZVSto?=
 =?utf-8?B?emhPdVRCYjJOV3RxdHdkdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00A3167252623A43BD1F8B19045ACD31@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc37a11a-0a6b-4031-db13-08d97f4fd08b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 11:38:22.6252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bL/p2nhSSxXpH4BdYKSZNMnWwKRVPXPQJU3oXP+1UKaIw7mCxEHFzv2tI6fLuLh71Vn+KZWt8XjItCnZr2TD992mL6afAHeq2xSalcwJ3IH+/7QylnzNnDa1ZD4GCHhA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5939
X-Proofpoint-GUID: LeL34fTg2KwNHEOwQTfpsYIONbGK00FP
X-Proofpoint-ORIG-GUID: LeL34fTg2KwNHEOwQTfpsYIONbGK00FP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-24_04,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109240069

DQpPbiAyNC4wOS4yMSAwODo0NiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+IE9u
IDIzLjA5LjIxIDIzOjAwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+PiBPbiBUaHUsIDIz
IFNlcCAyMDIxLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+PiBGcm9tOiBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+
Pj4NCj4+PiBYZW4tcGNpYmFjayBkcml2ZXIgd2FzIGRlc2lnbmVkIHRvIGJlIGJ1aWx0IGZvciB4
ODYgb25seS4gQnV0IGl0DQo+Pj4gY2FuIGFsc28gYmUgdXNlZCBieSBvdGhlciBhcmNoaXRlY3R1
cmVzLCBlLmcuIEFybS4NCj4+PiBSZS1zdHJ1Y3R1cmUgdGhlIGRyaXZlciBpbiBhIHdheSB0aGF0
IGl0IGNhbiBiZSBidWlsdCBmb3Igb3RoZXINCj4+PiBwbGF0Zm9ybXMgYXMgd2VsbC4NCj4+Pg0K
Pj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5k
cnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmFzdGFzaWlhIEx1a2lh
bmVua28gPGFuYXN0YXNpaWFfbHVraWFuZW5rb0BlcGFtLmNvbT4NCj4+IFRoZSBwYXRjaCBsb29r
cyBnb29kIHRvIG1lLiBPbmx5IG9uZSB0aGluZzogb24gQVJNMzIgSSBnZXQ6DQo+IFdFIGRvIG5v
dCB5ZXQgc3VwcG9ydCBYZW4gUENJIHBhc3N0aHJvdWdoIGZvciBBUk0zMg0KPj4gZHJpdmVycy94
ZW4veGVuLXBjaWJhY2svY29uZl9zcGFjZV9oZWFkZXIuYzogSW4gZnVuY3Rpb24g4oCYYmFyX2lu
aXTigJk6DQo+PiBkcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9jb25mX3NwYWNlX2hlYWRlci5jOjIz
OTozNDogd2FybmluZzogcmlnaHQgc2hpZnQgY291bnQgPj0gd2lkdGggb2YgdHlwZSBbLVdzaGlm
dC1jb3VudC1vdmVyZmxvd10NCj4+ICAgICAgIGJhci0+dmFsID0gcmVzW3BvcyAtIDFdLnN0YXJ0
ID4+IDMyOw0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn4NCj4+IGRy
aXZlcnMveGVuL3hlbi1wY2liYWNrL2NvbmZfc3BhY2VfaGVhZGVyLmM6MjQwOjQ5OiB3YXJuaW5n
OiByaWdodCBzaGlmdCBjb3VudCA+PSB3aWR0aCBvZiB0eXBlIFstV3NoaWZ0LWNvdW50LW92ZXJm
bG93XQ0KPj4gICAgICAgYmFyLT5sZW5fdmFsID0gLXJlc291cmNlX3NpemUoJnJlc1twb3MgLSAx
XSkgPj4gMzI7DQo+PiAgICANCj4+ICAgIA0KPj4gcmVzb3VyY2Vfc2l6ZV90IGlzIGRlZmluZWQg
YXMgcGh5c19hZGRyX3QgYW5kIGl0IGNhbiBiZSAzMmJpdCBvbiBhcm0zMi4NCj4+DQo+Pg0KPj4g
T25lIGZpeCBpcyB0byBzdXJyb3VuZDoNCj4+DQo+PiAJCWlmIChwb3MgJiYgKHJlc1twb3MgLSAx
XS5mbGFncyAmIElPUkVTT1VSQ0VfTUVNXzY0KSkgew0KPj4gCQkJYmFyLT52YWwgPSByZXNbcG9z
IC0gMV0uc3RhcnQgPj4gMzI7DQo+PiAJCQliYXItPmxlbl92YWwgPSAtcmVzb3VyY2Vfc2l6ZSgm
cmVzW3BvcyAtIDFdKSA+PiAzMjsNCj4+IAkJCXJldHVybiBiYXI7DQo+PiAJCX0NCj4+DQo+PiB3
aXRoICNpZmRlZiBQSFlTX0FERFJfVF82NEJJVA0KPj4NCj4gVGhpcyBtaWdodCBub3QgYmUgY29y
cmVjdC4gV2UgYXJlIGRlYWxpbmcgaGVyZSB3aXRoIGEgNjQtYml0IEJBUiBvbiBhIDMyLWJpdCBP
Uy4NCj4NCj4gSSB0aGluayB0aGF0IHRoaXMgY2FuIHN0aWxsIGJlIHZhbGlkIHVzZS1jYXNlIGlm
IEJBUjY0LmhpID09IDAuIFNvLCBub3Qgc3VyZQ0KPg0KPiB3ZSBjYW4ganVzdCBza2lwIGl0IHdp
dGggaWZkZWYuDQo+DQo+IEluc3RlYWQsIHRvIGJlIG9uIHRoZSBzYWZlIHNpZGUsIHdlIGNhbiBo
YXZlOg0KPg0KPiBjb25maWcgWEVOX1BDSURFVl9TVFVCDQo+ICAgwqDCoMKgwqDCoMKgIHRyaXN0
YXRlICJYZW4gUENJLWRldmljZSBzdHViIGRyaXZlciINCj4gICDCoMKgwqDCoMKgwqAgZGVwZW5k
cyBvbiBQQ0kgJiYgQVJNNjQgJiYgWEVODQo+IGUuZy4gb25seSBhbGxvdyBidWlsZGluZyB0aGUg
InN0dWIiIGZvciBBUk02NCBmb3Igbm93Lg0KDQpPci4uLiB0aGVyZSBhcmUgY291cGxlIG9mIHBs
YWNlcyBpbiB0aGUga2VybmVsIHdoZXJlIFBDSSBkZWFscyB3aXRoIHRoZSAzMiBiaXQgc2hpZnQg
YXM6DQoNCmRyaXZlcnMvcGNpL3NldHVwLXJlcy5jOjEwODrCoMKgwqAgwqDCoMKgIG5ldyA9IHJl
Z2lvbi5zdGFydCA+PiAxNiA+PiAxNjsNCmRyaXZlcnMvcGNpL2lvdi5jOjk0OTrCoMKgwqAgwqDC
oMKgIG5ldyA9IHJlZ2lvbi5zdGFydCA+PiAxNiA+PiAxNjsNCg0KY29tbWl0IGNmN2JlZTVhMGJm
MjcwYTRlYWNlMGJlMzkzMjlkNmFjMDEzNmNjNDcNCkRhdGU6wqDCoCBTdW4gQXVnIDcgMTM6NDk6
NTkgKjIwMDUqICswNDAwDQoNCltzbmlwXQ0KDQogwqDCoMKgIEFsc28gbWFrZSBzdXJlIHRvIHdy
aXRlIGhpZ2ggYml0cyAtIHVzZSAieCA+PiAxNiA+PiAxNiIgKHJhdGhlciB0aGFuIHRoZQ0KIMKg
wqDCoCBzaW1wbGVyICI+PiAzMiIpIHRvIGF2b2lkIHdhcm5pbmdzIG9uIDMyLWJpdCBhcmNoaXRl
Y3R1cmVzIHdoZXJlIHdlJ3JlDQogwqDCoMKgIG5vdCBnb2luZyB0byBoYXZlIGFueSBoaWdoIGJp
dHMuDQoNClRoaXMgbWlnaHQgbm90IGJlKD8pIGltbWVkaWF0ZWx5IGNvcnJlY3QgaW4gY2FzZSBv
ZiBMUEFFIHRob3VnaCwgZS5nLg0KDQo2NC1iaXQgQkFSIG1heSB0b2xlcmF0ZSA0MC1iaXQgYWRk
cmVzcyBpbiBzb21lIHVzZS1jYXNlcz8NCg0K

