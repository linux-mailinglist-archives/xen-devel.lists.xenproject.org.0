Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C79EB45705C
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 15:10:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227982.394465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4ag-0006hQ-Ms; Fri, 19 Nov 2021 14:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227982.394465; Fri, 19 Nov 2021 14:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4ag-0006fe-JT; Fri, 19 Nov 2021 14:10:10 +0000
Received: by outflank-mailman (input) for mailman id 227982;
 Fri, 19 Nov 2021 14:10:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W8RP=QG=epam.com=prvs=19578d545c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mo4af-0006fY-9y
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 14:10:09 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66125cca-4942-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 15:10:08 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJE2tbO029529;
 Fri, 19 Nov 2021 14:10:04 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2054.outbound.protection.outlook.com [104.47.1.54])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cecwvg3w9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 14:10:03 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5011.eurprd03.prod.outlook.com (2603:10a6:208:101::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 14:09:56 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 14:09:56 +0000
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
X-Inumbo-ID: 66125cca-4942-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGsp4zy7uxyoweyjLMfv66CyjD81NwkXOngYFVWW7NIJNdg9EcjNE97QhbmPgYNXB4+ZrTjfssU1uCQ9ySDqHesHx3g8RUXhN4RTr3zKw7kNVtTfYYbE3ynZ7KbnkxKGIB9OmWdOvYmGtoi2ZDzGOZqwTX+rayOD5nqiZnEyc58Eg1ibvDRBgNeP/0Hz+aHtaf7F3d4VJj9NjkTXj+D30JWjy/4Zffkd6ryCZ6fzpFXthWXfDvMa7561H3sYFUTiSWDpYCoJQhOA2b9L8xH1xIdYCD5B7wlydqZifYVFMKSH7a/5E21+WcUm8q0574ijr/6CLFmd9QaTJNhAjyVvXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enHaVuO1OJO5Oi5HKjymxZ+g0jN4HNM6XFe8TazavlE=;
 b=hbugRRcyD/uaQjuzMxUFschX8PuzQuRaSJ9GzXTMtBjtCNOBGL6fRVT4Ac6a6b04J2K9fS0gItRqH5umm8/mi23Q/PMmo8QBNwJfaGipzuUw3o+0jSvhlYwAEYLQakhCDyTmawTSpIilwN79Io3ErlQdF1qeHEjZGrdYBXyzDHeD8MIjzgmTrb6q2M2LNBwjaWca7qOxiMaXprsLEfDYTq8iqGjnLXJ34faMC5qpMgWEzSC00OGQVsJGPC6k+bkLVuakMzI/kVVlCK8h3esZhhIu7iOgOhaYsjjLlOZRvq3JLTUQeyun7ycU1LU3wyLSI3bklTNgzLyqIZCRHd926w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enHaVuO1OJO5Oi5HKjymxZ+g0jN4HNM6XFe8TazavlE=;
 b=D0r6UAiyWTPH4SPHrTo6C5GfDsFgtn8bl7tqqMGbVuFC1hs0/HrGe5ZJ7b6U/GpBO1mDTr9mEE/uiIHyafrk0KPiNXgeqlN/zxT/heBX0Kg0SqSOt7Ph9SiKkzGKXvcKtNL2y303Vme7YzRTBwmSrzfWXR9Xm4cP+TwcSSqOsGO1mmLP6VJ+xx1OW0Uc8PpfQ8h95r9qIsGcrnj1xxjj5jMmlncDSNztLOw2TMoYQI7aHcMjWr9TzYt6iaFFuL3q4S+gqDb0FCa6BVckG62kXtUZaZR2Z0Qys3KJQbdfTBGrxvE4JrxOC12nyCjsUM/u+vy3tqRTpUYqT5Uxl/FOKA==
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
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 06/11] vpci/header: handle p2m range sets per BAR
Thread-Topic: [PATCH v4 06/11] vpci/header: handle p2m range sets per BAR
Thread-Index: AQHX0hJLwt+wJ2t1lka5jlbMIq7ZAqwK60SAgAAG0YCAAASpAIAAA16A
Date: Fri, 19 Nov 2021 14:09:56 +0000
Message-ID: <8bd7e778-6ebd-2f50-8e96-e21b3bf06a11@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-7-andr2000@gmail.com>
 <3a7f4c3a-7162-8cd3-0879-2f87572f0225@suse.com>
 <6b2d4825-3b00-4034-2804-a44059de15a1@epam.com>
 <fb72cae2-1b7e-8d52-48d0-2967c68325ea@suse.com>
In-Reply-To: <fb72cae2-1b7e-8d52-48d0-2967c68325ea@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2dfd123f-2510-482d-102c-08d9ab664406
x-ms-traffictypediagnostic: AM0PR03MB5011:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5011FFF1BE4FFDA11E4D153FE79C9@AM0PR03MB5011.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EOX4eJcnIUazd45LolMUuCnLl9dP2VY23FhT19ii7bPnqQiSablOtgYfG+yOSSYQNFH6W4lXaf2Uh7FPcqLp+tmlwwz6CE6vWBT475/fHUe/h9aoDhS1tnwh9PEmm/vAtC/5H2++YBF8DWwg0kFmGgdOgnV2+GwMhvquE9Jq54lHitm8K2lNbntj7vVq8/HzuzpLStIl6sez8fUvhmcYQTUGQm0B+rW4SwC5tm/apGvV/ggxfPX7L/2fzTTXXl+InDYnFc4uNaix4Dodm4wUL3qAV+a0A4P+HAU/8C9xTTVJGJNqDU1XgqFqCw0Py6bBqlMtsJIazhO5LzgNJQg9EyyGukOG/R2o+GIlJCgW+af2KT4wHA/uKu2wNLSCTmSk5ceDoJDNSrJO8uDEUQTT9Ygik/pEFNloZyAkhpvmgcc3Vur8xAtLwO9t6QfjCuz193oQ4ehrfbKzLYPAOWd9HsVDoM2mat6cZcnsKeROqbsM/xJE5xbH1aUNRycEScuyHzisUdnNvEvL2oWgew7mB3Beww9XdVr4FY3gQd62qOFLeLp/gEMQWTzXf67rhPBJLfzuTWxpuX+odDWRnY8xzK/FgXhOJ5a+N/bxA4oUdQrK2t1SuHfyxS/BVAXg8i6TOOdHc9peaGEUrwD6Ys/aVKP1uX3bhcarPczNTfmmWGPxubwkgYCY451/A17Jsb7UPCC5PuZlJv63oC6RA7CmENMzX4dsiS0lGX/WKBxqVZPTGMM6x5Sz4CcRgv2QDLzU
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(8676002)(2616005)(54906003)(71200400001)(66946007)(36756003)(107886003)(26005)(31696002)(2906002)(38100700002)(4326008)(76116006)(7416002)(508600001)(91956017)(86362001)(5660300002)(66476007)(6506007)(31686004)(6916009)(64756008)(53546011)(66556008)(6512007)(83380400001)(316002)(6486002)(8936002)(66446008)(38070700005)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Tng2SXhLM295MXpOV01Wd3lrdkJaa3VSMHhwNEtjUDBDcE1LTmpaNDd1c3lw?=
 =?utf-8?B?Mkd3QkhMZ2lBcXZFejBDNm02bEN1K1RORmlObFNxM0V4T09sNXdrVFJtUm8v?=
 =?utf-8?B?K0xWMEdkNS8vS0JvM0VPQjNDcnpQRXE3VGpVMC9WNWc1M2JsU2lzOHkvdkFI?=
 =?utf-8?B?WEpsU2JFeFNTSEJjcW5KaW1wMURQRmtDMjhMenFrcGxWeFk5TTAxRmduVGNw?=
 =?utf-8?B?YktCdEZyL0xuSXo3cE9nRHlLYWw0bjNYS1JnMUo2TkFxN1VsdzZzaGtHamQ0?=
 =?utf-8?B?UkJ6T294VmhEY2U2Qlg1THo4L2NjNTU0L0wyOUZYYWhOY1BJM2RMeUtScndW?=
 =?utf-8?B?cjlPd0l0c0kwTy9ubXNOcStKcTJLb1ZlR2pmTVVjTi81WGVOZFVDd1FxRFVY?=
 =?utf-8?B?TGFPNDRkWjFTMmF1dFZrMzM2QTRDL2M5NmNtcS91UEtPVEtEV3B5MmdQQnVl?=
 =?utf-8?B?ajg5RkxxbUZOMmJESm41TVZLUCtEWWxMR0F4QmZ6Mjc5NnUvMjYyVFU1bytI?=
 =?utf-8?B?eVozaGVmWlVoTU5WWlEwQzIvWHJ1KytyZlJBS3JBWmhoTTlqbVdMKzc1eDRX?=
 =?utf-8?B?OElWbWEvaXdCc2t0Vm5zUW1DcnQwWFY0MjJabWE0dGFrUDJjZE91dk95ZWNp?=
 =?utf-8?B?M0Fta1ZZbHFlcitzNGx5OTlGc1c5TFhHU1V1SGcvQmtuc1UrQVhIN2M1Q3ZV?=
 =?utf-8?B?RzhxSTZxdUYvck84UUIwS2JnbVhFeU9majNJTWEzeDlwMWpuUWxGSTlqalRw?=
 =?utf-8?B?bFpZVExBNEpOWGdsQWxydjNNd3crYXgrdjNyZG9YVUJqcGl0dnoyeVFaRC8r?=
 =?utf-8?B?SDRwc1BBaFRrUS9ta3BUWDFaNEpBTFpML3I2OCszQnozMG9KWld0RExBTEEy?=
 =?utf-8?B?R3QzaTU4M0ZLOHNOODFLUmhDMkhtUjBPU04wekZQeURvZjNjaHlPZVA2bDQv?=
 =?utf-8?B?VHNwYnRHa3d6cndyMnFuSTlsanBzb1hmWndXM3hRa3FYTFlRTnJ0eGZGeHFC?=
 =?utf-8?B?VjlGcU5lb2phdmVoQVZnaktLV2FYSWptZzZvR3lVN0xiZG5uTEdiRlNtbzFK?=
 =?utf-8?B?WEwvMS9LNkNRL2loTDNYRzVpMm1PdUhValVXUWdCQWhiakhQcDJIV1NaQy9R?=
 =?utf-8?B?RUsvakZQbjRQVEphdUZrUUJUdS9xdUxXaEFGNEdqVDBXeTF1YWRMMkc2cEg4?=
 =?utf-8?B?TWQyYjhrVWo0Tjh4ZndoTURSMUMrVDFJWUJHdFF2dTF5enN0aW9vYm83cCtV?=
 =?utf-8?B?U1NNeUdkbzhqemY3MzRGMytyK3k2d2NJMjZNdUpFalcvaGNibzhzcU5sYTNN?=
 =?utf-8?B?V0k2aVhTNXo4MUhjQ3VWVGVBSU5mOWhIR2JtM2hJWHQySVE0L29hd2ZsdkVx?=
 =?utf-8?B?SHgrWHpDTXFWZUk0VGVlTTNGckN3bGg2ZTVqT1J0dmROMEI3YUVsek1zdjNw?=
 =?utf-8?B?dTBmYUM4ZjMxdHFDUlUxTVJsVVl0RVZISCsxSWIrN1ovWFV0OG1oRnV5WU5m?=
 =?utf-8?B?Rkl3eXNLVHlqaVdkM01Ia3FGSllCbEdYMGRhTWRPUndKQmowZFRwd1YvdjRv?=
 =?utf-8?B?MVU0UXFEdlRFZ0RSSDhILzdTY2JKTGxqdkVzdUZ5ZGpPVnIySEh0Mm1zSUNs?=
 =?utf-8?B?S2VtWEo0M2RDcGxpekU0c2k3eFhaTityMVp5MzBSby9tZTVYUVJMWFdRaVI5?=
 =?utf-8?B?TnMwZVdVN0VEN0c5RnVvczR1ZkN4TG5lTjhENkdRRmx4SE5jYVZDcCtsdm9Y?=
 =?utf-8?B?Yko5ek9wamN3RjJ6VWdDTmVkSjdWVXE4alZRdjZiellpa2V2RHNQU3FMYW53?=
 =?utf-8?B?YlFKbEN3ZWpIdjVObjJTWkRBNHR3VnRmK28xOGxKWm44TG5LeE5GSWRLRkU3?=
 =?utf-8?B?aUU2ZE1ZRzg4ZkRxZmRqZnpXYlFzLzVwNG1qcVM0VXpVS0I1WDNGc0tzUmFm?=
 =?utf-8?B?NllsbkNVcUQvaWRmYkIvYlNVWFV3WEZVTEQ0N05uelpoeElHM0g5VWZiRk9I?=
 =?utf-8?B?UjdHU2h4V0FHUkVzZS90Vm5kbjRmYWUveXBNYVFqdGFuS2ovT21sUit3c1lG?=
 =?utf-8?B?NUh3YU1yMDd4Ym01NU1MaXNQMkdwdU1HRklhM0V3N2J4OTM3SWREWlEwMDVl?=
 =?utf-8?B?TlUxbUM5R1pubmdaTWQ5UzJNTXJlOEtKRlRHdzRkOWgzb0dJbEp3eEd5M2hm?=
 =?utf-8?B?THQyOStFM2N1bGtxelFmZzA1RXhyRWovcTV1bHovSGJrRUZPVlhyTEE1QWJw?=
 =?utf-8?B?OWJqdUMwNTZqVFRxYUxJTTVHWlpjYmxWa0ZuU1lGdzAzSWJCQ2trMGQ2MWRP?=
 =?utf-8?B?NFhUSFgxd1diVlZWblN1T1NQQ2s1ckdrM2R0MWN1Rmx4TDhOVjdNQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FBA5A312804484C927996DA07175432@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dfd123f-2510-482d-102c-08d9ab664406
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 14:09:56.4235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K0tnr74cyiIB70OS29tSiSC8bBDG5ZHu1kzIZeneAJJRHyr7gg3c3d9VwEOU1m2otl7UXNzntzXbKuwk4B8n+1KXld8lufC9RVt2Mi0umRCm8GCyCaIRlUhWcsTOWzrt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5011
X-Proofpoint-GUID: 9_zIUECxBKnFT1_KscCXomstRsQZUMl0
X-Proofpoint-ORIG-GUID: 9_zIUECxBKnFT1_KscCXomstRsQZUMl0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 mlxscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=864
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190079

DQoNCk9uIDE5LjExLjIxIDE1OjU3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTkuMTEuMjAy
MSAxNDo0MSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMTkuMTEu
MjEgMTU6MTYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA1LjExLjIwMjEgMDc6NTYsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBAQCAtOTUsMTAgKzEwMiwyNSBAQCBp
bnQgdnBjaV9hZGRfaGFuZGxlcnMoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+ICAgICAgICBJ
TklUX0xJU1RfSEVBRCgmcGRldi0+dnBjaS0+aGFuZGxlcnMpOw0KPj4+PiAgICAgICAgc3Bpbl9s
b2NrX2luaXQoJnBkZXYtPnZwY2ktPmxvY2spOw0KPj4+PiAgICANCj4+Pj4gKyAgICBoZWFkZXIg
PSAmcGRldi0+dnBjaS0+aGVhZGVyOw0KPj4+PiArICAgIGZvciAoIGkgPSAwOyBpIDwgQVJSQVlf
U0laRShoZWFkZXItPmJhcnMpOyBpKysgKQ0KPj4+PiArICAgIHsNCj4+Pj4gKyAgICAgICAgc3Ry
dWN0IHZwY2lfYmFyICpiYXIgPSAmaGVhZGVyLT5iYXJzW2ldOw0KPj4+PiArDQo+Pj4+ICsgICAg
ICAgIGJhci0+bWVtID0gcmFuZ2VzZXRfbmV3KE5VTEwsIE5VTEwsIDApOw0KPj4+IEkgZG9uJ3Qg
cmVjYWxsIHdoeSBhbiBhbm9ueW1vdXMgcmFuZ2Ugc2V0IHdhcyBjaG9zZW4gYmFjayBhdCB0aGUg
dGltZQ0KPj4+IHdoZW4gdlBDSSB3YXMgZmlyc3QgaW1wbGVtZW50ZWQsIGJ1dCBJIHRoaW5rIHRo
aXMgbmVlZHMgdG8gYmUgY2hhbmdlZA0KPj4+IG5vdyB0aGF0IERvbVUtcyBnZXQgc3VwcG9ydGVk
LiBXaGV0aGVyIHlvdSBkbyBzbyByaWdodCBoZXJlIG9yIGluIGENCj4+PiBwcmVyZXEgcGF0Y2gg
aXMgc2Vjb25kYXJ5IHRvIG1lLiBJdCBtYXkgYmUgZGVzaXJhYmxlIHRvIGV4Y2x1ZGUgdGhlbQ0K
Pj4+IGZyb20gcmFuZ2VzZXRfZG9tYWluX3ByaW50aygpICh3aGljaCB3b3VsZCBsaWtlbHkgcmVx
dWlyZSBhIG5ldw0KPj4+IFJBTkdFU0VURl8qIGZsYWcpLCBidXQgSSB0aGluayBzdWNoIHJlc291
cmNlcyBzaG91bGQgYmUgYXNzb2NpYXRlZA0KPj4+IHdpdGggdGhlaXIgZG9tYWlucy4NCj4+IFdo
YXQgd291bGQgYmUgdGhlIHByb3BlciBuYW1lIGZvciBzdWNoIGEgcmFuZ2Ugc2V0IHRoZW4/DQo+
PiAidnBjaV9iYXIiPw0KPiBFLmcuIGJiOmRkLmY6QkFSbg0KSG0sIGluZGVlZA0KSSBjYW4gb25s
eSBzZWUgYSBzaW5nbGUgZmxhZyBSQU5HRVNFVEZfcHJldHR5cHJpbnRfaGV4IHdoaWNoIHRlbGxz
DQoqaG93KiB0byBwcmludCwgYnV0IEkgY2FuJ3Qgc2VlIGFueSBsaW1pdGF0aW9uIGluICp3aGF0
KiB0byBwcmludC4NClNvLCBkbyB5b3UgbWVhbiBJIHdhbnQgc29tZSBsb2dpYyB0byBiZSBpbXBs
ZW1lbnRlZCBpbg0KcmFuZ2VzZXRfZG9tYWluX3ByaW50ayBzbyBpdCBrbm93cyB0aGF0IHRoaXMg
ZW50cnkgbmVlZHMgdG8gYmUgc2tpcHBlZA0Kd2hpbGUgcHJpbnRpbmc/IFJBTkdFU0VURl9za2lw
X3ByaW50Pw0KPg0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

