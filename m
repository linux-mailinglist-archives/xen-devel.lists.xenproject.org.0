Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D61442BAE
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 11:29:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219982.381060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhr2X-0004D4-L6; Tue, 02 Nov 2021 10:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219982.381060; Tue, 02 Nov 2021 10:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhr2X-0004B8-Hd; Tue, 02 Nov 2021 10:29:13 +0000
Received: by outflank-mailman (input) for mailman id 219982;
 Tue, 02 Nov 2021 10:29:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8XNU=PV=epam.com=prvs=19406420d3=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mhr2V-0004At-Oi
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 10:29:11 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a0f54b3-c330-4c75-af1a-83f0f7dcacb8;
 Tue, 02 Nov 2021 10:29:10 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A2AJpkc014024;
 Tue, 2 Nov 2021 10:29:08 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3c33fxg1ny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 10:29:07 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5698.eurprd03.prod.outlook.com (2603:10a6:208:171::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Tue, 2 Nov
 2021 10:29:03 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 10:29:03 +0000
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
X-Inumbo-ID: 5a0f54b3-c330-4c75-af1a-83f0f7dcacb8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+LCeU6pdr28Tp/VLYSk16RbAEafH3tC2XbkMC+KrCkknCgYuU7K8fiER8y/spO/EG5x+Du8IN+6at5Frb0OwgNjgeVkTB8Oa23DLuRkV9a+LIPktj4LsmWyht1UAgZtjSTZvdZxBPck5mEqpLNICerkZrJvu/52bx+fldxXuopt2mNkPlL+JLV5KLsAEi33IhwLPhlmv4vojl2RI9tiluNjYwPeMhOXnVeufXwGcBzeBLVehTCByRTtAIlZXkg5Z4X4Idl3n7legoeVoq8cAg9mejICWnLtpnefcIqqb1A1uFvPff5tygRY0Or1x+HIJNYhVKsP3lDbMI616MquMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHMJrkyGettprKv+VsATIUw9+3BknaR8awZ7JbiSOUY=;
 b=njOdmPOPRw2B3fWLq/oGbhBK7KQf5VFwo5R5jfEO65mAVyG/isFHAfy//3w+BRTqjW0k6FmbPqwuN3LY1PIBqhuHvJdQoisQOJl5DsiLnIQzJZKfY6Pg8et/Kp6wEXKIaf3z+XyfCKa004FJgzO/Atd1/rBiDduC4uBtbmwURNHk5Q3e/9jtG0E9mzgol7FVyWMrBKmTI4OleoGAAP+jb5Cl3jldDbmDQqokmiVRIULzZaVlapDO9J7oMxm79S4B9Vv9xHj8nE1t/9SRX2tIPzUDTllPcnpfUUvU1cHQJkIYX52R8LD2q1/OeZ7P6jnY/GtFMa36MknviUiAVUYOMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHMJrkyGettprKv+VsATIUw9+3BknaR8awZ7JbiSOUY=;
 b=QAUBcileoyPeQ1PS6Tif3fd2lR3c31Ebblv8n9Rgu9E3hozF/56lYHbCdi8RUut+htX/YSXsgCFgDfbyvK+PYUkyBwv7FiWuRH2aaIFwuOl1eAGJWqTu1AY0g3eLNd2Ni6VoFGj1z+c9p7QrKoXBCYX84Ug6oaKaUKzO4MvORoZPChgSzb9KrEGOtL1VpkFgWA15i3vr/5W1zMgvNakgGp79y7QlZyaViqLz1nrEVd0bfrmXB3dfu6jCaU4Ppl1pSvo4Co/N7lD2rLHe7oKjJaUli1VIQoUgABgeNA6fFNZcYA2SwcxXdcmQW937aNPSbBCYSh4oUhhxynz6xbuI4g==
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
Subject: Re: [PATCH v3 04/11] vpci/header: Add and remove register handlers
 dynamically
Thread-Topic: [PATCH v3 04/11] vpci/header: Add and remove register handlers
 dynamically
Thread-Index: AQHXtdAhL3wGQmCTxkGG8eG4L2Ylc6vkA8CAgAqTbQCAAZ7XAIAAB0QA
Date: Tue, 2 Nov 2021 10:29:02 +0000
Message-ID: <15c0fdd5-5e59-971f-2a78-30d5c20abd93@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-5-andr2000@gmail.com>
 <YXbRsbzLxZs94v0Z@MacBook-Air-de-Roger.local>
 <ba1fea82-e2db-89af-b48d-56d393bd4ce8@epam.com>
 <YYEM1lX8NhK7nfhj@Air-de-Roger>
In-Reply-To: <YYEM1lX8NhK7nfhj@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a81fd26-87f5-4a0b-66e9-08d99deb974f
x-ms-traffictypediagnostic: AM0PR03MB5698:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5698C555D692C5E4D7518D22E78B9@AM0PR03MB5698.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qyFhbORYLMY36tWkb99jYDoaExtrMe6OoiAtOlHYcO7MH8UjhbX7l4GW2jyiQNKbgnYsgkoy3tgfmZLQ+GVr2JyIvNuqvuDl0Jmo1Y1dp7NfvBILrc0Brv6JDf4iv51DmhfCv4nHGi7I/0+ZOOinjbjip25KFTwxhGA41Jo5fKrPxLOjJnOtJQEpDlMD1h1MG6Z4fDaI9UPseP4K6yvqOZC6yrO8svDY4dTvlaGyhl40dzZ4v/4VcyFjrBmchx2hMvxro1xr6VTw+AJsvTGOCiRO7uqouxMeh8F133AEEpG4cLRmXFAL0XRA1RDVJi3hPXSKz8jmkv3YnU8tqKsluvoXcVCmFVjAJH1aCbrBgPwKIE7aTgnc8Ic3xIpGwFtbhgZgRcHtdHKT7NTVjC8dGXQY3ZYt2fEe47tVpGRamPRjT/OKM5y/FxrMo8Br+nO6WMommIDfBFItCo0Xzpz4xzVoNRoaG3EjPQszOvSbsbNycd2MJxUTxQ37YlgW28ywhShK1CwOZ8taSMe0CULqfqofCPIQRrGA+OaIbxd8pukwmaKl7SG6QBu5tGFk61kneM7dcD9qa2RlxNu+IXMTmBCuhE7xzbGkG4NFMhH+yBlXCt2b0Gt/ANZTCaXvQ3HcR6VO3aK4DvGNBUF3uI3JYrFthZKLNF3tApyGruwNNf7dVtxKzbRp8jRa8Jx2JUdxBOdXaUYkkXpmhAsEu5/N+VHMLsbQ6g3pSN+tZP06G4cBs+Mn3DH3fwnJA+1QHRh/GYNkWG93EO/ePKQik3H19FFnYpW6NvpFUy+OWvYilpfrif88ELxhhZMh6TTGWSS5aqbqDhxzT/QgLMTG7vsNoA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(8676002)(66946007)(26005)(2616005)(91956017)(76116006)(6512007)(71200400001)(86362001)(36756003)(6916009)(54906003)(38070700005)(66556008)(966005)(64756008)(6486002)(66446008)(31686004)(38100700002)(122000001)(316002)(508600001)(5660300002)(66476007)(6506007)(4326008)(8936002)(31696002)(53546011)(186003)(107886003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YWFvQ2Z5UG9YeHBQVVpSQmFkWi9zU3YvbTF4MzM2Y1A4Qk9odFJ6b0RlNTdm?=
 =?utf-8?B?STlBbjJrRWRYOWJlM3VaRmpYSko4dW1JWGhTOVc1amcyQ3dOZW51eU9SVnZ6?=
 =?utf-8?B?VUZCYVliNUgveTJTWnJ6ZmtadUp5UHlTeVNwWjNIbHZLUStZYzU1VVRBSFZJ?=
 =?utf-8?B?VmoycnNQYmg3ajVXcm95VGJuckFQKy9aVWx5SXBrTkZNTkdJVkhUWWxYV0lv?=
 =?utf-8?B?YWZxUkJYK1hEU0VMN3N6QUswQjB1UmFkZHlpUi9PS0NIOGRQRFJ6NHZjNmZJ?=
 =?utf-8?B?a1dpVk42VGx1V2ZEOXNLcEFUMTBkMGtNelc4amJlVlpkRUtaNTFWWG8ydWU0?=
 =?utf-8?B?cTc5Z2JUME0xM0s3eUQrUTdiRkN2WFY1bEE2OS82SVBhU09FWGM0VDZyT1d2?=
 =?utf-8?B?T3pzVWpnTTVDTncyWXhRV1pZOFZ4MzNNOExtZTU2NjF6eGFIQkozYSs2YU9t?=
 =?utf-8?B?TXpyeENSUnhLdVpyTFJSOE9HZFF6cmFZQTQ2cHYrNEZrWWdOT3Eza0IvbG5V?=
 =?utf-8?B?QVpxbGpkdHYwQU9nZ3NXTnlUTHhWMXRqWk5hQXI4KzZmY3hFR3VWQ0Jpd0N6?=
 =?utf-8?B?RjJTbCtTQ2VoT3hGTWdneGpDR0hCTzUwQjZPYnBhR2xLRlJoOVVZdnZDWFdG?=
 =?utf-8?B?R1Z1NVp4TnlVZGRNdlozTGVONWZSYmFHd2V4WjIvWVZSU1dxR253Y05yanJr?=
 =?utf-8?B?TjREOUtJUXVnZEhsVE9RQ1BER29NdG1zZytwekpyVmlUSXZPbFFYNWFreFRO?=
 =?utf-8?B?OXl6OFRsSWIyVzFQYWM3dkZtZnZvYU1VTFc2NFo3M1Z0Ykk5RjVuTGpzT1NM?=
 =?utf-8?B?Q2MyTFBpbW1aRGloUHBZT0NHekNueG5hTHlkaVR0ZzZ4czNjbGdURTlndWNk?=
 =?utf-8?B?OU9PbnhwMHNWUTk3RFFMazRPUnZlNWxTOXZld0hQUHJ6S3VScFZvNHJ3M0dw?=
 =?utf-8?B?YnozSjFLRVIzdk5RSUFZM0FxaUFsYU90dWorckgvZFFubFNVM0ozNHM1akxn?=
 =?utf-8?B?RmY4TXQ1eU9HZjhDeG1teFFXN2h4M2hlQnlYeFpxQnhQUy9pV2NZZHUzbk1t?=
 =?utf-8?B?V09XYkhnRFdGdmRxd2Nkdmg3QUNZd1g1ZGhDT2FEZnE4cTBxbmQrS3NWcXRG?=
 =?utf-8?B?emRpSGxLVzZPQWdvWGlydERQM3FzVU1laXl5R1RJME84dnlvZTk1cjN3b0Z5?=
 =?utf-8?B?SWorbWRjQ1FiSFN3TWhBQ1ZEckJMRlJiVmMyZjNlSTY0a2lzSGN2R1F1T1M5?=
 =?utf-8?B?VnpRQXFDeG1XSWdrak5qZS9KY0x2ekhmYmt2WEh3M1lDS2E1dTVBZERLcUVm?=
 =?utf-8?B?RzlHcDlIREN0UzRzVUJNeUN0ODR4UEoxWmN6SFJGbytLbWdDRVNJQXFhNG1G?=
 =?utf-8?B?LzRkVVJWeW5kdzA2c3RXMFlBbzZiSnNkM0crKzU2aHZwekZnTTNNR2ZmN0Va?=
 =?utf-8?B?eVY2ZzBJeFc0SkNXcWxOTEE5WWMrNFRDR0dsdk15QUM1TjV1d0tWeC8weXpZ?=
 =?utf-8?B?eVFDUDRlV29yekNsWlJmSHpGdCt1V1IwaEY2eGh6M2dFUVR3QkE4YUlYMVd0?=
 =?utf-8?B?eDRJMFVTblY4L0t2NHN3bC9UcDBzU0tmeTJjbThHMnVTV0llUjZlMXNvRERX?=
 =?utf-8?B?dlo1U2VQS1k4Vld1UG0yL0NyTk5hVXk2NHpHeXV6a0F3L29RUDc5c0hManI2?=
 =?utf-8?B?TFRCSGRFSVFHaFVjZG9meWZDa2hCYU8xNzdmNklEYzFDOVNndFJHNm5NWXBT?=
 =?utf-8?B?U2tDQkZsY3IwWkl4UnByTjJweFQvVlVTQndmZE9Mb3FhYWpuVmUvb2lpbGxJ?=
 =?utf-8?B?RVdMTEpsMzJLbXlLYWxsTVRKSUR0NGxPTWNtTjJFN1FxNDF1dzJoNkwzdG9D?=
 =?utf-8?B?Qk5YaDgxdjllMitoem9KRURiNTNGQkxzZytKeFFxTE5MeUFiM1pnUHZIMHdP?=
 =?utf-8?B?UHpPMERPdDk2MFJYNTR3UXFWbVIzNHdEcjY0eTRacTZmb2IvQ0hsZ1grckt6?=
 =?utf-8?B?Nkl4TDZ1bDJTUk9NQk1ibEN1eFI5bEhPUmlxZGFFdlFaZm1lUk0xeE9vV3ZF?=
 =?utf-8?B?MXJMU3d2TTJmUWxNaXpTREE3Mkllb25XVmlzOVdSN092Ym1vTU5YeGc3YmVH?=
 =?utf-8?B?SldiUkJHV3NESlcyZVZtWWZUeHNqZjdmaUdnYllCSzN3dUtIMFNpVXBXNFB4?=
 =?utf-8?B?UWgzWG52bjZJT1pKQTVpSk1YVzBCcWtJRjYwS1A3UkszYVdDa3p4YUU4TmJ3?=
 =?utf-8?B?aVZLTmZEMUFOeUpaeE9MajhwSUs3RXI0ZnBqdi9lSmFSZ0F5UkFNeVU2d3Uy?=
 =?utf-8?B?T1BDZ2xhcGZjOXJxcXJOV3hLYVU2a2sxak1uN0Ezb21jMFEraUt4Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9122F952237EAB4C928E2AF6752A3532@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a81fd26-87f5-4a0b-66e9-08d99deb974f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 10:29:02.9660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yrBu+UlzADPPKugFuDLeP57eXedStz3R7OmoNg7hHH6L2/JtuRe6x2zgTAWO90hLN8ncanmB9gCsSsQdZQIWix8zKxBZxxNFCKYbd132S3npXWleHfhdHYR46VxbTDA4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5698
X-Proofpoint-GUID: aRZmcDKbqlfeIkhLXdqv3inEm3isU4cS
X-Proofpoint-ORIG-GUID: aRZmcDKbqlfeIkhLXdqv3inEm3isU4cS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_06,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111020061

DQoNCk9uIDAyLjExLjIxIDEyOjAzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24s
IE5vdiAwMSwgMjAyMSBhdCAwOToxODoxN0FNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+Pj4gKyAgICBpZiAoIHJjICkNCj4+Pj4gKyAgICAgICAgZ2RwcmludGsoWEVO
TE9HX0VSUiwNCj4+Pj4gKyAgICAgICAgICAgICAgICAgIiVwcDogZmFpbGVkIHRvIGFkZCBCQVIg
aGFuZGxlcnMgZm9yIGRvbSVwZDogJWRcbiIsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICZwZGV2
LT5zYmRmLCBkLCByYyk7DQo+Pj4+ICsgICAgcmV0dXJuIHJjOw0KPj4+PiArfQ0KPj4+PiArDQo+
Pj4+ICtpbnQgdnBjaV9iYXJfcmVtb3ZlX2hhbmRsZXJzKGNvbnN0IHN0cnVjdCBkb21haW4gKmQs
IGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+PiArew0KPj4+PiArICAgIC8qIFJlbW92
ZSBwcmV2aW91c2x5IGFkZGVkIHJlZ2lzdGVycy4gKi8NCj4+Pj4gKyAgICB2cGNpX3JlbW92ZV9k
ZXZpY2VfcmVnaXN0ZXJzKHBkZXYpOw0KPj4+PiArICAgIHJldHVybiAwOw0KPj4+PiArfQ0KPj4+
PiArI2VuZGlmDQo+Pj4+ICsNCj4+Pj4gICAgLyoNCj4+Pj4gICAgICogTG9jYWwgdmFyaWFibGVz
Og0KPj4+PiAgICAgKiBtb2RlOiBDDQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNp
L3ZwY2kuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+Pj4+IGluZGV4IDBmZTg2Y2IzMGQy
My4uNzAyZjdiNWQ1ZGRhIDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2ku
Yw0KPj4+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4+PiBAQCAtOTUsNyArOTUs
NyBAQCBpbnQgdnBjaV9hc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIGNvbnN0IHN0cnVj
dCBwY2lfZGV2ICpkZXYpDQo+Pj4+ICAgICAgICBpZiAoIGlzX3N5c3RlbV9kb21haW4oZCkgfHwg
IWhhc192cGNpKGQpICkNCj4+Pj4gICAgICAgICAgICByZXR1cm4gMDsNCj4+Pj4gICAgDQo+Pj4+
IC0gICAgcmV0dXJuIDA7DQo+Pj4+ICsgICAgcmV0dXJuIHZwY2lfYmFyX2FkZF9oYW5kbGVycyhk
LCBkZXYpOw0KPj4+PiAgICB9DQo+Pj4+ICAgIA0KPj4+PiAgICAvKiBOb3RpZnkgdlBDSSB0aGF0
IGRldmljZSBpcyBkZS1hc3NpZ25lZCBmcm9tIGd1ZXN0LiAqLw0KPj4+PiBAQCAtMTA1LDcgKzEw
NSw3IEBAIGludCB2cGNpX2RlYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCBjb25zdCBz
dHJ1Y3QgcGNpX2RldiAqZGV2KQ0KPj4+PiAgICAgICAgaWYgKCBpc19zeXN0ZW1fZG9tYWluKGQp
IHx8ICFoYXNfdnBjaShkKSApDQo+Pj4+ICAgICAgICAgICAgcmV0dXJuIDA7DQo+Pj4+ICAgIA0K
Pj4+PiAtICAgIHJldHVybiAwOw0KPj4+PiArICAgIHJldHVybiB2cGNpX2Jhcl9yZW1vdmVfaGFu
ZGxlcnMoZCwgZGV2KTsNCj4+PiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byB1c2Ugc29t
ZXRoaW5nIHNpbWlsYXIgdG8NCj4+PiBSRUdJU1RFUl9WUENJX0lOSVQgaGVyZSwgb3RoZXJ3aXNl
IHRoaXMgd2lsbCBuZWVkIHRvIGJlIG1vZGlmaWVkIGV2ZXJ5DQo+Pj4gdGltZSBhIG5ldyBjYXBh
YmlsaXR5IGlzIGhhbmRsZWQgYnkgWGVuLg0KPj4+DQo+Pj4gTWF5YmUgd2UgY291bGQgcmV1c2Ug
b3IgZXhwYW5kIFJFR0lTVEVSX1ZQQ0lfSU5JVCBhZGRpbmcgYW5vdGhlciBmaWVsZA0KPj4+IHRv
IGJlIHVzZWQgZm9yIGd1ZXN0IGluaXRpYWxpemF0aW9uPw0KPj4+DQo+Pj4+ICAgIH0NCj4+Pj4g
ICAgI2VuZGlmIC8qIENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUICovDQo+Pj4+ICAgIA0K
Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3ZwY2kuaCBiL3hlbi9pbmNsdWRlL3hl
bi92cGNpLmgNCj4+Pj4gaW5kZXggZWNjMDhmMmMwZjY1Li5mZDgyMmM5MDNhZjUgMTAwNjQ0DQo+
Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgNCj4+Pj4gKysrIGIveGVuL2luY2x1ZGUv
eGVuL3ZwY2kuaA0KPj4+PiBAQCAtNTcsNiArNTcsMTQgQEAgdWludDMyX3QgdnBjaV9od19yZWFk
MzIoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+Pj4+ICAg
ICAqLw0KPj4+PiAgICBib29sIF9fbXVzdF9jaGVjayB2cGNpX3Byb2Nlc3NfcGVuZGluZyhzdHJ1
Y3QgdmNwdSAqdik7DQo+Pj4+ICAgIA0KPj4+PiArI2lmZGVmIENPTkZJR19IQVNfVlBDSV9HVUVT
VF9TVVBQT1JUDQo+Pj4+ICsvKiBBZGQvcmVtb3ZlIEJBUiBoYW5kbGVycyBmb3IgYSBkb21haW4u
ICovDQo+Pj4+ICtpbnQgdnBjaV9iYXJfYWRkX2hhbmRsZXJzKGNvbnN0IHN0cnVjdCBkb21haW4g
KmQsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBwY2lfZGV2
ICpwZGV2KTsNCj4+Pj4gK2ludCB2cGNpX2Jhcl9yZW1vdmVfaGFuZGxlcnMoY29uc3Qgc3RydWN0
IGRvbWFpbiAqZCwNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3Ry
dWN0IHBjaV9kZXYgKnBkZXYpOw0KPj4+PiArI2VuZGlmDQo+Pj4gVGhpcyB3b3VsZCB0aGVuIGdv
IGF3YXkgaWYgd2UgaW1wbGVtZW50IGEgbWVjaGFuaXNtIHNpbWlsYXIgdG8NCj4+PiBSRUdJU1RF
Ul9WUENJX0lOSVQuDQo+Pj4NCj4+PiBUaGFua3MsIFJvZ2VyLg0KPj4gT2ssIHNvIEkgY2FuIGV4
dGVuZCBSRUdJU1RFUl9WUENJX0lOSVQgd2l0aCBhbiBhY3Rpb24gcGFyYW1ldGVyOg0KPj4NCj4+
ICJUaGVyZSBhcmUgbnVtYmVyIG9mIGFjdGlvbnMgdG8gYmUgdGFrZW4gd2hpbGUgZmlyc3QgaW5p
dGlhbGl6aW5nIHZQQ0kNCj4+IGZvciBhIFBDSSBkZXZpY2Ugb3Igd2hlbiB0aGUgZGV2aWNlIGlz
IGFzc2lnbmVkIHRvIGEgZ3Vlc3Qgb3Igd2hlbiBpdA0KPj4gaXMgZGUtYXNzaWduZWQgYW5kIHNv
IG9uLg0KPj4gRXZlcnkgdGltZSBhIG5ldyBhY3Rpb24gaXMgbmVlZGVkIGR1cmluZyB0aGVzZSBz
dGVwcyB3ZSBuZWVkIHRvIGNhbGwgc29tZQ0KPj4gcmVsZXZhbnQgZnVuY3Rpb24gdG8gaGFuZGxl
IHRoYXQuIE1ha2UgaXQgaXMgZWFzaWVyIHRvIHRyYWNrIHRoZSByZXF1aXJlZA0KPj4gc3RlcHMg
YnkgZXh0ZW5kaW5nIFJFR0lTVEVSX1ZQQ0lfSU5JVCBtYWNoaW5lcnkgd2l0aCBhbiBhY3Rpb24g
cGFyYW1ldGVyDQo+PiB3aGljaCBzaG93cyB3aGljaCBleGFjdGx5IHN0ZXAvYWN0aW9uIGlzIGJl
aW5nIHBlcmZvcm1lZC4iDQo+Pg0KPj4gU28sIHdlIGhhdmUNCj4+DQo+PiAtdHlwZWRlZiBpbnQg
dnBjaV9yZWdpc3Rlcl9pbml0X3Qoc3RydWN0IHBjaV9kZXYgKmRldik7DQo+PiArZW51bSBWUENJ
X0lOSVRfQUNUSU9OIHsNCj4+ICvCoCBWUENJX0lOSVRfQURELA0KPj4gK8KgIFZQQ0lfSU5JVF9B
U1NJR04sDQo+PiArwqAgVlBDSV9JTklUX0RFQVNTSUdOLA0KPj4gK307DQo+PiArDQo+PiArdHlw
ZWRlZiBpbnQgdnBjaV9yZWdpc3Rlcl9pbml0X3Qoc3RydWN0IHBjaV9kZXYgKmRldiwNCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGVudW0gVlBDSV9JTklUX0FDVElPTiBhY3Rpb24pOw0KPj4NCj4+IGFuZCwgZm9yIGV4
YW1wbGUsDQo+Pg0KPj4gQEAgLTQ1Miw2ICs0NTIsOSBAQCBzdGF0aWMgaW50IGluaXRfYmFycyhz
dHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgwqDCoMKgwqAgc3RydWN0IHZwY2lfYmFyICpiYXJz
ID0gaGVhZGVyLT5iYXJzOw0KPj4gICDCoMKgwqDCoCBpbnQgcmM7DQo+Pg0KPj4gK8KgwqDCoCBp
ZiAoIGFjdGlvbiAhPSBWUENJX0lOSVRfQUREICkNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4g
MDsNCj4+ICsNCj4+DQo+PiBJIHdhcyB0aGlua2luZyBhYm91dCBhZGRpbmcgZGVkaWNhdGVkIG1h
Y2hpbmVyeSBzaW1pbGFyIHRvIFJFR0lTVEVSX1ZQQ0lfSU5JVCwNCj4+IGUuZy4gUkVHSVNURVJf
VlBDSV97QVNTSUdOfERFQVNTSUdOfSArIGRlZGljYXRlZCBzZWN0aW9ucyBpbiB0aGUgbGlua2Vy
IHNjcmlwdHMsDQo+PiBidXQgaXQgc2VlbXMgbm90IHdvcnRoIGl0OiB0aGVzZSBzdGVwcyBhcmUg
b25seSBleGVjdXRlZCBhdCBkZXZpY2UgaW5pdC9hc3NpZ24vZGVhc3NpZ24sDQo+PiBzbyBleHRl
bmRpbmcgdGhlIGV4aXN0aW5nIGFwcHJvYWNoIGRvZXNuJ3Qgc2VlbSB0byBodXJ0IHBlcmZvcm1h
bmNlIG11Y2guDQo+Pg0KPj4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHRoaXMgaXMgd2hhdCB5b3Ug
bWVhbiwgc28gSSBjYW4gcmUtd29yayB0aGUgcmVsZXZhbnQgY29kZS4NCj4gSSdtIGFmcmFpZCBJ
J20gc3RpbGwgdW5zdXJlIHdoZXRoZXIgd2UgbmVlZCBhbiBleHBsaWNpdCBoZWxwZXIgdG8NCj4g
ZXhlY3V0ZSB3aGVuIGFzc2lnbmluZyBhIGRldmljZSwgcmF0aGVyIHRoYW4ganVzdCB1c2luZyB0
aGUgY3VycmVudA0KPiBpbml0IGhlbHBlcnMgKGluaXRfYmFycyAmYykuDQo+DQo+IFlvdSBzYWlk
IHRoYXQgc2l6aW5nIHRoZSBCQVJzIHdoZW4gYXNzaWduaW5nIHRvIGEgZG9tVSB3YXMgbm90DQo+
IHBvc3NpYmxlIFswXSwgYnV0IEknbSBtaXNzaW5nIGFuIGV4cGxhbmF0aW9uIG9mIHdoeSBpdCdz
IG5vdCBwb3NzaWJsZSwNCj4gYXMgSSB0aGluayB0aGF0IHdvbid0IGJlIGFuIGlzc3VlIG9uIHg4
NiBbMV0uDQpJIGFtIGluIHRoZSBwcm9jZXNzIG9mIHJlLXdvcmtpbmcgdGhpcyBhbmQgdGhlIHJl
bGV2YW50IHBhdGNoZXMuDQpBdCB0aGUgbW9tZW50IEkgaGF2ZSB0aG9zZSBoZWxwZXJzLCBidXQg
aXQgc2VlbXMgSSBjYW4gcmVtb3ZlIHRoZW0uDQpPbmNlIEkgZmluaXNoIHRoZSBzZXJpZXMgSSAo
bW9zdCBwcm9iYWJseSkgd2lsbCByZW1vdmUgdGhvc2UuDQo+DQo+IFRoYW5rcywgUm9nZXIuDQo+
DQo+IFswXSBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcveGVuLWRldmVsLzM2OGJmNGI1LWY5ZmQtNzZhNi0yOTRlLWRiYjkzYTE4ZTczZkBlcGFtLmNv
bS9fXzshIUdGXzI5ZGJjUUlVQlBBIW1HejJ1ekpLTlpzTXIzUjhhd29ra1NPam84RVRqT1M5Ti1K
VmtUSU9KVzVCWXh2S2d0WnJLYW1QSnE1OUk1dTJHQ0Ruc1k0ZFFRJCBbbG9yZVsuXWtlcm5lbFsu
XW9yZ10NCj4gWzFdIGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2Vy
bmVsLm9yZy94ZW4tZGV2ZWwvWVhseG1kWWR3cHRha0RES0BBaXItZGUtUm9nZXIvX187ISFHRl8y
OWRiY1FJVUJQQSFtR3oydXpKS05ac01yM1I4YXdva2tTT2pvOEVUak9TOU4tSlZrVElPSlc1Qll4
dktndFpyS2FtUEpxNTlJNXUyR0NBSEhrckQxZyQgW2xvcmVbLl1rZXJuZWxbLl1vcmddDQo=

