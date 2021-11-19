Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24714456F0E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 13:47:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227861.394211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3Hz-0001kk-Uh; Fri, 19 Nov 2021 12:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227861.394211; Fri, 19 Nov 2021 12:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3Hz-0001iu-Qt; Fri, 19 Nov 2021 12:46:47 +0000
Received: by outflank-mailman (input) for mailman id 227861;
 Fri, 19 Nov 2021 12:46:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W8RP=QG=epam.com=prvs=19578d545c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mo3Hx-0001Wg-Qf
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 12:46:46 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf99319f-4936-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 13:46:44 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJCRv3W007949;
 Fri, 19 Nov 2021 12:46:42 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ceby2g253-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 12:46:41 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB2832.eurprd03.prod.outlook.com (2603:10a6:800:e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Fri, 19 Nov
 2021 12:46:32 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 12:46:32 +0000
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
X-Inumbo-ID: bf99319f-4936-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgZp1XTDpzll5S2EI7Kod1PBEJM1V1iFkPImg+wY7xMEtAFjITr2hnj3f6GbxUNYfWFS11ohWPHO7WtFyYCJHDdFHGKD+sVimleDEB0Wjmx6/uuNCkvSdlcIM2mMZ8pPe92K2MJ/7RhL2wCvp/DJL/uFIevZogguw2xQi8eFVfEK/w1kH0GEMmXa56PZc6kx2jAMl4qU55WILCCjlmSWXwqNWYwzed/EtzH3cDWDcPOvv5TLwyAGX/n87rNF4WMjnC/7gBcdOjBAVj/go+FWAoFTKAg1ZI+oV48sGh7M8j6JLYS/bZ8l0N7wuXSB7S9VCHspL7f5DQC1TrjyWY17iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wg1IACHB7nfHvmDTLTK6fVzpzT0Rk1+jqn8EzPEUQo=;
 b=UxrCH1e6kE1zEyirX8B0mPBanNGKkKczF1nEYJknmY7x9aj4wFLK+bFrQ5zbaqoy+kji1eHqdZvipIffcAsAw1m08DvGVJdOSW9X2KkO2RTgqLmDttfQjuiKxjZ3YoPNbq5HSVpWEhbCxR7etmDRoEK4zq57q/ZZgOAzNOMuM5DlAU/ytaxuw9KPOASWGX97kRXP4SeDFRsoD+lSyKEhZOLZPVnlaGrS4P1UdcJcDG04xlq2J/IlM++Wm2AKxPjBgsvgwJHtac+ble18VHPjhhRETEF9RmrtKrtvniOezGQPQG59JT7l1ohtyniAfuRxtdaT8ay2AASJTjq8haLdTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wg1IACHB7nfHvmDTLTK6fVzpzT0Rk1+jqn8EzPEUQo=;
 b=GQ1r0aNNkCJFtigG81EwW/2D73jEM61IhwM787YqhQhgIESlCd82Lbom1/eR7SPO2ai9nZbZyaVPk73m7x1p7lsq2rq2dJR6vPE21RrE6GPuzdqEF9Xmxtyr1lFC+LP5dSxgInLEnhYPyuueDXU6KxIGrLxhW6NAY1ji3B7cPC4Fxrl7OwjDgi3s6JBk7hxobbtBCyqnyTmNidG9rAerEGzCvlQy2brnVj3BbUXs7EC/k53ILDhAD16XdlV7k849O5JI3zksM6EvAzwwp1jAXMOAeqhHfL3Bsj2I2JfG2eDW1w+SlbWCIA/xjHDcHqgT94BwnzphID/UwOa41cE6Mw==
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
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 05/11] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v4 05/11] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHX0hJK3jTao+VT7Ua3mM5UrGfltKwK1UUAgAADYYCAAAeUgIAAApWA
Date: Fri, 19 Nov 2021 12:46:32 +0000
Message-ID: <6c61bd19-228a-fc12-eb64-00c8c5340292@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-6-andr2000@gmail.com>
 <6aa1a947-cfc8-ec05-e5a5-151d36fc432c@suse.com>
 <713a0443-b2a4-3c29-7072-ba18970fe6f9@epam.com>
 <44a22c22-62aa-d04f-cc43-d7a64cedbe15@suse.com>
In-Reply-To: <44a22c22-62aa-d04f-cc43-d7a64cedbe15@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5221acf-5568-4638-b456-08d9ab5a9d55
x-ms-traffictypediagnostic: VI1PR0302MB2832:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB28325FE7C7F9749DE82D59D0E79C9@VI1PR0302MB2832.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 66w+3xhcJ7H7Y/BfvMcmWKm4cg29i+kCr9fImsk77zD2ttsvlPfGnqbTUW3gnzU9UNCqrT6IA4Sa8daJRqVwvipeAhmSiMyezgg4msPe3hqh+2JZ3h4yi+uPDqpiSLzQfxk3O1IlFWB5cPf2XKYdB/NqThLskcXYDQg1TNNtHF46Uh9xMj5mX/o630VAiSBYAzCBhvBc+8zku5DcoZ966f4wWrh+bj+KOOTuJX2J9BWvpivdnmzjoze0/Rnzxlofh6e0z5QaOakhq3suIW+VAUdca6DZDDALs2FG5x2uFF0FeiZ/9+yxcwViUBBzDz713/cnJ/CplwmhHpYgj/SVKXEVdeSiQnr6jIaPrO41d/9SlgEFIbDIckhfeD1vEPcta9R/cEDMJYGhgEobjxdsUDvH+P9gu4TvG4fW5eb3IZbK1AF1F70X5KfmujtIw7DQSBQOWZM/Q4xcGYRguK2zPERqv87DlIkpbLo6eklXGRe0mteYD9Ltlr0FYLUJs1+GdvaIVD/chOxMzaUhgaYTbGMS+sDMJkmSOMfWPJVwkeopCJ8MCRZt5scQlfOc6jQ4iafQSc2Nhq4G5ztnHu+HhR42HuP4jYlFzHV18IkQ22xo0KBzTWBOpTyMe1q+TMDPvq2UXjshEY+7Up7r963cXLH2dka8woJBbKa1apQ3JXnTJKjw0HzwJQ1uM+fWhkYAysMSZLOe1+rr56WQq9TqQs3DyaNgUpff1K3Pcskc8qfckV8EJbWF3MV9bKAj6RfR
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(54906003)(83380400001)(6916009)(64756008)(91956017)(4326008)(26005)(8936002)(36756003)(6506007)(66476007)(316002)(86362001)(6512007)(53546011)(66946007)(38070700005)(2906002)(66446008)(6486002)(66556008)(71200400001)(122000001)(5660300002)(7416002)(186003)(2616005)(38100700002)(31686004)(8676002)(31696002)(508600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UEN5c1hSM2JJQ2ViR1dXZlNEcmRtb1p5VXluaUVyTDRSUUh1V2pxTWU4WS9p?=
 =?utf-8?B?bjlnRlhFTUV6ZkhCTDJaeU5HVFVBejVRZlB4Vnpvc2t2dFp2TnpqWmVUdXZZ?=
 =?utf-8?B?V05ITnZPdmVrVk8reDV2QW1PdE91ZkhmQnhPdzhmQUYzcjExcnJGZjN6bXdZ?=
 =?utf-8?B?bGVKZ0RrM2ZMMVdUSFEyQWthb1g5V1JQKzZrNXRCOVNtMDJQM3NkUEM1dXFP?=
 =?utf-8?B?Nk8zSFJiWlFsVE56ZUtlY3h3djZKZlJZZ21MaU44Z0wzTU12NjdNc2JjVG1o?=
 =?utf-8?B?amM1REQvU3FxMmlBRU83MldoY2FLdXhhbXlteEZoMFdROXNMc0RaTWZnNlhh?=
 =?utf-8?B?Y0lUZXdOL3RXMHJZMFFMVW91RnlWbG9TOHpUVXJhbDhYNmw4bnNnd0Q1YmJE?=
 =?utf-8?B?NFNpTGpZTmNvWWdpSjk4b0gwZ2wweVpIYURxQlZJTndsR2krODAreUtkTUo0?=
 =?utf-8?B?R3pPL2MwR3JZSzNNb0pDZFJnZjgxVEhCSXhGaHVHYkhwL0tYSEFMbUNkeC84?=
 =?utf-8?B?TW1JNi9KZzJUNHpFV1VBMzdhbGgrMHJvQjFXMWFkdnNBQ1F3Ly9TbUxBZERM?=
 =?utf-8?B?YXAzSUdCSWlsOFFudTMzd2g2U3pENnM1RXZkaEZVUHZTUytJL1p4U05SazNx?=
 =?utf-8?B?dGdINlpDVlNMenh1WFJGQk51ZmpqcjcxZGpRVkYwWDlWc3NIR1kvSEh6MG1M?=
 =?utf-8?B?WWh3bXUyem1YbTdyQnc0SmlWQ2V1WXVIYnBGaDZIelZnQkZyUHg3YU5WSTV4?=
 =?utf-8?B?dTFubmRBVmFYK2Z6WVAxdXphMThSWkJqWDVwdzVNVjduU3Ava05TMXRFNXlu?=
 =?utf-8?B?MmxhYzlKUVpjRm95akl6NElNOXlwdlhqOEtDcDlWb0ltOWVoNzI1OHZYKzJE?=
 =?utf-8?B?dnBLanJMbUdDYlFaY0xVckVCSkxNbkxrNFZtdFlXdFVZallwUjF3TlVGWmJ4?=
 =?utf-8?B?Qlh3dmF1eE1BVHU0RzlwZmpqWGk5aHd2eE14V3ppNTZqZFh1L0xLakJNblhF?=
 =?utf-8?B?aUlseVFpd29icmVjcG9xWTVnbUtOaHpaSFNNekh4WmVtSzJ1c2VweHpxNUlX?=
 =?utf-8?B?UjR4ZG5Eb2VXR3hneHBVZEZISXlCY3ViNkZiN0xLQUJGcW5acnZOemlVc1F4?=
 =?utf-8?B?Sm1Tblp1YXVnUFZ2NjVmbk1zaFk4amZ6N3FkL2F3eHIvYTdkM1NsNUd1Mitn?=
 =?utf-8?B?cEYrY0E1RVNrWld1UlV0c2k4eDU0N2FRMUVJWW1jSnhsOXljNFB6em9pU2Vv?=
 =?utf-8?B?YzRmRWtLbExuTzg0VnNlYmoxWFU5SGdXQVdtM1ZhZzN2MW05M0ovNzlNem80?=
 =?utf-8?B?R05RbjErUzM0akNEbTFvSWJ5R2NueHdKMFB0Zy84T0FvVXJ4VDE0dW1rVDVV?=
 =?utf-8?B?OVpFNlVuUGtxYlo5WVhsb1lWOWl4OGF6WUNseU9ncXZad05WMUZmWnI1SENo?=
 =?utf-8?B?bzRaa09HVkpleUs1cG1YQTFZbkJ3Qnh1NTVpWFJXY29NUzJqOWJkQnU0NHp0?=
 =?utf-8?B?bWFmUTNFb1NVUWNkOUJQYXlmdFRFSWQ2VElPc25RZ2RHa0V4eGZvT3pNR2Jx?=
 =?utf-8?B?MTRiNG5IQUJBL0NWU2RvNnZuNHV1a2s2TUNCZHJaRUxrcXJSYU9yOUwzRlNz?=
 =?utf-8?B?RmQvMXpMZVBscVJ5Y2d0WjZOZ2M0V3c0R2l2Vko2eUlwNDZydHhoWjUvZVVp?=
 =?utf-8?B?OWRmRmswdjlPZWo3SFdXRVl0bnU3Z3lNODV4ZjdaVm0xTEpUeEZEYVJlRGlm?=
 =?utf-8?B?b1IyNnVjS3lUcDFDU0xKeUtQQ2gwWUF2OGZyRkNnZmpjTEpCdGNxejFHWUJl?=
 =?utf-8?B?VmZySWROZ3BXS2hINllIVGZtWWtFcXYxaExqaDVzZkZlb200cFBvVkdOa01Q?=
 =?utf-8?B?VXl3NnkzV05rRDJjbTU1VkM3Z253YVdFcUlFM3RlOGlCd2ZGSGJCcGtTS1Jk?=
 =?utf-8?B?ejNpazhENTlPSm9Fa1g2eEdQbk13ZVA0akNJbVBKRGpwSzRCMmVNT2ZXQk1u?=
 =?utf-8?B?UXpWQVI1cmtSQ3FoTFNnTWU0dWp2Y2QyMmZZMmZpTlNnbXl3UVdtVmxQYUNj?=
 =?utf-8?B?ZzZyS1pzMEQ2YUFmMU1BVjJ3QmZtY3ZOS1puQVlJMWRIT1lZMGVBQXBpZXU5?=
 =?utf-8?B?UE5iTG13aWV0R0RrRHR6Q3ZzRml1dGxtek9qcUNjOEM0cG41U1UvMTg0a3By?=
 =?utf-8?B?ZnF4akEwNFBqTzJwdFhueXQyMXBTSkxhTW96bjl2bm90MmdxZ1FsZUpZdlR4?=
 =?utf-8?B?QmtqYkh3Zy81KzdRWHZRR0JxT3lBbnJ6SzFQR0NrdVZiRE51WVNKbXlKeDRL?=
 =?utf-8?B?WmdMRDQ2aVB1R2dFb3RqQ043SnFtWVBVQStKOXFVR29lNmZGdVBzQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCE0874A39D7094D96B07D8208071E26@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5221acf-5568-4638-b456-08d9ab5a9d55
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 12:46:32.3915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EzudJwB4x7eiVXUbxrGX29mbyYpFGza2zzKehVnpC1NYgxtIm5XGFY6EaOEhu4t6XMPJd5AyrnnFAkURh8Mmf/R2mVk1z9+Gk971xv284zskRXJfoGUvA/6trQI+Jw1N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2832
X-Proofpoint-GUID: _oo06QfxKy2eHHpBYma45ugBJEXGeofV
X-Proofpoint-ORIG-GUID: _oo06QfxKy2eHHpBYma45ugBJEXGeofV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111190070

DQoNCk9uIDE5LjExLjIxIDE0OjM3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTkuMTEuMjAy
MSAxMzoxMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxOS4xMS4yMSAx
Mzo1OCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDUuMTEuMjAyMSAwNzo1NiwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4NCj4+Pj4gQWRkIHJl
bGV2YW50IHZwY2kgcmVnaXN0ZXIgaGFuZGxlcnMgd2hlbiBhc3NpZ25pbmcgUENJIGRldmljZSB0
byBhIGRvbWFpbg0KPj4+PiBhbmQgcmVtb3ZlIHRob3NlIHdoZW4gZGUtYXNzaWduaW5nLiBUaGlz
IGFsbG93cyBoYXZpbmcgZGlmZmVyZW50DQo+Pj4+IGhhbmRsZXJzIGZvciBkaWZmZXJlbnQgZG9t
YWlucywgZS5nLiBod2RvbSBhbmQgb3RoZXIgZ3Vlc3RzLg0KPj4+Pg0KPj4+PiBFbXVsYXRlIGd1
ZXN0IEJBUiByZWdpc3RlciB2YWx1ZXM6IHRoaXMgYWxsb3dzIGNyZWF0aW5nIGEgZ3Vlc3Qgdmll
dw0KPj4+PiBvZiB0aGUgcmVnaXN0ZXJzIGFuZCBlbXVsYXRlcyBzaXplIGFuZCBwcm9wZXJ0aWVz
IHByb2JlIGFzIGl0IGlzIGRvbmUNCj4+Pj4gZHVyaW5nIFBDSSBkZXZpY2UgZW51bWVyYXRpb24g
YnkgdGhlIGd1ZXN0Lg0KPj4+Pg0KPj4+PiBST00gQkFSIGlzIG9ubHkgaGFuZGxlZCBmb3IgdGhl
IGhhcmR3YXJlIGRvbWFpbiBhbmQgZm9yIGd1ZXN0IGRvbWFpbnMNCj4+Pj4gdGhlcmUgaXMgYSBz
dHViOiBhdCB0aGUgbW9tZW50IFBDSSBleHBhbnNpb24gUk9NIGlzIHg4NiBvbmx5LCBzbyBpdA0K
Pj4+PiBtaWdodCBub3QgYmUgdXNlZCBieSBvdGhlciBhcmNoaXRlY3R1cmVzIHdpdGhvdXQgZW11
bGF0aW5nIHg4Ni4gT3RoZXINCj4+Pj4gdXNlLWNhc2VzIG1heSBpbmNsdWRlIHVzaW5nIHRoYXQg
ZXhwYW5zaW9uIFJPTSBiZWZvcmUgWGVuIGJvb3RzLCBoZW5jZQ0KPj4+PiBubyBlbXVsYXRpb24g
aXMgbmVlZGVkIGluIFhlbiBpdHNlbGYuIE9yIHdoZW4gYSBndWVzdCB3YW50cyB0byB1c2UgdGhl
DQo+Pj4+IFJPTSBjb2RlIHdoaWNoIHNlZW1zIHRvIGJlIHJhcmUuDQo+Pj4gQXQgbGVhc3QgaW4g
dGhlIGluaXRpYWwgZGF5cyBvZiBFRkkgdGhlcmUgd2FzIHRoZSBjb25jZXB0IG9mIEVGSSBieXRl
DQo+Pj4gY29kZSwgZm9yIFJPTSBjb2RlIHRvIGJlIGNvbXBpbGVkIHRvIHN1Y2ggdGhhdCBpdCB3
b3VsZCBiZSBhcmNoLQ0KPj4+IGluZGVwZW5kZW50LiBXaGlsZSBJIGRvbid0IG1lYW4gdGhpcyB0
byBiZSBhbiBhcmd1bWVudCBhZ2FpbnN0IGxlYXZpbmcNCj4+PiBvdXQgUk9NIEJBUiBoYW5kbGlu
ZyBmb3Igbm93LCB0aGlzIG1heSB3YW50IG1lbnRpb25pbmcgaGVyZSB0byBhdm9pZA0KPj4+IGdp
dmluZyB0aGUgaW1wcmVzc2lvbiB0aGF0IGl0J3Mgb25seSB4ODYgd2hpY2ggbWlnaHQgYmUgYWZm
ZWN0ZWQgYnkNCj4+PiB0aGlzIGRlbGliZXJhdGUgb21pc3Npb24uDQo+PiBJIGNhbiBwdXQ6DQo+
PiBhdCB0aGUgbW9tZW50IFBDSSBleHBhbnNpb24gUk9NIGhhbmRsaW5nIGlzIHN1cHBvcnRlZCBm
b3IgeDg2IG9ubHkNCj4+IGFuZCBpdCBtaWdodCBub3QgYmUgdXNlZCBieSBvdGhlciBhcmNoaXRl
Y3R1cmVzIHdpdGhvdXQgZW11bGF0aW5nIHg4Ni4NCj4gU291bmRzIGF0IGxlYXN0IHNvbWV3aGF0
IGJldHRlciB0byBtZS4NCj4NCj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0K
Pj4+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+Pj4+IEBAIC00MDgsNiArNDA4
LDQ4IEBAIHN0YXRpYyB2b2lkIGJhcl93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwg
dW5zaWduZWQgaW50IHJlZywNCj4+Pj4gICAgICAgIHBjaV9jb25mX3dyaXRlMzIocGRldi0+c2Jk
ZiwgcmVnLCB2YWwpOw0KPj4+PiAgICB9DQo+Pj4+ICAgIA0KPj4+PiArc3RhdGljIHZvaWQgZ3Vl
c3RfYmFyX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVn
LA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHZhbCwgdm9pZCAq
ZGF0YSkNCj4+Pj4gK3sNCj4+Pj4gKyAgICBzdHJ1Y3QgdnBjaV9iYXIgKmJhciA9IGRhdGE7DQo+
Pj4+ICsgICAgYm9vbCBoaSA9IGZhbHNlOw0KPj4+PiArDQo+Pj4+ICsgICAgaWYgKCBiYXItPnR5
cGUgPT0gVlBDSV9CQVJfTUVNNjRfSEkgKQ0KPj4+PiArICAgIHsNCj4+Pj4gKyAgICAgICAgQVNT
RVJUKHJlZyA+IFBDSV9CQVNFX0FERFJFU1NfMCk7DQo+Pj4+ICsgICAgICAgIGJhci0tOw0KPj4+
PiArICAgICAgICBoaSA9IHRydWU7DQo+Pj4+ICsgICAgfQ0KPj4+PiArICAgIGVsc2UNCj4+Pj4g
KyAgICB7DQo+Pj4+ICsgICAgICAgIHZhbCAmPSBQQ0lfQkFTRV9BRERSRVNTX01FTV9NQVNLOw0K
Pj4+PiArICAgICAgICB2YWwgfD0gYmFyLT50eXBlID09IFZQQ0lfQkFSX01FTTMyID8gUENJX0JB
U0VfQUREUkVTU19NRU1fVFlQRV8zMg0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDogUENJX0JBU0VfQUREUkVTU19NRU1fVFlQRV82NDsNCj4+Pj4gKyAg
ICAgICAgdmFsIHw9IGJhci0+cHJlZmV0Y2hhYmxlID8gUENJX0JBU0VfQUREUkVTU19NRU1fUFJF
RkVUQ0ggOiAwOw0KPj4+PiArICAgIH0NCj4+Pj4gKw0KPj4+PiArICAgIGJhci0+Z3Vlc3RfYWRk
ciAmPSB+KDB4ZmZmZmZmZmZ1bGwgPDwgKGhpID8gMzIgOiAwKSk7DQo+Pj4+ICsgICAgYmFyLT5n
dWVzdF9hZGRyIHw9ICh1aW50NjRfdCl2YWwgPDwgKGhpID8gMzIgOiAwKTsNCj4+Pj4gKw0KPj4+
PiArICAgIGJhci0+Z3Vlc3RfYWRkciAmPSB+KGJhci0+c2l6ZSAtIDEpIHwgflBDSV9CQVNFX0FE
RFJFU1NfTUVNX01BU0s7DQo+Pj4+ICt9DQo+Pj4+ICsNCj4+Pj4gK3N0YXRpYyB1aW50MzJfdCBn
dWVzdF9iYXJfcmVhZChjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJl
ZywNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKQ0KPj4+
PiArew0KPj4+PiArICAgIGNvbnN0IHN0cnVjdCB2cGNpX2JhciAqYmFyID0gZGF0YTsNCj4+Pj4g
KyAgICBib29sIGhpID0gZmFsc2U7DQo+Pj4+ICsNCj4+Pj4gKyAgICBpZiAoIGJhci0+dHlwZSA9
PSBWUENJX0JBUl9NRU02NF9ISSApDQo+Pj4+ICsgICAgew0KPj4+PiArICAgICAgICBBU1NFUlQo
cmVnID4gUENJX0JBU0VfQUREUkVTU18wKTsNCj4+Pj4gKyAgICAgICAgYmFyLS07DQo+Pj4+ICsg
ICAgICAgIGhpID0gdHJ1ZTsNCj4+Pj4gKyAgICB9DQo+Pj4+ICsNCj4+Pj4gKyAgICByZXR1cm4g
YmFyLT5ndWVzdF9hZGRyID4+IChoaSA/IDMyIDogMCk7DQo+Pj4gSSdtIGFmcmFpZCAiZ3Vlc3Rf
YWRkciIgdGhlbiBpc24ndCB0aGUgYmVzdCBuYW1lOyBtYXliZSAiZ3Vlc3RfdmFsIj8NCj4+PiBU
aGlzIHdvdWxkIG1ha2UgbW9yZSBvYnZpb3VzIHRoYXQgdGhlcmUgaXMgYSBtZWFuaW5nZnVsIGRp
ZmZlcmVuY2UNCj4+PiBmcm9tICJhZGRyIiBiZXNpZGVzIHRoZSBndWVzdCB2cyBob3N0IGFzcGVj
dC4NCj4+IEkgYW0gbm90IHN1cmUgSSBjYW4gYWdyZWUgaGVyZToNCj4+IGJhci0+YWRkciBhbmQg
YmFyLT5ndWVzdF9hZGRyIG1ha2UgaXQgY2xlYXIgd2hhdCBhcmUgdGhlc2Ugd2hpbGUNCj4+IGJh
ci0+YWRkciBhbmQgYmFyLT5ndWVzdF92YWwgd291bGQgbWFrZSBzb21lb25lIGdvIGxvb2sgZm9y
DQo+PiBhZGRpdGlvbmFsIGluZm9ybWF0aW9uIGFib3V0IHdoYXQgdGhhdCB2YWwgaXMgZm9yLg0K
PiBGZWVsIGZyZWUgdG8gcmVwbGFjZSAidmFsIiB3aXRoIHNvbWV0aGluZyBtb3JlIHN1aXRhYmxl
LiAiZ3Vlc3RfYmFyIg0KPiBtYXliZT8gVGhlIHZhbHVlIGRlZmluaXRlbHkgaXMgbm90IGFuIGFk
ZHJlc3MsIHNvICJhZGRyIiBzZWVtcw0KPiBpbmFwcHJvcHJpYXRlIC8gbWlzbGVhZGluZyB0byBt
ZS4NClRoaXMgaXMgYSBndWVzdCdzIHZpZXcgb24gdGhlIEJBUidzIGFkZHJlc3MuIFNvIHRvIG1l
IGl0IGlzIHN0aWxsIGd1ZXN0X2FkZHINCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQpPbGVrc2Fu
ZHI=

