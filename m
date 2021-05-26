Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F421391F51
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 20:41:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132699.247426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llyTC-0007U1-Tz; Wed, 26 May 2021 18:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132699.247426; Wed, 26 May 2021 18:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llyTC-0007RH-Qa; Wed, 26 May 2021 18:41:30 +0000
Received: by outflank-mailman (input) for mailman id 132699;
 Wed, 26 May 2021 18:41:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8HVS=KV=epam.com=prvs=578065f5e4=sergiy_kibrik@srs-us1.protection.inumbo.net>)
 id 1llyTB-0007RB-6t
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 18:41:29 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c5432a0-c52c-4203-a727-ec312935f6bb;
 Wed, 26 May 2021 18:41:28 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14QITuEI014761; Wed, 26 May 2021 18:41:27 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 by mx0b-0039f301.pphosted.com with ESMTP id 38spq71fr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 May 2021 18:41:27 +0000
Received: from AM9PR03MB6836.eurprd03.prod.outlook.com (2603:10a6:20b:2d8::8)
 by AM0PR03MB5474.eurprd03.prod.outlook.com (2603:10a6:208:16c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Wed, 26 May
 2021 18:41:23 +0000
Received: from AM9PR03MB6836.eurprd03.prod.outlook.com
 ([fe80::9151:70c8:8d48:5135]) by AM9PR03MB6836.eurprd03.prod.outlook.com
 ([fe80::9151:70c8:8d48:5135%2]) with mapi id 15.20.4173.020; Wed, 26 May 2021
 18:41:23 +0000
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
X-Inumbo-ID: 7c5432a0-c52c-4203-a727-ec312935f6bb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxiWHLqHGttREz4XhzG19Dr7b0dmOENIoWPdY4piqvjWqgVtq6aoLyUoT1Aepu2zGISvXslXikzUzJCKnVbF3kjRTQnFg+cqLSuOJfmp0pR8qQepljpWE+TSlTPwhXpF7Lhj79lM0BTJrz4lIDEvcMQI+zQOG/3ALlggU+tX+IiCtuTkW1osIwpQ5q/H3Cec91y9LH7F6t94eFOKs7VxJUrx3XfRGO9r6pZvVx9mr8pMKScWI1Q4eGMPznn1J3GAV4g0U4SNzgFgBDKZSirsoAo3D0jioSB7E7V8anYQfQPsWk/43EmyYnZdUrokvVtClNIvP/lDjmheWOAGxnn7Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzRpJyWZiGcsJseEafjmvR0U81BdsxSH+wsqwxY6dCE=;
 b=hG94zFjrKAFnACBDDmrhEl45AQ4LLHPKoI8mvBgq0OHljCn0gixPQtSGLeMh7qh8329P6+W3Y9aCGFF/SJ2b0S0u9ub3WTGwWTt7micHbdSYjpnzoWXOM4CL8NxUfBEwL052WVolVcQxu/Rio0ljw/br3dKly6X1YT2w/HCtXr5PfhXfFaMBEcR+n8md3Iiac1M4zPp3Td9RPkZ0+dM4f7F9I0b2jNf7atGsTEcB38HPmDzJSbxYEGy+fRz4GyeYEhYjg9Mp8d6c/dhbyXDOFGkHxpqNyXggz6kA81+RfT1aklE3GFmlrVbgRU96MSaGqE9DtA7z9MPMHrf1XAK5UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzRpJyWZiGcsJseEafjmvR0U81BdsxSH+wsqwxY6dCE=;
 b=G4WSKKaiKhndrS7ByW/qZKaET6/RCcPfuLrOi9/dXEHyOQz2ZXFeZ9xVuj1fszAbIOvo4C811QgXOvOE17T3V2RYeqcyozqKwuCfFVZhKblaiu61/VjVOBOkM3s6UsCOMk8mSYu64RR4cT4uJusTpfXwlhH9o1vnq7xHoOPxN56dV2VlrMFSUatvOoUDSlaNxItKh4jo5s0EIgv/Few3SsbnajlAiowVfh62ca3WKzNlT1tbolSFG77jh4ZyIVZLn2Tru7cc16805qMErIvJUBzvv4Hvl85tqAoY+ZnGKP0j3S9rRgmLokFWbT1pwg+a5sr5cafLMSpPOre+KjTzfA==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: RE: [XEN PATCH v1] libxl: use getrandom() syscall for random data
 extraction
Thread-Topic: [XEN PATCH v1] libxl: use getrandom() syscall for random data
 extraction
Thread-Index: AQHXUJviVlkCcTT7D0WghZSRk2JxUar1gejggAByMQCAACcHIA==
Date: Wed, 26 May 2021 18:41:22 +0000
Message-ID: 
 <AM9PR03MB68360EE9DC1E8C52A1902BECF0249@AM9PR03MB6836.eurprd03.prod.outlook.com>
References: <20210524085858.1902-1-Sergiy_Kibrik@epam.com>
 <13bde708-1d87-a2c7-077f-f08db597ae15@xen.org>
 <AM9PR03MB68362CAC724A6BEE4A50B96AF0249@AM9PR03MB6836.eurprd03.prod.outlook.com>
 <6f6c29e1-09dc-d7ea-6126-4649100c149d@xen.org>
In-Reply-To: <6f6c29e1-09dc-d7ea-6126-4649100c149d@xen.org>
Accept-Language: en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [95.67.114.216]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ccccbbe-0f41-4835-cad1-08d92075dc6a
x-ms-traffictypediagnostic: AM0PR03MB5474:
x-microsoft-antispam-prvs: 
 <AM0PR03MB5474FCCC1BEEEDC23A6EFF2BF0249@AM0PR03MB5474.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ffGk+fk0X6WiqkCzfeLAcze9B45Nh4tCI7dtNeDuciSnOIkIDDGD9DsMX4TpwfPgZJWhyf+BICEjhBAvTiGbYEFtYKjBSxZqq3r7tkh0F4s/KyS4jF+5eKyNdAh0h5SS0yH//90NIRrXj3kI1vH3cMQF+p/u1KLsPfZ5SobEIFEn5KbPiEHusns3MxYBvKiu/iOAlX5ScnF4S+262R7LJw33zLbsYNg8gmtovezvpWsvJ/Ei+YVYZUW8NYp7A7q/poO9zqbcm2D6eee2Vjbhq+VagX5648Cxwg1MB97ObZvKoktbIGhvST/qzDc0iYauki17GcUdRwOdeQVkdU7u/RffC8oa4dj6PeRkxeQgIv8jJOqluRYASIE6ojI9Iaks1OewTG+kW1l0/PSaMCi72U8Ku7edP1UYfv5MCV6CMkvj2YNZMvkZfOD+NMS/EjnqmQdhJ7havLlghFnNDj+ZTcgE2ypvX+QkWU8J308DdugJxHcBpeSHY0etnq2H9+R0ebZqNrmweLfuYQmmxzeRXAOgYK9rsPq9cpInG+iYNtfxzbPDpfjI2ft/TL8v5zuJ6J1avEge9WXek3cCnj10JilcNzmVE1b5W7TFkLSZ/qE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB6836.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(376002)(396003)(39840400004)(4326008)(26005)(316002)(76116006)(5660300002)(7696005)(2906002)(6506007)(71200400001)(38100700002)(64756008)(66446008)(54906003)(33656002)(186003)(110136005)(558084003)(66476007)(86362001)(478600001)(52536014)(66556008)(122000001)(66946007)(55016002)(8936002)(8676002)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?RVo0SUhTeGgyL1dtbUo5allkMktmRXBTWDJ0aTMyRkFjTWhaMEtWZnM1c3Rx?=
 =?utf-8?B?ek5CTm9OdjA0YUZHKzh4V2RaLzV3MlZPWEUwQy9FWmhGbCt3STVPVVlzWHdF?=
 =?utf-8?B?ejV0bzZlcnR0WGdwYnJmQjVDTWhuK0d3dFVTNlp2Nm1sNzMzaklZQktYMDli?=
 =?utf-8?B?aE0xZ1hVZkZmZHJPNVhZakJjK2s3OGN3ZGtvSjlyS3JhN3FOdWFsMDZYYWl0?=
 =?utf-8?B?VFRBZms4Q3R3eDNqTmJBMmJBMFZHN25jZ0I1ZTB0RE5xMEladk41d0lDcVQx?=
 =?utf-8?B?dlBuQStPVldDZ08wcDNVcGVCMmpUMkpnQTI1WXBPNHhBaS85bDRsOEd0SE9K?=
 =?utf-8?B?ZG44d2pVWWZaRVlVLzh6MFg0M1kzeHR3RkFNTVZ3WmZwS3h0M2l3NzIrMThC?=
 =?utf-8?B?TW8wbVhIdERCQzZpbSsrWWFsaUpqbGNtZ3VOenNHZThPNDJuQmtzdjRJT1U2?=
 =?utf-8?B?Z1p3MlAyZml4YzZtb1pnVVhpTjRkTnJzNVFndkFLcUJTVVRVWTRiL1BZb29o?=
 =?utf-8?B?eFF6L3RiUDdkekw2MytCaDcwU3VmSTg0ZUVMN1dKUHU5S2FVa0ZVeHdxcnJH?=
 =?utf-8?B?N2ZVYzM3Rll6UlFPbEVpc2hlc0dDeEZVbjVWVUgvTGRrZVQ0Y0QwallzWll1?=
 =?utf-8?B?K210RWdFbWxJblphTGg1WDlwVmwyRDJ1YnRHZzZVRUYydE9PNnIrS2g3QW1W?=
 =?utf-8?B?NWJHUEoxOUJ4eS9XZnpzRFJ3UHY3MFEzblZPamVoMThqMlllakwrU0ZLQ3hI?=
 =?utf-8?B?ODFGbHpkMEU3Tk5nNG5NeVQzZTdHU3UzYzFOQUh1Wjh3RUhpQktWOFFzSElM?=
 =?utf-8?B?TVY3RHYwRzgzTFp5N2hTSEhtM0NPOGJhbitZZ1F5UGVKb0t6SUU3OXk4T3Mx?=
 =?utf-8?B?aG1jTms1UzZSSG13cVlDNUtqaUsyWkJLZFlieEJsaHVpbUdzWnVHdU0yb0tp?=
 =?utf-8?B?WVluNlRwNEVzd1FuZ0FnRE9RRlgxOUpWQk9PVjNraG5PREhsRW5OeGJrRC9C?=
 =?utf-8?B?bVJQYkdmTVRUWmtEak5MV3NBNUNOMTUvNkN4LzZaUnZROE0xRDlydnNUVlVH?=
 =?utf-8?B?T242ZlFQS1FVWUUxdXJsVDNPY3BOUEs0TFg0QlVFNGlHSjNGSUdzbkc3UmxU?=
 =?utf-8?B?K1pxcm14cHptd3JxYWJnM3JUQVBmOU5SMFdnU1VCUFJ4Z29tQ290Zlh5Zzd4?=
 =?utf-8?B?ZVl0NzRRZG00aFAweWRtaEIzVUpvTkxSSFdxOENqeVAzbTBaZEk3OW90cEZ5?=
 =?utf-8?B?bkxvakQwZGxoYWxQcHJrTUVvRXdvVklOWTBDRDNEWlFBRTc3VjJ4SjVxQUlH?=
 =?utf-8?B?MmpHQ1ltMjFQOENmcFpmQ1dkenpnTjNsbk9NRHJnWkdkYXdzK1lHSjdyanA5?=
 =?utf-8?B?TXRHSk52T1NCM1JVUmhzTVRHOFdCdWFqK3ZEbVVQMnRkb3lRK2hza2NOWGta?=
 =?utf-8?B?VnFwQ2F5LzF2dmZ2em5lSXZZMXJHK0svVzNoVUkxWU1aMTNURk5ub083NUJQ?=
 =?utf-8?B?aHdqbEtITDcrOE56RmMyQWtncEVCZ1BSWThRRkRDUm5rQWc4ZGpmdWZvRlFo?=
 =?utf-8?B?ZEpNdTR4ODFyZGZTVlh3UVBEY2l4LzZLTjZXUUVkMWRxcVRpNEo2YWJyOU9Y?=
 =?utf-8?B?b1dER0dSUDFJZzBHZy96TGxFOGd2K0NNeSs4ZzhqZzdjWUV0MzkrZm5QbWVt?=
 =?utf-8?B?bytkUHpFenFMSVdiYlBsRS9OUWFXSU1WV1FuN3cvdFo4dWY4TnZaSUdGNjE5?=
 =?utf-8?Q?OVWWrhmNCiUMG48ye6KrW7TRjTyRWS5Tm7Eid4S?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB6836.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ccccbbe-0f41-4835-cad1-08d92075dc6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2021 18:41:22.9908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Peq1kzBDlDjNh4s88L1gwzi3vBH2K1xPdpAZwStmhuvA6k7fTThrK8ZaD8lV/3E4usVbuJfEsb4PysIH8EuS0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5474
X-Proofpoint-GUID: JWGj9qlf9_qgl5oTiI11ynrw6hauSyHx
X-Proofpoint-ORIG-GUID: JWGj9qlf9_qgl5oTiI11ynrw6hauSyHx
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 mlxlogscore=855 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105260125

PiA+IFlvdSBtZWFuIGl0cyBhdmFpbGFiaWxpdHkgc2hvdWxkIGJlIGNoZWNrZWQgYm90aCBhdCBi
dWlsZCBhbmQgcnVudGltZT8NCj4gDQo+IENvcnJlY3QuIFlvdSBjYW4gaGF2ZSBhIGxpYmMgc3Vw
b3J0aW5nIGdldHJhbmRvbSgpIGJ1dCBhIGtlcm5lbCB0aGF0IGRvZXNuJ3QNCj4gcHJvdmlkZSB0
aGUgc3lzY2FsbC4NCj4gDQoNCkFncmVlLCBJIHNoYWxsIGNoZWNrIHRoaXMuDQoNCiAgLVNlcmdp
eQ0K

