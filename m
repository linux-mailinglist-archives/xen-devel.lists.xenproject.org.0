Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A02CB444112
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 13:09:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220856.382278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miF4C-0003DH-U3; Wed, 03 Nov 2021 12:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220856.382278; Wed, 03 Nov 2021 12:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miF4C-0003BB-Qd; Wed, 03 Nov 2021 12:08:32 +0000
Received: by outflank-mailman (input) for mailman id 220856;
 Wed, 03 Nov 2021 12:08:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UC4I=PW=epam.com=prvs=194164c520=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1miF4B-0003B5-A5
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 12:08:31 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1ca92d6-3c9e-11ec-856a-12813bfff9fa;
 Wed, 03 Nov 2021 12:08:30 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A3BwwWj025499;
 Wed, 3 Nov 2021 12:08:26 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2052.outbound.protection.outlook.com [104.47.6.52])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3c3t18g26w-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Nov 2021 12:08:25 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6068.eurprd03.prod.outlook.com (2603:10a6:208:166::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 3 Nov
 2021 12:08:15 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4669.011; Wed, 3 Nov 2021
 12:08:15 +0000
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
X-Inumbo-ID: c1ca92d6-3c9e-11ec-856a-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7muP0Et1914Ws7lidDt500B55p9HBym0edED7aBO/fYU/uPUa4xZhw+tRSeLyo1XbuYgnNbCyNiNpDSZMb9HllA6sUq1G0JgAwThJ56sVz7vZgzBS4YQzJsglbwUjh/lC9M4fgRYO76wzghZVhVhRA+SHlmwGTkRXx2DdIpikeUf8uBFAMT9u6IrMBsx7oOlAfxB1EB71MnKIFXrqMJX684UvAhj9WBMi6FSrPfPskxjVkeMTY/xXbJ89q4Bf/7ZQ2XO9umKKTvOGyY31JZUeQjHO/UQWIzsxch3wWn2wt5Ows7d5+Y/2VTnHsw95JuhZcmJ41pHyjMOvqE8s13bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REI/WpvKUKqYAogjMFToRl21uitvTldv8bIf4KCD5U8=;
 b=PwKb6myDpu+6Our4982Eo3KoAk3myBn8/S6mgtgVH9tY81xd2akGzExuRFCZNtn4S5Eh/5Oh3Ia6/X/CGDaqb35hfV9kwyL1pQHX6PsTFh64CmRb55X5l1AhHybb7ac9ndxJ4Cr+tkW3CGQuCtxVlNQ5TOAOn/fVVOtS/ULmb4OSe0fojYp38efzBrnRzhFdajnpjUXDe4ENt6sB57wTPklbAGYVENuK4Bh5VXVPdrQxSbdUzciwP6GgqA5G+piswLA2qdBXpoZkE5RTrD4eszOo2PWmdeH3+DTzXQIytfAaf6S/Tc0OVRBjyK9uTsWvLT+TsqPQjqJ8dK0iYbh23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REI/WpvKUKqYAogjMFToRl21uitvTldv8bIf4KCD5U8=;
 b=d75DndeWhbHWO7AcYhHliH4Dgm99YZ6wCSp4WeJ8D907kFJ40ciIRNnynXTUxXUuYpG6K3tczdsOrOQ8DG/jsg6Sul9JILgKhVAP9uasdkFlaVE0hV61TmTerQVQBoJKy2DuiO6ivxobyXUjSlquWAUtfbYHEDfeEbPesW0/khRoc7cAbe3Hfjpe5tWkfPpM1QM1bL9gHvVdnoJ9HWPo4+Q6CN8ea0wZPQV1QiF1HF5B3lcE/+FzQcrBDDcl/T8IEKXkg+kgCjgKDxz9nvTrjIM7iUtpvpko0H4oB3QE8tOwVU/AUpGxBzB7DUNb9noOls8xgtMOHbG3VEV7H+pBIg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
        "iwj@xenproject.org"
	<iwj@xenproject.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH-4.16 v2] xen/arm: fix SBDF calculation for vPCI MMIO
 handlers
Thread-Topic: [PATCH-4.16 v2] xen/arm: fix SBDF calculation for vPCI MMIO
 handlers
Thread-Index: AQHXz9uvpkVSL/P+h0KvYyBzgfugSKvw16AAgADfnQA=
Date: Wed, 3 Nov 2021 12:08:14 +0000
Message-ID: <4559d7c6-7a03-54c0-ca93-9319cc7989d5@epam.com>
References: <20211102112041.551369-1-andr2000@gmail.com>
 <alpine.DEB.2.21.2111021545130.18170@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2111021545130.18170@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a12ee64e-dc20-47bb-4585-08d99ec29d54
x-ms-traffictypediagnostic: AM0PR03MB6068:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB60683372E062612E57A9FDD0E78C9@AM0PR03MB6068.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZKLWetI+Rf4LuS1cJ9Ao/7QdqyBzGf/Eh9oUNveR0xONUkusKpkdOnMYZ2qRtaIn8Um36153NbKA9u12xUTUmYXPZ36fruo26A3EP5WgeGorZMRShebLbnopa6PjnkRMFQ/W8dmt5qFSaWLOf087IfhvMoSL0oPvlVSIJcw14nAKz4tNByfudrOumyjg3tYKiy8fbqWNu6MZfdeicZcGL3z0wpWSFHDuFGL+fycKygL9woEDkD1VR+vDLRywyDRE0anXp1f8sB/lT4DuxwUUN/gSI5VHJZHP2Jn80zrx8hmYpkrb5EyPEMjN30nT61jddnQHqkG+RTq87ycuX7Mfyk1Ao+NhiFr6gZyrOkveoDdyr20qBH3HhyGQStAK/3n3pc9P05oYPTQQjl4osvoxcbbwfsuOvgryE8uGqjtHfCs+3Srfdec8Ap2V0QqhVW563ZYUvwPReePFC1Wykc88fh2jnpQ+Za697NlRCtUw1fv9MN8933fiPwqJhjD/sqosuUUpg9QS9EHuweTvJcAAP08KhfVmnLGUSSxDGeAPD3kHAnT7ThfERLkOAy3pnK6yAW/VXqWkBe30YwRR7FYOq5qc1erHpTDrj1iwxbusz1MtRayckF2n/1SHtNsBBA5Hl7yRDVKncrZAg5U+I2KFIKFcAJnd9xo+T5MdsxG7ayNkRvVWCLdiUCo4aJ4AzgjuqmIlNsXm+U0x/xV6ekcUA/pMhkostMxzyYwL/B6vy/Vn0h/64EsZKgLbdeuqr03k
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(110136005)(31696002)(186003)(8936002)(54906003)(6506007)(508600001)(2616005)(6512007)(4326008)(86362001)(83380400001)(6486002)(38070700005)(76116006)(66556008)(38100700002)(5660300002)(2906002)(71200400001)(36756003)(316002)(91956017)(26005)(66946007)(31686004)(122000001)(8676002)(53546011)(66446008)(66476007)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZktLVnR2MVp0Wkl0eC9pbk1Od3lNc1MrampsWGwvR0p5OUJoZ0thOGhDSnI2?=
 =?utf-8?B?Wk1vcktpYTQzUDJoTUtVQTBvUndCY21ud1didXJkeUlJeHhlZm1MRU4zNWU4?=
 =?utf-8?B?R3N4VGsyaENsbDMzdDJhWEtvOWhHQTlWTW9hYXRHNk8xQ1U3Z1ZyaE5PZWtJ?=
 =?utf-8?B?SmRiNElkb0pzWE5Rd1hCYkt5aFNDV2dwS2g5SUtJUmdiNUlhUHZiSTNMOXVN?=
 =?utf-8?B?cXhZdHFsc2M4eW11dGdvTkRKVWc1aXM4UEgrbEpveHdtb1NKbDBDNmhWT1lu?=
 =?utf-8?B?UkY5elc0aWhNYmJINklLKzVucCt5aHU0c1JUNGhqYm5rYVBZU1FpUksrNnBO?=
 =?utf-8?B?T1ZKTmF3cXVPamlZQkdGSWNLME9ld3lGYzgybEFCS3JxZTl6SXBXeklrN2hT?=
 =?utf-8?B?aDhYb1IwV1hKQTZQbUJRWGV0RXgrWmVZNnhJQ0ROU0F0bENOUWFLZjYwRk4z?=
 =?utf-8?B?aGVOeU9SSHhLdjJZOWhhMk1VU2J0cG45eTlUZFdDMytTSlFib2lvOXAvSEJH?=
 =?utf-8?B?Mm1DUVdUbDkxcjhZZ2YybjFxaVlpeStZTTBaSFRYZmUwQThUczFPVE9lWUxi?=
 =?utf-8?B?RloyVlhRWGJuWmhDQnEwbk4xOWgzL0sxRUk5b01Xc0VqYkdaNG9FTWR0YU1C?=
 =?utf-8?B?aktrM0tDTGJzN1VOelM0NXJYbVNEcVcxcGZZTDArV3BWelBHd0hzZVQ5VEI5?=
 =?utf-8?B?cHZqNzVEMmZTRXE1MDdjbG51YlQ2SURoNEFObjl1ek52RlhZbjBGMENYeldn?=
 =?utf-8?B?RmxhWC83RlkxKzNjcktiNVprc3pURlUxYkIxbit5bzNlQWlnMlFUUE1IeDgz?=
 =?utf-8?B?M1pxRHljV1ZqSnhaME1nak50bEhiQlZRaHJZM3VISHNpOGNlaU51Myt2MUtW?=
 =?utf-8?B?TWw0Wm1qbzRRRGNYTjl3T2REMmNkUUg5T2FpVWN6azZ0cy9MQm12TkMxMlI0?=
 =?utf-8?B?ZFpTOFpkUzRhSzl4bndFakVVditReHRWU1RCRUlZZStQN2ovMThpaGoyYU5k?=
 =?utf-8?B?aWNyTUFkSmtiZzdWRmlXK0themlDRGFZbW01NkZiRjRDaFBYZlhjZllyNXhF?=
 =?utf-8?B?YlE1K2Q2aE1hSVhwNUdwQTZNVzBVSkdoc01IZ1B0aTlUZGxHTk1PU3k4c3FZ?=
 =?utf-8?B?aGRiQkFreFFWZmR6RjhaSlhqaDdVU295ejFWTXNhdXFLVE05YkZNN0xwVENz?=
 =?utf-8?B?MTRHcmhBR1pYUmNER1BlajMxRVpDRkVDSU56T0xtZ0dFRCthYmRsYU8wQ1oz?=
 =?utf-8?B?andYamlYN3dtRE9BRVh0N1FtOC9CZjBOekRFZlo0aDBzRk5FOVA4UGRuYjc0?=
 =?utf-8?B?MHNNRHJzZWY3a1MrcHovME1QbGUxbzBYNCtaMTNyZ1NlU0J1YmFSZURsd1Z0?=
 =?utf-8?B?VEJ6NG1adGcxcExvMWQyWWEwL1IwOFdTeUtSREY3a29uQVBNWVhaSnAzeWhW?=
 =?utf-8?B?UWtaanY5bnpFa1pzVGhWVStPOTVWdXNRMkp4T3JDZGVrdjdpZ1pyRFp2eTQz?=
 =?utf-8?B?SWhvNG81b1RuNC9lU2lwWWNIY2tmbnBkQTFrMU1FUDNIZ21mMDFQS1FxMDRy?=
 =?utf-8?B?WW9aV2RQdEc1SXJYVDNTeHl6WlF5SmplWHY1allRSnUwTDBWcEI5S2JaaWFv?=
 =?utf-8?B?YndETU8zYlFjSlRuVUY5T1FCNDlVNktTTFg4cU5ibThNMzdUQlhLTTJkenNO?=
 =?utf-8?B?cHJXZmY2U3pJbzl5bEVrK3FNR1lzdGI5OVlRK0p0WVNQSU1mNmZnaTlnZ3d1?=
 =?utf-8?B?Q0lLMjZlaDE1UWptaVgwNzVhNzgzcHpQaklVa2RTa2NYUHN5ZlY0SytodE8z?=
 =?utf-8?B?bmpVajRJTG0rUDAwbTRwVkFNMVlqUjF3ZHF5VTZrTks5UGg3amhNTW9MTzBJ?=
 =?utf-8?B?alZUNVlSU1MwLzB6UGNTRXhWWVl0dXNCci9wbnloSkFrejFlc2FvZjNHUUxl?=
 =?utf-8?B?NkloRG9aOTBDdjdaNjNxTmF0WXlSc2dZOVdzL2k1RktmV3RGdTh3S2hPUDAv?=
 =?utf-8?B?WVFVL2wvNlpoL01FS3pYZ3pEdUJZNzhGR1BNZi93UlgrSmN3dS9qSEVHaGFC?=
 =?utf-8?B?c1VLNWlOZ1hJeU5DY212a2dEM1UvOUl3ei9XK3dpVmE0TUZpOEpXQUQ4U1pW?=
 =?utf-8?B?ck9ZSjY1WmpmNHZpc2lpVDdWM3I1TkxGc3I5UStJN3ZrOWJZZElDMXF0a05Y?=
 =?utf-8?B?VXEzemxpa2RveWxucXV2QnBQRlNZVS9GbERKb2hXTlRzcER2ZXhYVm81aW5t?=
 =?utf-8?B?ajRZOGNLRnFMUEJmUUpYb3oyN0JWbmZVM1daaU45UTRwTThXb3dHTFBwTm1j?=
 =?utf-8?B?YXRRWkpQUFB0eXgyenNxZStRcmVhajFUQUF1ZWVmK0duRVdPRVJCZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <577EE643E46B5A40916655B0FE9ADC19@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a12ee64e-dc20-47bb-4585-08d99ec29d54
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 12:08:14.8751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U37lTXXWEarzLtYUJddE1sU5DfAUcwzk30dlivJJSxk/5SNwmqDZXCmIdV0pUOHz/+8xolGJb8gYe4haRNtnFHyJDr+uBIh2M7Yjlpl6owkift/LJqprztkV0pmHJkVk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6068
X-Proofpoint-ORIG-GUID: xNYd0T47cNiD9TdzmF6AJTcwfpV3TdX4
X-Proofpoint-GUID: xNYd0T47cNiD9TdzmF6AJTcwfpV3TdX4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-03_03,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111030070

DQoNCk9uIDAzLjExLjIxIDAwOjQ3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+IE9uIFR1
ZSwgMiBOb3YgMjAyMSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBP
bGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+
DQo+Pg0KPj4gV2hpbGUgaW4gdlBDSSBNTUlPIHRyYXAgaGFuZGxlcnMgZm9yIHRoZSBndWVzdCBQ
Q0kgaG9zdCBicmlkZ2UgaXQgaXMgbm90DQo+PiBlbm91Z2ggZm9yIFNCREYgdHJhbnNsYXRpb24g
dG8gc2ltcGx5IGNhbGwgVlBDSV9FQ0FNX0JERihpbmZvLT5ncGEpIGFzDQo+PiB0aGUgYmFzZSBh
ZGRyZXNzIG1heSBub3QgYmUgYWxpZ25lZCBpbiB0aGUgd2F5IHRoYXQgdGhlIHRyYW5zbGF0aW9u
DQo+PiBhbHdheXMgd29yay4gSWYgbm90IGFkanVzdGVkIHdpdGggcmVzcGVjdCB0byB0aGUgYmFz
ZSBhZGRyZXNzIGl0IG1heSBub3QgYmUNCj4+IGFibGUgdG8gcHJvcGVybHkgY29udmVydCBTQkRG
Lg0KPj4gRml4IHRoaXMgYnkgYWRqdXN0aW5nIHRoZSBncGEgd2l0aCByZXNwZWN0IHRvIHRoZSBo
b3N0IGJyaWRnZSBiYXNlIGFkZHJlc3MNCj4+IGluIGEgd2F5IGFzIGl0IGlzIGRvbmUgZm9yIHg4
Ni4NCj4+DQo+PiBQbGVhc2Ugbm90ZSwgdGhhdCB0aGlzIGNoYW5nZSBpcyBub3Qgc3RyaWN0bHkg
cmVxdWlyZWQgZ2l2ZW4gdGhlIGN1cnJlbnQNCj4+IHZhbHVlIG9mIEdVRVNUX1ZQQ0lfRUNBTV9C
QVNFIHdoaWNoIGhhcyBiaXRzIDAgdG8gMjcgY2xlYXIsIGJ1dCBjb3VsZCBjYXVzZQ0KPj4gaXNz
dWVzIGlmIHN1Y2ggdmFsdWUgaXMgY2hhbmdlZCwgb3Igd2hlbiBoYW5kbGVycyBmb3IgZG9tMCBF
Q0FNDQo+PiByZWdpb25zIGFyZSBhZGRlZCBhcyB0aG9zZSB3aWxsIGJlIG1hcHBlZCBvdmVyIGV4
aXN0aW5nIGhhcmR3YXJlDQo+PiByZWdpb25zIHRoYXQgY291bGQgdXNlIG5vbi1hbGlnbmVkIGJh
c2UgYWRkcmVzc2VzLg0KPj4NCj4+IEZpeGVzOiBkNTkxNjhkYzA1YTUgKCJ4ZW4vYXJtOiBFbmFi
bGUgdGhlIGV4aXN0aW5nIHg4NiB2aXJ0dWFsIFBDSSBzdXBwb3J0IGZvciBBUk0iKQ0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVz
aGNoZW5rb0BlcGFtLmNvbT4NCj4gQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4NCj4NCj4gQWxzbywgSWFuIGFscmVhZHkgZ2F2ZSBoaXMgcmVsZWFz
ZS1hY2suDQpUaGFuayB5b3UsDQpEbyBJIG5lZWQgdG8gcmVzZW5kIHRoZSBwYXRjaCB3aXRoIEFj
a3M/IE9yIGhvcGVmdWxseSB0aG9zZSBjYW4gYmUgYXBwbGllZA0Kb24gY29tbWl0Pw0KPg0KPg0K
Pj4gLS0tDQo+PiBTaW5jZSB2MToNCj4+ICAgLSB1cGRhdGVkIGNvbW1pdCBtZXNzYWdlIChSb2dl
cikNCj4+DQo+PiBUaGlzIHBhdGNoIGFpbXMgZm9yIDQuMTYgcmVsZWFzZS4NCj4+IEJlbmVmaXRz
Og0KPj4gRml4IHBvdGVudGlhbCBidWcgYW5kIGNsZWFyIHRoZSB3YXkgZm9yIGZ1cnRoZXIgUENJ
IHBhc3N0aHJvdWdoDQo+PiBkZXZlbG9wbWVudC4NCj4+IFJpc2tzOg0KPj4gTm9uZSBhcyB0aGUg
Y2hhbmdlIGRvZXNuJ3QgY2hhbmdlIHRoZSBiZWhhdmlvdXIgb2YgdGhlIGN1cnJlbnQgY29kZSwN
Cj4+IGJ1dCBicmluZ3MgY2xhcml0eSBpbnRvIFNCREYgY2FsY3VsYXRpb24uDQo+PiAtLS0NCj4+
ICAgeGVuL2FyY2gvYXJtL3ZwY2kuYyB8IDQgKystLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vdnBjaS5jIGIveGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4gaW5kZXggOGY0MGEwZGVjNmQy
Li4yM2Y0NTM4NmY0YjMgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdnBjaS5jDQo+PiAr
KysgYi94ZW4vYXJjaC9hcm0vdnBjaS5jDQo+PiBAQCAtMjQsNyArMjQsNyBAQCBzdGF0aWMgaW50
IHZwY2lfbW1pb19yZWFkKHN0cnVjdCB2Y3B1ICp2LCBtbWlvX2luZm9fdCAqaW5mbywNCj4+ICAg
ICAgIHVuc2lnbmVkIGxvbmcgZGF0YTsNCj4+ICAgDQo+PiAgICAgICAvKiBXZSBpZ25vcmUgc2Vn
bWVudCBwYXJ0IGFuZCBhbHdheXMgaGFuZGxlIHNlZ21lbnQgMCAqLw0KPj4gLSAgICBzYmRmLnNi
ZGYgPSBWUENJX0VDQU1fQkRGKGluZm8tPmdwYSk7DQo+PiArICAgIHNiZGYuc2JkZiA9IFZQQ0lf
RUNBTV9CREYoaW5mby0+Z3BhIC0gR1VFU1RfVlBDSV9FQ0FNX0JBU0UpOw0KPj4gICANCj4+ICAg
ICAgIGlmICggdnBjaV9lY2FtX3JlYWQoc2JkZiwgRUNBTV9SRUdfT0ZGU0VUKGluZm8tPmdwYSks
DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIDFVIDw8IGluZm8tPmRhYnQuc2l6ZSwgJmRh
dGEpICkNCj4+IEBAIC00NCw3ICs0NCw3IEBAIHN0YXRpYyBpbnQgdnBjaV9tbWlvX3dyaXRlKHN0
cnVjdCB2Y3B1ICp2LCBtbWlvX2luZm9fdCAqaW5mbywNCj4+ICAgICAgIHBjaV9zYmRmX3Qgc2Jk
ZjsNCj4+ICAgDQo+PiAgICAgICAvKiBXZSBpZ25vcmUgc2VnbWVudCBwYXJ0IGFuZCBhbHdheXMg
aGFuZGxlIHNlZ21lbnQgMCAqLw0KPj4gLSAgICBzYmRmLnNiZGYgPSBWUENJX0VDQU1fQkRGKGlu
Zm8tPmdwYSk7DQo+PiArICAgIHNiZGYuc2JkZiA9IFZQQ0lfRUNBTV9CREYoaW5mby0+Z3BhIC0g
R1VFU1RfVlBDSV9FQ0FNX0JBU0UpOw0KPj4gICANCj4+ICAgICAgIHJldHVybiB2cGNpX2VjYW1f
d3JpdGUoc2JkZiwgRUNBTV9SRUdfT0ZGU0VUKGluZm8tPmdwYSksDQo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDFVIDw8IGluZm8tPmRhYnQuc2l6ZSwgcik7DQo+PiAtLSANCj4+IDIu
MjUuMQ0KPj4NCg==

