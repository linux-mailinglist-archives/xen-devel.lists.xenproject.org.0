Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4841456F23
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 13:55:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227876.394245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3Pq-0004VN-DW; Fri, 19 Nov 2021 12:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227876.394245; Fri, 19 Nov 2021 12:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo3Pq-0004Sf-9X; Fri, 19 Nov 2021 12:54:54 +0000
Received: by outflank-mailman (input) for mailman id 227876;
 Fri, 19 Nov 2021 12:54:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W8RP=QG=epam.com=prvs=19578d545c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mo3Po-0004SZ-HL
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 12:54:52 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1cd7bea-4937-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 13:54:51 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJCRv5F007949;
 Fri, 19 Nov 2021 12:54:49 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ceby2g331-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 12:54:48 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Fri, 19 Nov
 2021 12:54:42 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 12:54:42 +0000
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
X-Inumbo-ID: e1cd7bea-4937-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbhOMpBiGq2uOpD14tIBveHhX8nyypeC57nju7jfgNhM18Qdj+Z0t4yOX2O8a6+NWSL02/cqVBEsOG5auBPLJgWws6rBV1lnLS7NGIFU14p17sOIHlDDujKrV7z2N9MhqN4gPftUV0Wbuw7HGjr8sagbHLj/Z9VxDTzI2/63RAFLoDeMZXQrPSgufebX3TVIK8Kxeudoj35M2WmHSQvhhE71BQdghC238WlVezRSAwCBhsTl1VNFySSWrexXuikpy7FGh4xd8Nvt80++3s6NY9AZY95GQBGH9mBYgJokJtZ4y53GawBMgU5oYLAbUi5rnMsgCOO88No1DpHLgm4yew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsWMVxkl+QNKftYZsSb05NA1RqFxM5JXrMkFGJkPHIA=;
 b=gQqdXTJmDgOixA0CJ5WiTXK34wCOOOmkAyJUD376dwC/VMlPxPPkyjWXfme9SLq7uiAnFOMWM61l789Vbuh4CFAld5lEkk+0aRG/4OBf+d9Tw0E23KJNdjgSmIBn+WOqILnKTDXF1dGTrjRSYj3MW46LeL4Ru8lmCEEBbYw2Ia1ClOEAfYKn1dprqrVrUVsoYEWdVvS4cZizEMQXsPzDfkaHfZ0hYWreudK/SkoZ3HZDFXR/eMVS+82y41fuOdw1vi/qxZKHWNBYXO4zBibumVvsphCdvScisrAe15scFUYoPIxIHAczcoZw6Iy378nFWD+uo3yxv50UQlEwLdZ+tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsWMVxkl+QNKftYZsSb05NA1RqFxM5JXrMkFGJkPHIA=;
 b=EZCaaJSK7FouKGdO6wDaA2GTPGij76TSXLwPvar0AiShNDtDGAcKk1X4TLOfByXVcSDskplXu9vpqFTYQTxJuLsrv/So+j2D8ajecr6lgch3sTgvIsvzgryf+s/8luiSrLhg0FB2oIxvqLgHeFy2rQ0CNjVYFKdJCLE0IE4jnIC46ZaRV5wh/VnOlql0jsfmQJ40ClfWLVolg01QhMqrTMvfsMEAnbFDcGgaWLjE1Zu1BAdub4Necp1rQcIr8MoSKc4vHRRMm4pMfYBirSWpaX7HBuDPO2uF6kG3E7GNmMkIid0PqWY+1DgnuNARWRmWAGNIFSxuhKpGk44q4PB9oQ==
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
Thread-Index: 
 AQHX0hJK3jTao+VT7Ua3mM5UrGfltKwK1UUAgAADYYCAAAeUgIAAApWAgAAAtgCAAAGSgA==
Date: Fri, 19 Nov 2021 12:54:42 +0000
Message-ID: <c3b58e3c-9644-6e74-5ca1-25df33028b71@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-6-andr2000@gmail.com>
 <6aa1a947-cfc8-ec05-e5a5-151d36fc432c@suse.com>
 <713a0443-b2a4-3c29-7072-ba18970fe6f9@epam.com>
 <44a22c22-62aa-d04f-cc43-d7a64cedbe15@suse.com>
 <6c61bd19-228a-fc12-eb64-00c8c5340292@epam.com>
 <ed2a6b5c-6e3a-07ca-a2f0-532a0de10329@suse.com>
In-Reply-To: <ed2a6b5c-6e3a-07ca-a2f0-532a0de10329@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ccdff43-56de-44bd-17f7-08d9ab5bc14e
x-ms-traffictypediagnostic: AM0PR03MB6324:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB6324819B43A8B6F454C8EDAAE79C9@AM0PR03MB6324.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0Cjz3JLFVmFo5TP470up1fagBvLgScnAUlIUgUI+sk8J74F7l2RXWcGzOQFEFK/hwY0gBQnOrLE5O2OJSYRV82eR6ChqcjopQiPLqch1U23o6nTpK48h9Mo548YPlA3SgKgNxNWsdCanxGfkGIlVQjewuT5YnGs+SeDenXP3BIp8CnXIXixreNxFMB9EGzFHczCn+hzRB9qqY3jMxnVDXaD0LQrP6flDPI0+BQ7AZPDVE3Xs088crLoHveQmsBsXRVbGyhVwVfhmI0+4HKrwkl7pSPaNrClKL7BCRikxv+Qo9+la3o7a0+HjlT54HJzNkGNt8+8oNyAY0OuCfAyQ1E7ONdzcmPJWU/2HPxUqmTFRNzLKaW4a1tB4nPfYZ40ZXJICRT7vdWSEJLMKmn42UKoFhPcH8VYke3qm0m5bZ32bxl6RwCHsDIplLaDC8qrkTylOYSgXCv8GIEmu/FlU037wlnlN9soiVy0bAtjFrtOY0GOCOuq1z0fB4wQHj2eYeEhXy6nizqIBd9pNloAlO7X+guPgidkMqdezwwZ7V/7klHpwdufOJ73Vb0mtH4P5p8sVysDzJzgWhtaLsSjnEKn+27JeID/EIRWJ8mLGNoSkSKrK7w8DLwHRuaRABBfUZEvUtYR/pY1n5mMrEWfS2RF3HNnz4MZTOgHEd20Qmvd3FpmwQfmj/GZcvOovlI2u+lt1OkbBQmTbaLsDXmLYSSqOppfJtbagaYlo93Q3/QIv5KGZ4kDh+yGuUUt63HjB
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(6916009)(2616005)(8936002)(186003)(6486002)(7416002)(26005)(76116006)(31686004)(66446008)(66476007)(66556008)(64756008)(91956017)(8676002)(36756003)(53546011)(6506007)(54906003)(122000001)(71200400001)(6512007)(31696002)(38100700002)(4326008)(86362001)(66946007)(5660300002)(316002)(2906002)(508600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WnYrQTVRTnA5SllSTXlxMjV6ZnpnUzZvZURXaGR3YkwzeFZHUTRTdUxCMjVL?=
 =?utf-8?B?R09EbDdJR3FKUjBWdnlIS1lBbllkb1VhQVBxbHcwbU9GNTZzalNhbGlzWUNw?=
 =?utf-8?B?Ujh6WDZtcVlFK21uS1Y4bmo4R2Y3TzkrYlAwZU5IS1dHT3RIaWgxdjk5OVBD?=
 =?utf-8?B?QkgxcnhyOTNmKzh1TkNjVDRoMnhZTCtvajBOOHpWNkZHcDJVa0JtUmFldDRr?=
 =?utf-8?B?bHNiajNubGRTS2hCS2NzNCszRzBRdGdJZFd0TFd3OFNMb2ZXditMT1RvSWcr?=
 =?utf-8?B?cEw1RWFjaU9tSnJqZVJRVjlZdDdSc3JmQ1ZRQmt2NlJBbnpqYnRLR2hQd2J5?=
 =?utf-8?B?YlgrempjWGo4ZzA2MjN4d25nZkhzeTVWQUk0d1RSY0d2VEZaMitIdDBHUFM1?=
 =?utf-8?B?cEFxSThUVW5Obk1mazJvY3g3UG80WWxxVE5CWFRrSDduZWNnTEQwTjBOUGJG?=
 =?utf-8?B?SG4rbG1TVFJVSnI4SXRjMkNLVVliVGhJTVdHZldiOXhjY3Ztdm5QMFY1alN0?=
 =?utf-8?B?blNmQkEyekFYVHB3VXJqdCtsaWpBVWQ4citpTmpJa3Z0azBueWlTRjBMNkJz?=
 =?utf-8?B?emdtUVppTmdtd3doUG5mNi93L0JvN0ZvUUhiMDJ5dnl1ZXZuSG43eWtTYTlK?=
 =?utf-8?B?SjhYcjhPMTJ1YWpKYzU1NEpBK1NoNW53dzRUZFY1N0N2RTA3ZGNGOFl6R3Jx?=
 =?utf-8?B?ZStROXlUa1NWUmlDYlhwWG5abHNMM1lIcWs2Q2Vtb3Y0dWdCUGJrSHF2Ukdo?=
 =?utf-8?B?YXJiN2VZZFVsbnlPZUpnOTJGMnplbzEzQ24vWWo2RGlmcHNZZVhtc3R1MWZ5?=
 =?utf-8?B?enJ4bjFFQ2tNd21ieTZ4bFlUR3NzTDNFYzYwS2dZYS9vYlhHczdXR1daeFlN?=
 =?utf-8?B?MGl6RUxXMWcyK3FPSHFvNkR3TTlRNHZFaE9oWGRpc1l5K1BtYlR3SHlCZVhz?=
 =?utf-8?B?bVNWcG9OQVZnKzdnV2xlZjhvSjMvbHU3c243RG5zSVNRcjl6L2dPUFRSZFZ3?=
 =?utf-8?B?RUxsK0tUN3JwOW5ubFVhWnZwcytXdU45QjU5Zk1TRm4yb2VkMXZNOXBxNUlG?=
 =?utf-8?B?aU9XR2JKZzc4MVVDRC8yK1dqOGMvNmFsUGsvNFo0Y3FtYWJ4dmFxeUJLNGlV?=
 =?utf-8?B?cnNtNWdZbXBtTEttMjJqbGJJbWhqZ1UrSlRXR3lEeHozYU95SE9ZTzFGd2hJ?=
 =?utf-8?B?M2NQaWc4NllhNU1RbDRPdGpITHl5MTY3YjI1WkRxVWd0WjBPakZZQWhpQXNs?=
 =?utf-8?B?MWFiOUlJQTdDWEpHQk1CR1M5VE82TE9Yanh0RXVOWC9NMzdPRW0vb3NrNVR2?=
 =?utf-8?B?RWV1T3lSMi9KSjFUbjQ1c0pCT1lRa05xejJPWTBXUkRlYlpXQ0F4L0JOZ1U5?=
 =?utf-8?B?TWhGLzBhUVA5OXd6UitiaGgwZjlwUkErUWdUTWRBbHNtb1lpTjVjQTRsRG9Q?=
 =?utf-8?B?d2d6Rm1wZ0xjNERKL3R4UW5TRFoxcEhrc3hNT2hRV2Y0ektOOUFYbGVVSWQ5?=
 =?utf-8?B?MHNTZmxBN3dQM3pGVXVkUVVtT2JRRC9EUDF2UThncEhoNTRTcXd0bTdXZkxu?=
 =?utf-8?B?NXcrb2JkTEZhYU9HSU5paXVtK205UFV2Zy9aMGdOMnh2cm9RV1lhVm00TWFC?=
 =?utf-8?B?aWh4ZW5TOWVhS2NDYTY3N2tsQnVGMG9tWmsyRlBpOGk4QU0wUVk0bTNqVGds?=
 =?utf-8?B?cW4zM1ZRU29WNjNraDZ6QVY2Q1FtRnVDcHFyTXZtQzZnSGNraklMVXFybVVu?=
 =?utf-8?B?NjdCcmpNbTBrTmlUUWNLdGhYOGVOZVVGVTVIL1FudEhva1NZbXJFZGNyVHZt?=
 =?utf-8?B?Ukg4UDd4aisvNmd1eUtYUlNtVlJORlNvSHBQSTNCL0lydllwbFlSMmJtK3l2?=
 =?utf-8?B?dUhCRDUzcC9nS2w1U1FoV1lMYVJOb0FGdkIxUDZwS1UwM1JzaDNPYm1qdFg1?=
 =?utf-8?B?VU9kMURlVUl5dEMvT3NXUFdMVnd6K082SFU1U0VMaTN2MEZWMnBYSVNyVGQ0?=
 =?utf-8?B?ZXNpVndzSWNzdXgvN0NxL1NqRHNPWnhBbFlRVW16V3U2M054UXZEQk93bmwr?=
 =?utf-8?B?N0tVQXdKbWlZdDZFdEZRWWtsMkFUaUJZbklSbDR5VUlGd1lhUVg2TW9ESm5I?=
 =?utf-8?B?Zi9QSEdiRDBJVWFCaDJ4enZHNDRpUzhha3B6ZzVwYnNQNlhKZWM4SmwwRGZl?=
 =?utf-8?B?L2VrNVo4bm5hV3hKMzZKQnlHWDB4dzlqSFdYRXVRNjYzQm5pc25KUlgreEVO?=
 =?utf-8?B?aEdiM01kTjZPeEh0aHZpN0xZQjI2UU1lWjM0em9SZ2QzUTRZT1JCWE5UaW9I?=
 =?utf-8?B?dU9jRzhNS2Rzc1lXWDJabjgxZXpDL0pMTys4UDczd2diT1QwMXg2UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A62DD921309384C89C12E35917EB567@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ccdff43-56de-44bd-17f7-08d9ab5bc14e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 12:54:42.1855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PGeKLTd4fvooHBFXUReE6Rh3LJTfSOCVrMlkhbyXaJ4TdsZ2seWASQq6lrZK3Di5r6qvm14rROpJMyjU57tl0wSaTOkxtyOPzUpQ+tpoG814kl4rA4DGpjwq5X6KjSEL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6324
X-Proofpoint-GUID: _Zdv7ha4gaZT_AWtjVB2YvH58rnZLeMZ
X-Proofpoint-ORIG-GUID: _Zdv7ha4gaZT_AWtjVB2YvH58rnZLeMZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111190071

DQoNCk9uIDE5LjExLjIxIDE0OjQ5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTkuMTEuMjAy
MSAxMzo0NiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxOS4xMS4yMSAx
NDozNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTkuMTEuMjAyMSAxMzoxMCwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IE9uIDE5LjExLjIxIDEzOjU4LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4+IE9uIDA1LjExLjIwMjEgMDc6NTYsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOg0KPj4+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+
Pj4+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+Pj4+Pj4gQEAgLTQwOCw2ICs0
MDgsNDggQEAgc3RhdGljIHZvaWQgYmFyX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2
LCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4+Pj4+ICAgICAgICAgcGNpX2NvbmZfd3JpdGUzMihwZGV2
LT5zYmRmLCByZWcsIHZhbCk7DQo+Pj4+Pj4gICAgIH0NCj4+Pj4+PiAgICAgDQo+Pj4+Pj4gK3N0
YXRpYyB2b2lkIGd1ZXN0X2Jhcl93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5z
aWduZWQgaW50IHJlZywNCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQz
Ml90IHZhbCwgdm9pZCAqZGF0YSkNCj4+Pj4+PiArew0KPj4+Pj4+ICsgICAgc3RydWN0IHZwY2lf
YmFyICpiYXIgPSBkYXRhOw0KPj4+Pj4+ICsgICAgYm9vbCBoaSA9IGZhbHNlOw0KPj4+Pj4+ICsN
Cj4+Pj4+PiArICAgIGlmICggYmFyLT50eXBlID09IFZQQ0lfQkFSX01FTTY0X0hJICkNCj4+Pj4+
PiArICAgIHsNCj4+Pj4+PiArICAgICAgICBBU1NFUlQocmVnID4gUENJX0JBU0VfQUREUkVTU18w
KTsNCj4+Pj4+PiArICAgICAgICBiYXItLTsNCj4+Pj4+PiArICAgICAgICBoaSA9IHRydWU7DQo+
Pj4+Pj4gKyAgICB9DQo+Pj4+Pj4gKyAgICBlbHNlDQo+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4gKyAg
ICAgICAgdmFsICY9IFBDSV9CQVNFX0FERFJFU1NfTUVNX01BU0s7DQo+Pj4+Pj4gKyAgICAgICAg
dmFsIHw9IGJhci0+dHlwZSA9PSBWUENJX0JBUl9NRU0zMiA/IFBDSV9CQVNFX0FERFJFU1NfTUVN
X1RZUEVfMzINCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDogUENJX0JBU0VfQUREUkVTU19NRU1fVFlQRV82NDsNCj4+Pj4+PiArICAgICAgICB2YWwg
fD0gYmFyLT5wcmVmZXRjaGFibGUgPyBQQ0lfQkFTRV9BRERSRVNTX01FTV9QUkVGRVRDSCA6IDA7
DQo+Pj4+Pj4gKyAgICB9DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsgICAgYmFyLT5ndWVzdF9hZGRyICY9
IH4oMHhmZmZmZmZmZnVsbCA8PCAoaGkgPyAzMiA6IDApKTsNCj4+Pj4+PiArICAgIGJhci0+Z3Vl
c3RfYWRkciB8PSAodWludDY0X3QpdmFsIDw8IChoaSA/IDMyIDogMCk7DQo+Pj4+Pj4gKw0KPj4+
Pj4+ICsgICAgYmFyLT5ndWVzdF9hZGRyICY9IH4oYmFyLT5zaXplIC0gMSkgfCB+UENJX0JBU0Vf
QUREUkVTU19NRU1fTUFTSzsNCj4+Pj4+PiArfQ0KPj4+Pj4+ICsNCj4+Pj4+PiArc3RhdGljIHVp
bnQzMl90IGd1ZXN0X2Jhcl9yZWFkKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25l
ZCBpbnQgcmVnLA0KPj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAq
ZGF0YSkNCj4+Pj4+PiArew0KPj4+Pj4+ICsgICAgY29uc3Qgc3RydWN0IHZwY2lfYmFyICpiYXIg
PSBkYXRhOw0KPj4+Pj4+ICsgICAgYm9vbCBoaSA9IGZhbHNlOw0KPj4+Pj4+ICsNCj4+Pj4+PiAr
ICAgIGlmICggYmFyLT50eXBlID09IFZQQ0lfQkFSX01FTTY0X0hJICkNCj4+Pj4+PiArICAgIHsN
Cj4+Pj4+PiArICAgICAgICBBU1NFUlQocmVnID4gUENJX0JBU0VfQUREUkVTU18wKTsNCj4+Pj4+
PiArICAgICAgICBiYXItLTsNCj4+Pj4+PiArICAgICAgICBoaSA9IHRydWU7DQo+Pj4+Pj4gKyAg
ICB9DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsgICAgcmV0dXJuIGJhci0+Z3Vlc3RfYWRkciA+PiAoaGkg
PyAzMiA6IDApOw0KPj4+Pj4gSSdtIGFmcmFpZCAiZ3Vlc3RfYWRkciIgdGhlbiBpc24ndCB0aGUg
YmVzdCBuYW1lOyBtYXliZSAiZ3Vlc3RfdmFsIj8NCj4+Pj4+IFRoaXMgd291bGQgbWFrZSBtb3Jl
IG9idmlvdXMgdGhhdCB0aGVyZSBpcyBhIG1lYW5pbmdmdWwgZGlmZmVyZW5jZQ0KPj4+Pj4gZnJv
bSAiYWRkciIgYmVzaWRlcyB0aGUgZ3Vlc3QgdnMgaG9zdCBhc3BlY3QuDQo+Pj4+IEkgYW0gbm90
IHN1cmUgSSBjYW4gYWdyZWUgaGVyZToNCj4+Pj4gYmFyLT5hZGRyIGFuZCBiYXItPmd1ZXN0X2Fk
ZHIgbWFrZSBpdCBjbGVhciB3aGF0IGFyZSB0aGVzZSB3aGlsZQ0KPj4+PiBiYXItPmFkZHIgYW5k
IGJhci0+Z3Vlc3RfdmFsIHdvdWxkIG1ha2Ugc29tZW9uZSBnbyBsb29rIGZvcg0KPj4+PiBhZGRp
dGlvbmFsIGluZm9ybWF0aW9uIGFib3V0IHdoYXQgdGhhdCB2YWwgaXMgZm9yLg0KPj4+IEZlZWwg
ZnJlZSB0byByZXBsYWNlICJ2YWwiIHdpdGggc29tZXRoaW5nIG1vcmUgc3VpdGFibGUuICJndWVz
dF9iYXIiDQo+Pj4gbWF5YmU/IFRoZSB2YWx1ZSBkZWZpbml0ZWx5IGlzIG5vdCBhbiBhZGRyZXNz
LCBzbyAiYWRkciIgc2VlbXMNCj4+PiBpbmFwcHJvcHJpYXRlIC8gbWlzbGVhZGluZyB0byBtZS4N
Cj4+IFRoaXMgaXMgYSBndWVzdCdzIHZpZXcgb24gdGhlIEJBUidzIGFkZHJlc3MuIFNvIHRvIG1l
IGl0IGlzIHN0aWxsIGd1ZXN0X2FkZHINCj4gSXQncyBhIGd1ZXN0J3MgdmlldyBvbiB0aGUgQkFS
LCBub3QganVzdCB0aGUgYWRkcmVzcy4gT3IgZWxzZSB5b3UgY291bGRuJ3QNCj4gc2ltcGx5IHJl
dHVybiB0aGUgdmFsdWUgaGVyZSB3aXRob3V0IGZvbGRpbmcgaW4gdGhlIGNvcnJlY3QgbG93IGJp
dHMuDQpJIGFncmVlIHdpdGggdGhpcyB0aGlzIHJlc3BlY3QgYXMgaXQgaXMgaW5kZWVkIGFkZHJl
c3MgKyBsb3dlciBiaXRzLg0KSG93IGFib3V0IGd1ZXN0X2Jhcl92YWwgdGhlbj8gU28gaXQgcmVm
bGVjdHMgaXRzIG5hdHVyZSwgZS5nLiB0aGUgdmFsdWUNCm9mIHRoZSBCQVIgYXMgc2VlbiBieSB0
aGUgZ3Vlc3QuDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

