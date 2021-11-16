Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3351453459
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 15:38:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226319.391051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzb4-0002SD-6m; Tue, 16 Nov 2021 14:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226319.391051; Tue, 16 Nov 2021 14:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzb4-0002Q8-2Q; Tue, 16 Nov 2021 14:38:06 +0000
Received: by outflank-mailman (input) for mailman id 226319;
 Tue, 16 Nov 2021 14:38:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0oQI=QD=epam.com=prvs=1954156bad=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mmzb2-0002Q2-M0
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 14:38:05 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd1c0c23-46ea-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 15:38:03 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AGEBUkj003624;
 Tue, 16 Nov 2021 14:38:00 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ccd2eres9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 14:38:00 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3373.eurprd03.prod.outlook.com (2603:10a6:803:1b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 14:37:56 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 14:37:56 +0000
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
X-Inumbo-ID: cd1c0c23-46ea-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfUI7UL17Bypco+BJHixiJMmNrFUkucAVpv1vKF0aOq2gtWX5q2MFMxBmbn0999LOy/swFvbAoiW8yX5tNVdjH/EoGkTL8ppDtqelpZa22/i8t5yt2ATEQFNfiMAGnbD4bRw0CwJzwxvGhqTjnj+69ll0QsJkh42bhC921dicW9oJz96dJt+I3loVAjIJTG53xJMWmXlL5kRyguyjPngTJt7VA+UU2c8efbkGuPkAZI7u7oUMwJkw48YhG31jwLdP2YZNt3wxo8XpCX47TrU1ozx03G6TTeD3bHCIRPMwgO93vXUBnMVm4e0Ni8gUqGHUD+KYB6ZIxuTTpfauQdlnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aeODCXBlinvsMCkgTSF54MVgtDGxvygK4tdxR4Pe0A=;
 b=odU6zN6Q1d7Dfe6L8JiPYhpOJviOaeeZXut4i0m5Ac1JGSDGNwp2SKnu9D9p8oZSpv1r0NEwP3ubybLhTWh6wLdK4EVEOs15gn8kb7tM8z1+lgaTMTzHllJFakM4ikUDYboGCLGg8fWfaXV1v0H3HNFrEErc0RnGM7xy7mtBOZWIeVPV0qfAgjPF73tSdFh/+bJvEyz27+Kc+NxA4s93YWOFYNvGTdzBchWKvslGhBBImaxUS+P7DSKL1Vh+QBkycI8Y1qzHzX+yHjJev1DSxWYqFqVXfXV3V5gvC1jFTzL54mq1Tt5XpE+WJwOcWLwg9Oud/lpwm3yL1rj6ZPaBig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aeODCXBlinvsMCkgTSF54MVgtDGxvygK4tdxR4Pe0A=;
 b=pKi5aSqzDQqJvfn/dlxhkU/HL/vFUEpaqwLA99UOyKlNF4GV4VogLLsZsFYrNj1TatnHMvPK5OOcV0TxXDeaBD8AXY8fz1k2O5vtTE1nBL6cHb03MeueHEj6HNWpznRJGW586kCYUFUlVM6qSNT7rMGX9ms2uLXrkcLf/97Zd28KMUC6SrJG1aRo+S3sssB5DzlZ0YFdpvRu7m8rRQwHkVXYTNBGMtoMyLAA8yrhfXBUY2TP6tODJzgK1jLiKYEbZWwqdA5EPXfwrsrmbJeUYgS3r5Gg8n0wGrdxLmWoQaAYlN9T3LWedPTsDgDA7CHThqTyUw2tJ4GkEJ2GW7GByQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "julien@xen.org" <julien@xen.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Index: 
 AQHX0hJIYALl/D9fL0OD6N0XGDJh2awE30EAgAD09oCAAAgGAIAABgyAgABY44CAAAjHAIAAAz2AgAADwIA=
Date: Tue, 16 Nov 2021 14:37:56 +0000
Message-ID: <5c670333-42be-b080-8c7a-a166d681800b@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <5bd70935-4968-b8d4-4d6c-7ec0fc54ee6a@suse.com>
 <4e12f7de-19cb-bc79-4df0-6fb52538a944@epam.com>
 <5b47cd28-5264-9f24-38a0-e9dec6c2c1b4@suse.com>
 <b87a51d2-cd96-d0ac-8718-7f2b2feed531@epam.com>
 <ad01ebdc-7fb8-3c76-d953-08b73b4b0c25@epam.com>
 <fc1fdee4-e567-038f-a90b-127548a8da02@suse.com>
 <55a95ff3-6717-780b-25f9-c43728b6270b@epam.com>
In-Reply-To: <55a95ff3-6717-780b-25f9-c43728b6270b@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8e8f8dd-12df-4d29-8c24-08d9a90eade0
x-ms-traffictypediagnostic: VI1PR0302MB3373:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB3373412559E99BAAE0571FEEE7999@VI1PR0302MB3373.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dqiTLlSTB45RBsZTH+Sm5ZuJJkvSHpk77L2SUGUrsO7laAWgxTXsODxzn0A+aj3WfDUP9/Y14yz+8M8HegKiUnL2GzqTmkzZzZ9AeQgdjEBsF2v3lB6lbdyI9NXhA7olGHpYALWZucgHLDJfBILjw9TRb80iOH94FCAwmYG/yiXb2h4Ce9QA4sf+wZ48nx3t29JnCoThigVrCrJqprvF9/6U3iNWLcS3JQAFy+Qh711T0cBLJ8JrPQt/MxE+EqJLrVg5wRnDP8VP55YOrCPujBJNs9IlNKsTp7v/dfCrvQPmAf/Gd1LG+oHcwJ0/5FnqMTfQthd4OQ/o5zAO5/kS7FcVo9fsRqVT85oR2OxSN6igMd/dnYjkjv3pTVFKsjetQN7619fncnr6D/lfXMyDSxm1lM2ObJyRfvZXSNdFaJruLtAQfZaWTR1TlkuCSJsQoANV/kocXyeT6dkbycruO3UiXxlwjX0zg0WYjkS5h0XETLdJbAXfBBe3Mlv8WiRPpu37KmG4XWyCgpTBR7kGrWd+h77Wx3yLNKu/YK8p3TadSuWb1U7yGlQIvNO1DEEcx2uxvr1wUTBEWdCLw2QO8tpcqttwh8FHvMd9lO/XnKYyfH+LKYss5RSw4YIvWKBwxnr2fS6eZ1v8yWBtINxoIPPTX1euVSqucQWPTgBRD8jngW6N3/edxgjwjwIb/E7QV2bDrDVq8WsSCtehwjJKheIoZ0sRBYzuX4YZ0a9AndompYJ3N98zMo+8Fcx8B+uAYEDCgl9MTOMy+XzDcHAjGy198g/rBnaGhrdUEM0LEB6ZyI2nSchp4zlgxhFsHAaYOSimHTXy5siH2kMfAjzEcA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(31686004)(6486002)(91956017)(186003)(2906002)(66556008)(66476007)(64756008)(66446008)(26005)(66946007)(53546011)(6506007)(71200400001)(5660300002)(38100700002)(4326008)(7416002)(966005)(316002)(31696002)(107886003)(8676002)(122000001)(38070700005)(54906003)(83380400001)(110136005)(2616005)(508600001)(8936002)(6512007)(76116006)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TE9mZnVYMkUwMmRXT0ZzcVIyUkV0THVqUFlBQi95MU5Mekowc0lkZklGbHVz?=
 =?utf-8?B?Q1I3L3owSm1wenhNclVlSGd5VXdZQ1h4M0R3RWt2eFdqVGowSGVxZkVFZFJj?=
 =?utf-8?B?TVl0eStURkR6Vk9XUWlORzF5eXRrVHJEL3lQN0c3UGhwb0puelFFWkplVjRz?=
 =?utf-8?B?MVJNQjdlR1ZzbDVGNXpLd2VTaS84OUF4czZHdkcvVnZDTzFpQzdLa3ZGRGwv?=
 =?utf-8?B?bmhCeis3QlhtTjhlLzE3eUw5UW1FVFRwbTI3SW9LVlh6ZzdxSHNWbGFtK2ho?=
 =?utf-8?B?Ti9yT25KdFFMdENOczVHRDA0Rk9Dcmd5N29RcnlTS3U5YStTZWx5aEMyOGpZ?=
 =?utf-8?B?SWU1SlFnOFVpSStYbkxxajhaYU51NndxNDJCSkp4Vk9nTE81VmhUcnhXaHdV?=
 =?utf-8?B?QkhRWWVYZDY3NXdkeEIzQm1uM0NKVTNzblVVNUdyd1F0b2NDMTZycmU2eWJ0?=
 =?utf-8?B?UmpRY1JzTTlvUXFFUHFlZ29JcHB1NnNSWjNmMk9DenQ0Zm1Qdmk0azRpZzZ6?=
 =?utf-8?B?ZHkrUmtzejg0U0x1azRjVnpkWnlhVFlOMUptOENNZTFTQitnNEdxRDEyUWhE?=
 =?utf-8?B?TVE2MXQ0czRmZVc5RnAyZEtOMHB5TkM4aU5JYjhnRm5LOG9zUm1SL0MwQ0Vn?=
 =?utf-8?B?YUszbEZoc2NEV2VBQlNUWnoxUzE4Ry9XaGJ1SHBDQVg3ak1FaURHdHAzRnla?=
 =?utf-8?B?WVUvS3VVc3ZWeWx4aHAwTU1WbUlQU283bmd0M3k5RWNyS1d6V3Q1TmNMQ25O?=
 =?utf-8?B?MkE3NzdKWmlWQ1FRSDlTbnhXNVZDUm5jaTYwemdYQW9IMkRJb0M1QkJYTnRn?=
 =?utf-8?B?a2xWUlJSOC9kYnFpQzFzd3IybXhUd0FPQ0JxTGtMTmVjZFFOMnJGNk9xdWZ0?=
 =?utf-8?B?eERsQUYwdHU2NlJlTDF0VEFTakhiTkRDQ3craERnN1JLYWVxaytTTXMydTVG?=
 =?utf-8?B?VElaSjQzRlE1SFBCNkpQc0h1V1Y3dlpVUmQ2d0liaE5GUmNnVDdqd2Q2UTRr?=
 =?utf-8?B?TzlkV1hCM3l2dkZRNnppSTU0WVRKTndzNGw1RnVNM1l1am50K1ppZk84c1o5?=
 =?utf-8?B?dVd6UnN5OXVHaFhGTWIyUUwvbDJraUFVdHpPeDlOOG5reUZZSzhTclMxOU1D?=
 =?utf-8?B?VFlCS3Rod2M1VGFkZHVTRHloYkkwcGxlNUx2dk15U2NvMUhQMjFvN3d5bkF1?=
 =?utf-8?B?THA3UkFKVGRsVHh4T29INmg5V3hMZlI0SjE2VE9ISnQyNHZzS0w2RDZaYnhD?=
 =?utf-8?B?cHlnS2VBbFdOSzZtd1BIMEV6M1B2NUVKTnlZbU5rYWt2aVA2c1Q2ZDlXVFZh?=
 =?utf-8?B?OG1OYng5c05UTFU5MEVONFRqeC83ZkhSN1FkTXZudHJwY3JERWVEM0NnTnkx?=
 =?utf-8?B?TjU2NDRLcXFpZ1BTNGY2RWEzU3lreGIzWnZ6ejJZc2ErczQyTGpwcnNBV0FB?=
 =?utf-8?B?VTkzRlVGenhvYmR3RkhhME9BdkNHTmRreTEveGdyUW94UHFCOEdlYzZlY21y?=
 =?utf-8?B?djdhbFhJRWl1NHJBaW5PVlR5anRjN0ZKR0xEVUFIbVlvNTJuSnFvSzVHQm0w?=
 =?utf-8?B?bXBuQzNDSXR2NlgzdVNzT1dzSjVTZDZXNkk1blFNNThOc3RlSU5BUVFxN2Yy?=
 =?utf-8?B?VUx2LzZRU2RHaDM5UUJCNGlpdmkraytUQ3lubndIcmQ1NnJwei9jQ2tRK0FV?=
 =?utf-8?B?eUNvNktqKzZSWkRCNUFuTXh5QnJTRHdxbFphRU5nUmZuRC9wc2JZMDh0Wkdt?=
 =?utf-8?B?eVJTMUN5aW51RG05c0pwYnJ3RmJDOXhUM24vNXVrRlAyNjVpOU1TNzRIVHRp?=
 =?utf-8?B?K3FjOEhBSUdKQkdZbG9MNm9qY3RKOWRRcVRnQk5kMktPWDFkK2MzaTZ1QXZ3?=
 =?utf-8?B?SU1LWDJVOS91NWdtZU9SQXlsQVZoOFg5VDVWdEZsOVBGNmdTejJ4YnRLUUE5?=
 =?utf-8?B?eTJZUUdYL0RxNGRrYitsV3RJbkpqSzRWYWVSallEMi9Mb0lUTm5VbFdXc1hB?=
 =?utf-8?B?czFIVDY5dnQraTg1U2M4UWl4a2MvZnV6SlpmV2svV3BveXVKYVdFeU1TRS84?=
 =?utf-8?B?OTJUL2ZVTUl1WmtvalhxeGJzRG1qMTZ4T1Fad3J5ZEZ4VHR6azl3MlBpOXFn?=
 =?utf-8?B?Nyt2VlM2dzEwQ3p1U2NlT0Z0UEtKaEd1TUR3RXhnNXVRRk11S3Bid3h4dWh0?=
 =?utf-8?B?NC9FWjVwTHdxaGRlUDV4ZndpMkI0NzR5MnBDRERsa1B0Q3NsbkVwTldDUi9V?=
 =?utf-8?B?elAzRlRValltY0QrdGFidUtBcG1Nc0t1NVZOVDNkTnNvRjA5Q3BoQVVpK2ZS?=
 =?utf-8?B?enU1bWdCc01pVnRMd3RNR0ZYbEtKOWNheVBHd3llUnEzQ0w0QzNKUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE855C91D5FDD943B1F96A4CD681AFC1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e8f8dd-12df-4d29-8c24-08d9a90eade0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 14:37:56.0630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IgCu0ypjonul2qb6s5zrIIgErB0CmA4HfSQfrqFDWuEhYUm63+NeldnG6IMNhpGaza/sIL/OPX0H/4jfeOphVrUIaR9EvRnuXMhlIdEqTBqIc0gSzQbuaF4gJxE78SBj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3373
X-Proofpoint-GUID: rQitMIV3M9D83PXr0kxequqAVy-ZXkNZ
X-Proofpoint-ORIG-GUID: rQitMIV3M9D83PXr0kxequqAVy-ZXkNZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-16_02,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 mlxlogscore=787 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111160072

DQoNCk9uIDE2LjExLjIxIDE2OjI0LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4N
Cj4gT24gMTYuMTEuMjEgMTY6MTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMTYuMTEuMjAy
MSAxNDo0MSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4gT24gMTYuMTEuMjEg
MTA6MjMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAxNi4xMS4yMSAx
MDowMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAxNi4xMS4yMDIxIDA4OjMyLCBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAxNS4xMS4yMSAxODo1NiwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+IE9uIDA1LjExLjIwMjEgMDc6NTYsIE9sZWtzYW5kciBB
bmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+
IFdoZW4gYSB2UENJIGlzIHJlbW92ZWQgZm9yIGEgUENJIGRldmljZSBpdCBpcyBwb3NzaWJsZSB0
aGF0IHdlIGhhdmUNCj4+Pj4+Pj4+IHNjaGVkdWxlZCBhIGRlbGF5ZWQgd29yayBmb3IgbWFwL3Vu
bWFwIG9wZXJhdGlvbnMgZm9yIHRoYXQgZGV2aWNlLg0KPj4+Pj4+Pj4gRm9yIGV4YW1wbGUsIHRo
ZSBmb2xsb3dpbmcgc2NlbmFyaW8gY2FuIGlsbHVzdHJhdGUgdGhlIHByb2JsZW06DQo+Pj4+Pj4+
Pg0KPj4+Pj4+Pj4gcGNpX3BoeXNkZXZfb3ANCj4+Pj4+Pj4+ICAgICAgICAgcGNpX2FkZF9kZXZp
Y2UNCj4+Pj4+Pj4+ICAgICAgICAgICAgIGluaXRfYmFycyAtPiBtb2RpZnlfYmFycyAtPiBkZWZl
cl9tYXAgLT4gcmFpc2Vfc29mdGlycShTQ0hFRFVMRV9TT0ZUSVJRKQ0KPj4+Pj4+Pj4gICAgICAg
ICBpb21tdV9hZGRfZGV2aWNlIDwtIEZBSUxTDQo+Pj4+Pj4+PiAgICAgICAgIHZwY2lfcmVtb3Zl
X2RldmljZSAtPiB4ZnJlZShwZGV2LT52cGNpKQ0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IGxlYXZlX2h5
cGVydmlzb3JfdG9fZ3Vlc3QNCj4+Pj4+Pj4+ICAgICAgICAgdnBjaV9wcm9jZXNzX3BlbmRpbmc6
IHYtPnZwY2kubWVtICE9IE5VTEw7IHYtPnZwY2kucGRldi0+dnBjaSA9PSBOVUxMDQo+Pj4+Pj4+
Pg0KPj4+Pj4+Pj4gRm9yIHRoZSBoYXJkd2FyZSBkb21haW4gd2UgY29udGludWUgZXhlY3V0aW9u
IGFzIHRoZSB3b3JzZSB0aGF0DQo+Pj4+Pj4+PiBjb3VsZCBoYXBwZW4gaXMgdGhhdCBNTUlPIG1h
cHBpbmdzIGFyZSBsZWZ0IGluIHBsYWNlIHdoZW4gdGhlDQo+Pj4+Pj4+PiBkZXZpY2UgaGFzIGJl
ZW4gZGVhc3NpZ25lZA0KPj4+Pj4+PiBJcyBjb250aW51aW5nIHNhZmUgaW4gdGhpcyBjYXNlPyBJ
LmUuIGlzbid0IHRoZXJlIHRoZSByaXNrIG9mIGEgTlVMTA0KPj4+Pj4+PiBkZXJlZj8NCj4+Pj4+
PiBJIHRoaW5rIGl0IGlzIHNhZmUgdG8gY29udGludWUNCj4+Pj4+IEFuZCB3aHkgZG8geW91IHRo
aW5rIHNvPyBJLmUuIHdoeSBpcyB0aGVyZSBubyByYWNlIGZvciBEb20wIHdoZW4gdGhlcmUNCj4+
Pj4+IGlzIG9uZSBmb3IgRG9tVT8NCj4+Pj4gV2VsbCwgdGhlbiB3ZSBuZWVkIHRvIHVzZSBhIGxv
Y2sgdG8gc3luY2hyb25pemUgdGhlIHR3by4NCj4+Pj4gSSBndWVzcyB0aGlzIG5lZWRzIHRvIGJl
IHBjaSBkZXZzIGxvY2sgdW5mb3J0dW5hdGVseQ0KPj4+IFRoZSBwYXJ0aWVzIGludm9sdmVkIGlu
IGRlZmVycmVkIHdvcmsgYW5kIGl0cyBjYW5jZWxsYXRpb246DQo+Pj4NCj4+PiBNTUlPIHRyYXAg
LT4gdnBjaV93cml0ZSAtPiB2cGNpX2NtZF93cml0ZSAtPiBtb2RpZnlfYmFycyAtPiBkZWZlcl9t
YXANCj4+Pg0KPj4+IEFybTogbGVhdmVfaHlwZXJ2aXNvcl90b19ndWVzdCAtPiBjaGVja19mb3Jf
dmNwdV93b3JrIC0+IHZwY2lfcHJvY2Vzc19wZW5kaW5nDQo+Pj4NCj4+PiB4ODY6IHR3byBwbGFj
ZXMgLT4gaHZtX2RvX3Jlc3VtZSAtPiB2cGNpX3Byb2Nlc3NfcGVuZGluZw0KPj4+DQo+Pj4gU28s
IGJvdGggZGVmZXJfbWFwIGFuZCB2cGNpX3Byb2Nlc3NfcGVuZGluZyBuZWVkIHRvIGJlIHN5bmNo
cm9uaXplZCB3aXRoDQo+Pj4gcGNpZGV2c197bG9ja3x1bmxvY2spLg0KPj4gSWYgSSB3YXMgYW4g
QXJtIG1haW50YWluZXIsIEknbSBhZnJhaWQgSSB3b3VsZCBvYmplY3QgdG8gdGhlIHBjaWRldnMg
bG9jaw0KPj4gZ2V0dGluZyB1c2VkIGluIGxlYXZlX2h5cGVydmlzb3JfdG9fZ3Vlc3QuDQo+IEkg
ZG8gYWdyZWUgdGhpcyBpcyByZWFsbHkgbm90IGdvb2QsIGJ1dCBpdCBzZWVtcyBJIGFtIGxpbWl0
ZWQgaW4gY2hvaWNlcy4NCj4gQFN0ZWZhbm8sIEBKdWxpZW4sIGRvIHlvdSBzZWUgYW55IGJldHRl
ciB3YXkgb2YgZG9pbmcgdGhhdD8NCj4NCj4gV2Ugd2VyZSB0aGlua2luZyBhYm91dCBpbnRyb2R1
Y2luZyBhIGRlZGljYXRlZCBsb2NrIGZvciB2cGNpIFsxXSwNCj4gYnV0IGZpbmFsbHkgZGVjaWRl
ZCB0byB1c2UgcGNpZGV2c19sb2NrIGZvciBub3cNCk9yIGV2ZW4gYmV0dGVyIGFuZCBzaW1wbGVy
OiB3ZSBqdXN0IHVzZSBwZGV2LT52cGNpLT5sb2NrIHRvDQpwcm90ZWN0IHZwY2lfcHJvY2Vzc19w
ZW5kaW5nIHZzIE1NSU8gdHJhcCBoYW5kbGVycyB3aGljaMKgIGFscmVhZHkNCnVzZSBpdC4NCj4+
IEphbg0KPj4NCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9hZmU0NzM5Ny1hNzky
LTZiMGMtMGE4OS1iNDdjNTIzZTUwZDlAZXBhbS5jb20vDQo=

