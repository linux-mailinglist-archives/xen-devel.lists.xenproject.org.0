Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4812244404B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 12:03:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220794.382201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miE2e-000228-6W; Wed, 03 Nov 2021 11:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220794.382201; Wed, 03 Nov 2021 11:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miE2e-000209-2Y; Wed, 03 Nov 2021 11:02:52 +0000
Received: by outflank-mailman (input) for mailman id 220794;
 Wed, 03 Nov 2021 11:02:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UC4I=PW=epam.com=prvs=194164c520=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1miE2c-0001zz-G3
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 11:02:50 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9562019c-3c95-11ec-8568-12813bfff9fa;
 Wed, 03 Nov 2021 11:02:49 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A3AdCkV021803;
 Wed, 3 Nov 2021 11:02:44 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3c3ruug4sf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Nov 2021 11:02:44 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4434.eurprd03.prod.outlook.com (2603:10a6:208:c7::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 11:02:37 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4669.011; Wed, 3 Nov 2021
 11:02:37 +0000
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
X-Inumbo-ID: 9562019c-3c95-11ec-8568-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNI8ywGr82T1ZzZ05+fD/VoK7vUIVTELpSa0dHLTXCTWNGm9FfV5Aod3/+Y+FpX0s/rWcix1SppAUjKMO9wTjhmxgxXQugzcGA7CNo1kBx3g/qIdI+zxcazpNSbK7w5n08gMGz1zB5ZpvxJX5Lb0kJAnXicieRCG2yHi/gWZ9z9aXXvB/3u3bQFQv7ntcCguPzl6rK5tErJv2pzCJHmcY6ciDMhWYVmYbes1aHAD5EHHP0faTaQym8XvIHUG9u9W2W/U8s8IwHy9jkHY+szvbszxh8vrre0cxLYwA3OyhTZ55/aFxKNd0wl4xKGkctgo17l8lU7P2UQuy7yJQnJXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2hqvwZaJc93k9Zhb5aUKiapbvoDN4shc/xIEg3+Q1M=;
 b=mlK74QYMuAHpP6OBe49dfNxotx7Imza97ZRqGsOAnTfrKCbbxo6x3WXFK0tfwzjSfczNu9gQrsknnwOOcCmEEAMBE9KDg8I0KPJlClThCHacoKE191SWm0hwIAPr3C6z23oyKLLnfRdM9uwLjUxTtdBFYdOz5w0O/Cen/Z39DmhEemG6jiLFAe6FXwyqb7DjHzOJE2w15/mUZuEIrwdQIrisK5bNoZKX2T6budpedzQdonzD93+mCmqX7uMz/eV+IP6WfrT6jIekmLEwDfZKcLwWlYvVKxg5tNvBzLS7NNxIa+uCL3deUKQGpDXA/5/f/lI/U8LttR8MuuGX2FYeNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2hqvwZaJc93k9Zhb5aUKiapbvoDN4shc/xIEg3+Q1M=;
 b=fi5cEK8BYImm3OH4dG7Dk5lHxmizxDJWNit9D2xGtXII5rylwk7ZuuQd1tcFhXgN9ZyRPi2mIyKrheeakxDBfqzseXVLM9DzaIE0FVBXAl6ckUoh4spy4WnPuqRd4pNmBOvR7melzu3iGJbWWt4Hx6lt/05dtrXavyW9oFySqe3QBdv3IqnOk0ktChlOiGcegi56+ENhLmIVv44ayaP8rYe7XoxGEpqkVajmRJXVSdn2oiddLxL7BKkoiDNleaBZIlKY54YcyKmjMFLxyWMwaG0dcMbttMSUL+vDyJCUdDi9YfsDaB/H54PhuHqcMorcaHOefAeM6RwkDU6URlWFEA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Jan Beulich
	<jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Michal Orzel <michal.orzel@arm.com>
Subject: Re: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v3 08/11] vpci/header: Emulate PCI_COMMAND register for
 guests
Thread-Index: 
 AQHXtdAkq8Qmwxr3HUWTio8KWsEpvKvlQ6KAgAsHq4CAAAimAIAAIt2AgAAEUICAATmxAIAABTcAgAABvgCAAAHkAIAAAZSAgAAFc4CAAAmcgIAAAuiAgAAAg4CAAAbWgIAAAG8A
Date: Wed, 3 Nov 2021 11:02:37 +0000
Message-ID: <9b9bd48d-ab2a-3e3a-5327-d0b8eff5a8ae@epam.com>
References: <65e218f1-471e-fd02-441a-f8c5f29d776e@epam.com>
 <b7626958-4df3-9f07-0ab9-604e55b3274e@epam.com>
 <de320822-a94f-18ad-ccd4-574037903b1c@suse.com>
 <46826bb3-472e-e88b-5421-20fdaf5b49cf@epam.com>
 <a5ff1c9b-3200-18f0-a373-7535980269cb@suse.com>
 <4d4a061f-6437-5d51-84e0-d2139f47eb76@epam.com>
 <4f77a4f2-a66b-465d-5859-7fe71ece8168@suse.com>
 <48506e1b-2dc9-4652-f169-3d44135a4e74@epam.com>
 <7efa4dd7-83b3-daac-cc02-86f80762513b@suse.com>
 <d3908703-3501-892c-55fc-5a171318eeea@epam.com>
 <YYJr75RbSOuvbzGF@Air-de-Roger>
In-Reply-To: <YYJr75RbSOuvbzGF@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31ad8992-e8e1-433d-9a78-08d99eb97266
x-ms-traffictypediagnostic: AM0PR03MB4434:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB44346D3F44AAAB4F41BD33EEE78C9@AM0PR03MB4434.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zrE97ve8VYX76z+ZBl82Y24i2viDrS0bJ+958q+rsotPxEUly7wq19hnOFF28kP+U45LfgRqg+6wjmpJuSCggcVrpSp5m2Dpqgms68zgbl2Hha/FvvI5X54HK9UoH28xKuqtmGtl3PWKl5XO3g9pzdPOL3lHImraE9lBlLHfq1YB+6U6FKMrcnEIIqHm/QfX9QFjC1vD7uZGwW0c4XM3agzHufnGxhk6IzuNP5K9jlEbrLWlTamuoNIsW9apfPYUVC+JcUu68LW9363j+srU6V1dSz1u/DhzYUYDcAI2/9dy+9IP0cOfleeSSshJGbHtKwx0X/YrpCszgWTtCs031ads/LcJMh4LzD5QgNzDiVeDRh0bfy6P4Gs7RqRQhdWI5mrpKFyqnH+Jg8+8PJcMSccP3+R2h3Bk1mtwiCYvzIHnZ7SRGEHJZhlhC02F9vJK8OATnRnH5PXAu/nU6VEl6c7z4y8zHPQZo6DXprniqaPg6Hf6BlmYyB5TY8r1iVj7zoB0jYwv95bDabvREF227Bt3Y2+z7e2zZCPkcTZ5GPxGFcwLTH//wY1ESvnfBJSQG1gN6iCdoO7bhhTEk9SU4iAJKR3WXfcNC3lpRdWkr/7yKz7cSdX6OAfffLsGprkYH0QCRksD7uoLs6SbagBrCUd60lJc1f5533O3tGdxGql+CTzE0vgY+lduAwD65Op1Nkmpx4lHrLK1w54HrhVYNojAn6jw9q3NF7p/n2Kkeh0wl5qW6wBYbJkSbCZxqJXc
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(54906003)(26005)(4326008)(110136005)(2906002)(316002)(31686004)(64756008)(66556008)(186003)(38070700005)(36756003)(66476007)(53546011)(2616005)(6506007)(66446008)(86362001)(6486002)(38100700002)(122000001)(71200400001)(508600001)(8676002)(91956017)(66946007)(31696002)(8936002)(76116006)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OXR6ZkJJSGVjbEo1cktUNnQ4b1hrcU1pU21ZVHREN2xMSkFDenJpQVRDWFBj?=
 =?utf-8?B?MG1Ka1dzaC83NjdmRXFJdVQ1ZTZVZnB1NFlzVDAvSUs2blFGNy9EbVZoNUIz?=
 =?utf-8?B?NTFGc2xRZTVNZWI5Y0RQdjg3OTZaUTRTdHBsYUsvQXNJUmJVc0hBbENRSFVr?=
 =?utf-8?B?NnpxTW1vMFJMdnR3dEhjMkxaK2VGTzJ2bEtwQzIzSEUwODlSenJob2p6U3lE?=
 =?utf-8?B?blBjR1FoMWIxczRYK01EWGVDWVE1ckZhQWRwdWtXQnZIVUhCZWd0bUlESkxX?=
 =?utf-8?B?akRacFB3R0FrL09iMUo0M2NQNUhudVF6ejRkWUxTUEo0WlNrMG5UdTF4WFlW?=
 =?utf-8?B?aFJMdzZadTY3VWVrblk3cUNPcVRkNTYxcVdUQmpTZ1FKNmtWQVpHd0UvK0pF?=
 =?utf-8?B?UURhZHI4KytEMHMyZmlkckV2ZWZLNUZlZHVyZ0dKdHNpNmI0SEdPdndWcU9L?=
 =?utf-8?B?VzF2U0FwbTdvSVZkU1pVYkhvWng4NTVWa2FtQjM5QWtrRXBUVzZ2VXZ3Nm9O?=
 =?utf-8?B?NWFRTVFud2ZWU1FjZUJmS0ZoQUtlenE4RUdGZzMwMC9FNFkwRnZIL1dKdkRG?=
 =?utf-8?B?ZTA1QWdaRURzUDJoeWt5YlduOG5nYktxTTlpMlhEd3hQNXFQNzJ2TWNySmRi?=
 =?utf-8?B?WkdSNEpQR2tNbWlBelZoOUVTNDMxajNUbHNVaGRjTVlQVDExM3orNEZrR25i?=
 =?utf-8?B?RlhRUlozNXVsSkZnL3JXMnpGeGdjYVA0dTIwWjd6Mi9KUkRTbHJtMHRkRnR6?=
 =?utf-8?B?S2ViZW9ubU9VaWRYRklLQUxsR2RqSmVuUk5yNFp0Z3ZLQTlrK0IrZHZDY2Vp?=
 =?utf-8?B?eklvY2JhekJ0dXVQV2Q3dzJ2ZW05RktDZm1UZ2hTb3kweTdxQjNPU1hkVms4?=
 =?utf-8?B?RmZzbjh0eS9TTWd2MDlWeGNncVpXRzZIeHlNdXpJR21TV2t0SVZYZWxGczNY?=
 =?utf-8?B?dklXYlRSWHhNZWttdys0N3VQNFNISUM1d2xIQ2I2YkJ6TEJ2dUpXQ1dUMXlB?=
 =?utf-8?B?UDBGTy9yd3hmSS9uMXI5cVpSaDBmNWcweG42M1M5TVRldUdqdHdlSWhVTlow?=
 =?utf-8?B?dncyV2JLQzcwVmNnckRIMC9ERUE2NVJhdjZIdUtYa0NlK1hHakNuUm1icHFy?=
 =?utf-8?B?Vk5pVnNxNm9hV3RORlVJbDR0bUltak5ta3hOVHhpYXJrZ3ZTTVY4RzA0Y2tV?=
 =?utf-8?B?bFNFcWltTERTdUdVdGFrb0pOUEd5RzEvRGxRaElDcVFnTTc4WTFoRzQvcGFS?=
 =?utf-8?B?Q21NYXlZR1hrL1RBSHIrUGdzV3ZiYzcrR2ZlVXR0ZFpDdHlOd2xsa2s0RVhz?=
 =?utf-8?B?enFOYitFcDlDNGZ5bk9IVGg1dzBDc05MamdleEVKbmNHRzJMTDlZSFRTUDNK?=
 =?utf-8?B?S1FXL2FncW5PSTJyS0NvYlIyejlBMFRMUmZsMTBxa0lFblp2UFdNS1Y2RVlR?=
 =?utf-8?B?VStZQUdyMzJlbFFoQ3FIbVdGRHJZaEQxNUY4alJqMFVCdzlQYlpoQ2Z1d1BR?=
 =?utf-8?B?WE1tNjU3WjRsTlRQTEJZc3kvMTk5QUxnYkk5MjZJZ2kxbWhNSDJoWnV2K0cr?=
 =?utf-8?B?Mi93NzJmWHR3dHI1cHMrNXU3cGR2azJpYUZuYWFtbVlXZVg1WE5EWERic1lh?=
 =?utf-8?B?OExGVFA1SXRVYVhsNVVpWGdZdFhRQ05Yc1VBMHN5WlY1L0NUd1dBb0hiemly?=
 =?utf-8?B?SHdwb2owaFIzMDBtUmVqUjNHQ3lZczRBSVozdE4vWW1XTmFkNG0xczdlaWV6?=
 =?utf-8?B?WHRvK280L2VQOFVqcWp0TGxZaUhuSlVnM0cwc3ZUK1NJV25OWFBWREM0Y09O?=
 =?utf-8?B?L2x6NkErczh2c0tCUDlkeVk4cTJBejdOemFveitaS0lxajJSNUlNalowMlNM?=
 =?utf-8?B?enF0TlliWHRqMXJvUFRaZVJscUhHOUxFejlhNnBiTGhLTEtsZE5pL0dYMzFG?=
 =?utf-8?B?UnFRdVUzNEFwUWRHeXZ3Ujd5NkdaSlRXRTZBTkFPMnZtUXNkU1ZsajQvTEI2?=
 =?utf-8?B?dHo3Z2wzZFo2RHJlNjU1Y0NJV2JrVzUxM1BSUGwyUkJVUU5YQkxWNHc4RFU1?=
 =?utf-8?B?TlRrNkoxL2dqTWpEMmNBTEFsd0k3d0RxV1dvY2VURXVjang4TWZ3MFZWMjZR?=
 =?utf-8?B?c1BwTVFOcjQyNm84RUVob1dnWGFuYWVtV1l2V2FZMlg5WGEzUmtydUZkQ2p4?=
 =?utf-8?B?cmtaQ0ZjODhWc0tRMjJtcEo2cUN3ZHRPdjZFMEFadnZXd2RYbG92OGh0QkdD?=
 =?utf-8?B?NWlzeW1oUWhSUmRDUzNiUVB4QVFBSEVseDBVQ05OT0x1WHBDK0J4T3pQS0ho?=
 =?utf-8?B?alovQ0FrS0xxbEhJQzFiYjZJcUhRVE50VEZ3aHV2ZXZaeEtsS2N3dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9562AEA84D89E24C89D08AD23FD1EBA5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ad8992-e8e1-433d-9a78-08d99eb97266
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 11:02:37.3657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xRdx6VUC9nxDK1qORDiM4M74MM3BHepfF4ss5P7Zh/ck5723a4cnfOAS55d3fHjCo8Ehfg6K+MTgy8cN6XDhf6BtNqR/hufwwpHG6buxdFA3XzfpNNwTwC/ugUvjl5VW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4434
X-Proofpoint-GUID: 2ld3k0GuADbn6AqhQIkXiK0eQ0zjpDJP
X-Proofpoint-ORIG-GUID: 2ld3k0GuADbn6AqhQIkXiK0eQ0zjpDJP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-03_03,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 mlxscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111030063

DQoNCk9uIDAzLjExLjIxIDEzOjAxLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBXZWQs
IE5vdiAwMywgMjAyMSBhdCAxMDozNjozNkFNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAwMy4xMS4yMSAxMjozNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+
Pj4gT24gMDMuMTEuMjAyMSAxMToyNCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+
Pj4+IE9uIDAzLjExLjIxIDExOjQ5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+IEFpdWkgeW91
IHdhbnQgdG8gcHJldmVudCB0aGUgZ3Vlc3QgZnJvbSBjbGVhcmluZyB0aGUgYml0IGlmIGVpdGhl
cg0KPj4+Pj4gTVNJIG9yIE1TSS1YIGFyZSBpbiB1c2UuIFN5bW1ldHJpY2FsbHksIHdoZW4gdGhl
IGd1ZXN0IGVuYWJsZXMgTVNJDQo+Pj4+PiBvciBNU0ktWCwgeW91IHdpbGwgd2FudCB0byBmb3Jj
ZSB0aGUgYml0IHNldCAod2hpY2ggbWF5IHdlbGwgYmUgaW4NCj4+Pj4+IGEgc2VwYXJhdGUsIGZ1
dHVyZSBwYXRjaCkuDQo+Pj4+IHN0YXRpYyB1aW50MzJfdCBlbXVsYXRlX2NtZF9yZWcoY29uc3Qg
c3RydWN0IHBjaV9kZXYgKnBkZXYsIHVpbnQzMl90IGNtZCkNCj4+Pj4gew0KPj4+PiAgICDCoMKg
wqAgLyogVE9ETzogQWRkIHByb3BlciBlbXVsYXRpb24gZm9yIGFsbCBiaXRzIG9mIHRoZSBjb21t
YW5kIHJlZ2lzdGVyLiAqLw0KPj4+Pg0KPj4+PiAgICDCoMKgwqAgaWYgKCAoY21kICYgUENJX0NP
TU1BTkRfSU5UWF9ESVNBQkxFKSA9PSAwICkNCj4+Pj4gICAgwqDCoMKgIHsNCj4+Pj4gICAgwqDC
oMKgwqDCoMKgwqAgLyogR3Vlc3Qgd2FudHMgdG8gZW5hYmxlIElOVHguIEl0IGNhbid0IGJlIGVu
YWJsZWQgaWYgTVNJL01TSS1YIGVuYWJsZWQuICovDQo+Pj4+ICNpZmRlZiBDT05GSUdfSEFTX1BD
SV9NU0kNCj4+Pj4gICAgwqDCoMKgwqDCoMKgwqAgaWYgKCBwZGV2LT52cGNpLT5tc2ktPmVuYWJs
ZWQgKQ0KPj4+PiAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNtZCB8PSBQQ0lfQ09NTUFORF9J
TlRYX0RJU0FCTEU7DQo+Pj4+ICNlbmRpZg0KPj4+PiAgICDCoMKgwqAgfQ0KPj4+Pg0KPj4+PiAg
ICDCoMKgwqAgcmV0dXJuIGNtZDsNCj4+Pj4gfQ0KPj4+Pg0KPj4+PiBJcyB0aGlzIHdoYXQgeW91
IG1lYW4/DQo+Pj4gU29tZXRoaW5nIGFsb25nIHRoZXNlIGxpbmVzLCB5ZXMuIEknZCBvbWl0IHRo
ZSBvdXRlciBpZigpIGZvciBjbGFyaXR5IC8NCj4+PiBicmV2aXR5Lg0KPj4gU3VyZSwgdGhhbmsg
eW91IQ0KPj4gQFJvZ2VyIGFyZSB5b3Ugb2sgd2l0aCB0aGlzIGFwcHJvYWNoPw0KPiBTdXJlLCBJ
IHdvdWxkIGV2ZW4gZG86DQo+DQo+ICNpZmRlZiBDT05GSUdfSEFTX1BDSV9NU0kNCj4gaWYgKCAh
KGNtZCAmIFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRSkgJiYgcGRldi0+dnBjaS0+bXNpLT5lbmFi
bGVkICkNCj4gew0KPiAgwqDCoMKgIC8qIEd1ZXN0IHdhbnRzIHRvIGVuYWJsZSBJTlR4LiBJdCBj
YW4ndCBiZSBlbmFibGVkIGlmIE1TSS9NU0ktWCBlbmFibGVkLiAqLw0KPiAgICAgIGNtZCB8PSBQ
Q0lfQ09NTUFORF9JTlRYX0RJU0FCTEU7DQo+IH0NCj4gI2VuZGlmDQo+DQo+IFRoZXJlJ3Mgbm8g
bmVlZCBmb3IgdGhlIG91dGVyIGNoZWNrIGlmIHRoZXJlJ3Mgbm8gc3VwcG9ydCBmb3IgTVNJLg0K
T2ssIHNvdW5kcyBnb29kIQ0KVGhhbmsgeW91IGJvdGghIQ0KPg0KPiBUaGFua3MsIFJvZ2VyLg0K

