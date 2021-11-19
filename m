Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB4B456FBB
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 14:35:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227933.394366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo42e-0006D4-H2; Fri, 19 Nov 2021 13:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227933.394366; Fri, 19 Nov 2021 13:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo42e-0006AV-Dw; Fri, 19 Nov 2021 13:35:00 +0000
Received: by outflank-mailman (input) for mailman id 227933;
 Fri, 19 Nov 2021 13:34:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W8RP=QG=epam.com=prvs=19578d545c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mo42c-0006AP-V3
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 13:34:59 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c2b5eb2-493d-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 14:34:57 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJDJ3iV011266;
 Fri, 19 Nov 2021 13:34:53 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cecpu02p9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 13:34:53 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4308.eurprd03.prod.outlook.com (2603:10a6:208:ce::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 13:34:51 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 13:34:51 +0000
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
X-Inumbo-ID: 7c2b5eb2-493d-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MC8RoWj3XDHS8p31qySd/C54+xlMpgVIR/jALES40d13e6+lpJPBBjouWI+DUnL7iXiW5rYk/hexsouNACCgAYMMqbFfUCmvN9wzGNcxZG/Z5tvec4xnggyHFhPSGgVs3kf9hwq87WQYOWIS+/fcPSSxWrH9BdVEpL3F8ClrBJAEPubv5kkCBmlGAQbAqAN2hgHrmFzC2wmPMKeWkBRu4wr5Gt1DzlC/OvWwI99YkiCaYUihPkPnawQ8zKBaTXHSUgUCsefLNDhTS8bug7i3WQ/ni30tWNqPrDNA3r4WIlfNw+67v6BbPAurHyC+4NBWX6B7oALiMCN4gsAa2ldrFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcw0J4GqCtUIz1RA1xN4GAXtWoX3iuBWZzMB9jOuM5U=;
 b=f/SFqDtzqmnLZt0DGsXmKayTXZ6hkdk3V0ceM/BnFAFDFU9SphyTd1YQopL/W6QpX13bltjmZDcp6KjVssQbC4MID9oi+xc5GxcJGwtvnQ3tRFCe5cMJOlpzQt56CzJS/hppTnQbiGQYRQU8wQD7eT52PV/OvHl2yll/kC5ijIRac2zVaqd9dEfFC/2yoTrvWE/kP1Y17QZnlJHLoZpzJJ2FAXMXA3awKS7VKHrLVnn92cEXqufUVsR+Mzg9K9rWJjHYV4t9r3T9YAj2+XbkqHo3a0WAde0dDLMe6XFm7/zrwSZAJD4cuv5Fedaq/n8ZsfOJNyX4moYPaW5bRTGPSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcw0J4GqCtUIz1RA1xN4GAXtWoX3iuBWZzMB9jOuM5U=;
 b=bZHBgy0t7LRgsMsLBQ4k6SudBnW48cghy3a1Pyfned5KueAO0+Q1IG2tNBBy1s0Qizd6kCxMOn66kYxxSlGBva1wYKtDCUIcZlH59FO/9sN3aB9WBr6L3eeCRiNn+Ete7EoEjSTKelTy/r3She6blcof1IsN0aR6uOpsgW3xR/74SjU9oYO03eQYEzQzGsbogQGU8vBeMTaKsDuHyQeDE466yry06bG2x/6O97ek3Y1g3Hu0KZkKknzIh3yCsO3GK8USQLBV1FcStg6QlgKVWXMrA7YgMsR5QqMQEMby+r0uyWBlebq4ZUCgXwbeqi+LbXzPb8m+iTz2OG7hsfBckQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        "julien@xen.org"
	<julien@xen.org>, Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Index: 
 AQHX0hJIYALl/D9fL0OD6N0XGDJh2awHdhMAgAGHTYCAAA1EAIAABOkAgAAF6YCAAATnAIAAQRQAgAAGPgCAAAR1gIAAAvIAgAAFxACAAAoGAIAAAXMAgAABgYCAAAVtAIAAAX+AgAAB1wCAAVryAIAAB06AgAAEPgCAAAKhAIAAApkA
Date: Fri, 19 Nov 2021 13:34:51 +0000
Message-ID: <4e74d5e1-f54e-3888-ada2-a38545571744@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <d9620e9c-ef21-ea7b-0b25-16770fa47073@suse.com>
 <e77ebf8d-0be2-7b4c-4169-db239bfa8e80@epam.com>
 <e17ee963-d498-00ef-a5c5-1fea73ed4898@suse.com>
 <d9692f93-a58d-1513-1f22-7d0cbc7b3b6e@epam.com>
 <b45c172d-ab51-a02a-8e29-3b31b6319f4d@suse.com>
 <17c7485a-2c44-63ec-553c-5caa9b8eb70c@epam.com>
 <YZZdU1oCaMt1HxTj@Air-de-Roger>
 <b7cb9ce7-fee9-f16d-572c-c39b3ff75d62@epam.com>
 <bf8f1c03-d872-094b-4a3c-3b15706babdf@suse.com>
 <816d3519-f007-80e2-e07f-ff285640926b@epam.com>
 <ecd83d8f-f290-295c-e073-583aa70a8c1e@suse.com>
 <2db325e9-0349-1cc3-1c4a-fefa048f181b@epam.com>
 <ac0cc710-05b9-bdae-c31c-d159b4de0105@suse.com>
 <00e78d11-8e7b-84d2-5aa0-0a7f82f13af6@epam.com>
 <7dd919b8-0e3d-30dc-302a-9964f9d94ad2@suse.com>
 <fec02ac4-1ecf-18e1-7ed6-3b1094d60890@epam.com>
 <126a2864-e7e3-b887-43ff-55b1e59151b4@suse.com>
 <5baf1199-e12d-cc41-4520-e32ed29a0436@epam.com>
 <fbc8a807-ea73-760f-8c75-df0930a5139e@suse.com>
In-Reply-To: <fbc8a807-ea73-760f-8c75-df0930a5139e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79f80d4d-f0c8-40a6-9972-08d9ab615d2f
x-ms-traffictypediagnostic: AM0PR03MB4308:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB430847DB704A766C0F56F808E79C9@AM0PR03MB4308.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ojtzpU8xX/ImOlMRTcAYh+6igb7V6XnUzKMusOTBUfwyOn++Qsm5QiBVqjhMoA7ey/s6nkWQF5re4Nz9CrQNT4ym61vNwSZuFYvx100kfrC64mGTJ0pAIpCW2h8hSU6DwgqludqMaVyGqgFcqMNiBZvPGmq1xez1j8Pazd5hLWP1ykOP54oWYaFbKTaCI51AxOcS/IDTqKsTQIhOuKyuzgb4rvR24Sv7GJ7ft27fxLBzeyd0+rBxAAwExGnrMbFD7eKb2ZXLSopeAw2TMOvIocFRGHtIdW9YD/pHcVyJWidKdkVIQYN2UHHlSCnqv6JpOWBcWMzsMSWVd3rEp74NjkRDnm28iZNSzN/nXJKjmKJS8p5cNblNu/3LuXROsROvQqHWhMS6M12GZFygRnmclZqMAXaDHoiNeNWf2Ck3OFgsdg8Zk7qGDVqRIJVEzcpVEnAbviaGSuXL1JCT+moE0wAnJJf9qFzj+WRc1PbQmq++yiMkRGpocRJX5P5ZCuz6GiF5e6jxg+PusSki7LKYoNgl0HbadJdoSsEY7s4LXzvanFMpHcfmYtw29u16p5rTFRpFvETJ4cKUK590BUbgzDSEZXXf/ME/gfD7dwUckLP5ldA7UAlVQnQx3Q6algFsqYefzhD/ElRxVXJAkJzqRSLQVOBDfWsAdp0veteqd+5SBAV9sGiDNKasXrDp/B2fs+03nQVREkdVoOJA2X2mrPvzOejZ7QYOLsP0trTQ58IhArArK5ET/iWZOMJL/fJd
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(31696002)(7416002)(5660300002)(36756003)(6512007)(4326008)(122000001)(508600001)(38100700002)(71200400001)(2906002)(66946007)(91956017)(83380400001)(6916009)(66476007)(64756008)(31686004)(2616005)(6486002)(66556008)(186003)(66446008)(8676002)(26005)(38070700005)(8936002)(76116006)(54906003)(316002)(53546011)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YmVrWE5rWVFhMGhPSXVOZlNRZ0pIRXBpOUo0ZEFXL3BFcjY0Y2UvblFXNmxy?=
 =?utf-8?B?YmdRVm9XUVdjUXNTem5JbEo0YjJFbm5TN3grb2RGaHorZTdLV0NKdEdBTTBj?=
 =?utf-8?B?ZXZHd2NGS2JQK2wzR21lVnlsdDdwL0FPOWUxT25jcFBMTndMQ0E1ZXF4djJL?=
 =?utf-8?B?aTFyMmlRbXlyZ3RlYlgwRzF1S1VKRzlZQ1JxejBScTJ3bEZTZGdtdElKRVo2?=
 =?utf-8?B?cUhaWmRSc2NrRXd2OTU5SzRoSVJ6bWlIb21PQmZncS9QSTA5Qm44MjU5QkJR?=
 =?utf-8?B?NExNVlNZQkJTKzdiQUpMRktES21kamRqTythZUprc2pjbzZIcUorWjBjMHNP?=
 =?utf-8?B?RjVHZFRvbUxnNDUwalpiRHhxZUk2UXFPaytoS2ZQbVR5emdnTDVVSEZCaDcr?=
 =?utf-8?B?bWR6Y3BPb0RrVFN3WmVSUmlsTU42ckthMEdsb3YycjhMS2l1eldxeWs2T1FN?=
 =?utf-8?B?cU9TVDRKTDUxNm5uOEpJQVlaRnRQaEdpTGhVdW1iWXJEL2g4SHF0Z2VQaEU1?=
 =?utf-8?B?M1dvR0JvRmpVTXFyRkFoTHRKSXRzTm40SDlkdkJLUGo2N1RzU2ZJTTVxT0di?=
 =?utf-8?B?eU1FM1dqUTFJZDM1UzYzd1FPVmljdzEwT1lnZWk3RGdHTXMxYVlodHdLTFlT?=
 =?utf-8?B?SzBGMExrdlZNdlM3ZHdOOFdDUW41b3pMYzVhcVpXREFpSEpxVXEzcjB2d0ZM?=
 =?utf-8?B?UlgxeFQ4QjBVTVZlalIwaVhYdktkK3l5TDhINFFOTkx6czliUXNWYlFVR3k3?=
 =?utf-8?B?eXVoa2xSTVo2NUJoMFNDTzBmeVBJOEU0ZThmMDl2ZW9pTDN2cEdmdS9HK2tM?=
 =?utf-8?B?SXRpWUxjcWRmc0l3ZTY2WFhoRlAyLzhEeUdtYTU4ZmNib0FldXk5N2ZIaU52?=
 =?utf-8?B?QTUzd2JxaWlDNVRidmJRU09xMFFPNTBCV1Z1cEp3WEJKYWo1eHgvbU9pYkRm?=
 =?utf-8?B?U3FTUlo5ZVdjdklKK2xPcGRQYXIzQVRsS2Z5SlBpeGxaU0QzYWxkTVRpN3Np?=
 =?utf-8?B?THh0c0d2UWoyVStiZGM0QmFXMkxZN0UxQThKTWFiSzNsc2VPYVIybVNGU2Qw?=
 =?utf-8?B?Q1NKY2M1eXRwOHRrZDFzVlVOYithZEt3VXdXci83OVlDbFgwaHE0QVN4THJn?=
 =?utf-8?B?dlEvM1hsczRTN1NUbjFobldyUTFaYXcxU0VnVmJEMXQ2UEtSTnFiY3A0YTVx?=
 =?utf-8?B?MFIxVkcyQmRNYmQ0Q29XQnhVTzkzZVhSQUxKdVFTVGdYRG5EaUV2Ny9LVDNn?=
 =?utf-8?B?bitKNkFmUlAwV1JOMVkwcjh4YmVHWFNjdkEySzVZUHFiZldrYnIxZk9WNStt?=
 =?utf-8?B?N1ZLMWh6bXYveURNUW1QOUF6bGs5ZktkeW9jRkFEeGEzc0o1OFdVb21UcE0x?=
 =?utf-8?B?NFp3VUhMS2tpejg5RG02R0tGaFdHVUQrUnd1YWFGY3FpQW5CU1hCdjFBSmsx?=
 =?utf-8?B?cmRsampGblpCTGlqN0xHNWZuU3hDSVczcDB2VWhXUkpKS1NldjBhNkw2Tkts?=
 =?utf-8?B?NHI5emZKSGNta3V0TzZSMVNrN1I1SkRIR0xMOHJlbnhCSkNxSW9EYW50Q2wv?=
 =?utf-8?B?WTdnRjJIaXN3QU9aK05nVkZqazA2OEhwa0ppdXJoQnZONWZkR1hrT3QxcUw3?=
 =?utf-8?B?ZVJQUyt6Zjg0bmtDYXRUKzZIVEJjR1V2MkovUmg2MGJpako3MFJSK0xHOHlT?=
 =?utf-8?B?UmVsVEc0UDd5SHhsampVRWp0MHV6allweVc2b1BsaE0yZEtpbDEzc2dPVlRZ?=
 =?utf-8?B?WXYxWE12ZVFNUWZBSFdhMFQ2eEtlVkExT1dqSlFjYWIwNmV5c2lLV1JSVGNn?=
 =?utf-8?B?c2VvQnN2RlVZbnExUnFzcW1LMTJxdjEwekpOSW4vZHppSVRlZStXSjNvQUtG?=
 =?utf-8?B?MEdZYW1Rb1R5bnRidit2dXliTWY4MnZGWG1hNG1mZ211MVo4ckxxNEhLMGJC?=
 =?utf-8?B?R1QwVjJ5NWtEZmZ2NDYyczZGNExxYnJHVlZIU2ZBWk9jMzlISDhvaG42dHdR?=
 =?utf-8?B?MmkvcmhZYkMzV3JMK2ZMSWRXbFYvaFdlckYrNG9RTWI2dTIwZXhtWWsxQ1dC?=
 =?utf-8?B?bE1ER3VkcTUrTThweFpaSDY1eURDbk1jT0hPVHIxT25xT0xJMGliRjQ4c1Q5?=
 =?utf-8?B?aWhoeTBJTjRmbTVNcitxaWJKcnB3Sk94eVFJYkhZakJHQVM4RXRZZUFDMFNt?=
 =?utf-8?B?TXQ5dUM2S1l5SkNFYkkvM0FHYmozd3dsRkU2UFV4UzFCdFF1NUN1dUZucnkx?=
 =?utf-8?B?ZkhRektKWFM5MjdkdXArMWV1OTI1RHhUTGdrMyt0YnVNcG53L09zbGhKVUR0?=
 =?utf-8?B?ZmdnYmVrNUdvaTZpNVNSczNiSHU2bkFtLzFBbUxLaDBDMTZUMTZrdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBEB874FC1B4A24AB35BE2F8FAFE628A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f80d4d-f0c8-40a6-9972-08d9ab615d2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 13:34:51.1819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q7wYPg+pUsqtwDgrrkBaEENAPodC+T5vf0wf+ASW80wIt8E2qVyiaQ44MtI+KM2vELxbBaJoNxKyR+zh5ZRi7AiL4R037qd3hhU5Dtd0Zw8UToGPP9a2AgFDfKXThXpo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4308
X-Proofpoint-ORIG-GUID: S95Uf8GOmRoVi4ewmDp2D8geRskGjUdI
X-Proofpoint-GUID: S95Uf8GOmRoVi4ewmDp2D8geRskGjUdI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190076

DQoNCk9uIDE5LjExLjIxIDE1OjI1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTkuMTEuMjAy
MSAxNDoxNiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxOS4xMS4yMSAx
NTowMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTkuMTEuMjAyMSAxMzozNCwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IFBvc3NpYmxlIGxvY2tpbmcgYW5kIG90aGVy
IHdvcmsgbmVlZGVkOg0KPj4+PiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0NCj4+Pj4NCj4+Pj4gMS4gcGNpZGV2c197bG9ja3x1bmxvY2t9IGlzIHRvbyBoZWF2eSBhbmQg
aXMgcGVyLWhvc3QNCj4+Pj4gMi4gcGRldi0+dnBjaS0+bG9jayBjYW5ub3QgYmUgdXNlZCBhcyB2
cGNpIGlzIGZyZWVkIGJ5IHZwY2lfcmVtb3ZlX2RldmljZQ0KPj4+PiAzLiBXZSBtYXkgd2FudCBh
IGRlZGljYXRlZCBwZXItZG9tYWluIHJ3IGxvY2sgdG8gYmUgaW1wbGVtZW50ZWQ6DQo+Pj4+DQo+
Pj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hl
bi9zY2hlZC5oDQo+Pj4+IGluZGV4IDI4MTQ2ZWU0MDRlNi4uZWJmMDcxODkzYjIxIDEwMDY0NA0K
Pj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0KPj4+PiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vc2NoZWQuaA0KPj4+PiBAQCAtNDQ0LDYgKzQ0NCw3IEBAIHN0cnVjdCBkb21haW4NCj4+
Pj4NCj4+Pj4gICAgwqAjaWZkZWYgQ09ORklHX0hBU19QQ0kNCj4+Pj4gICAgwqDCoMKgwqAgc3Ry
dWN0IGxpc3RfaGVhZCBwZGV2X2xpc3Q7DQo+Pj4+ICvCoMKgwqAgcndsb2NrX3QgdnBjaV9yd2xv
Y2s7DQo+Pj4+ICvCoMKgwqAgYm9vbCB2cGNpX3Rlcm1pbmF0aW5nOyA8LSBhdG9taWM/DQo+Pj4+
ICAgIMKgI2VuZGlmDQo+Pj4+IHRoZW4gdnBjaV9yZW1vdmVfZGV2aWNlIGlzIGEgd3JpdGVyIChj
b2xkIHBhdGgpIGFuZCB2cGNpX3Byb2Nlc3NfcGVuZGluZyBhbmQNCj4+Pj4gdnBjaV9tbWlvX3ty
ZWFkfHdyaXRlfSBhcmUgcmVhZGVycyAoaG90IHBhdGgpLg0KPj4+IFJpZ2h0IC0geW91IG5lZWQg
c3VjaCBhIGxvY2sgZm9yIG90aGVyIHB1cnBvc2VzIGFueXdheSwgYXMgcGVyIHRoZQ0KPj4+IGRp
c2N1c3Npb24gd2l0aCBKdWxpZW4uDQo+PiBXaGF0IGFib3V0IGJvb2wgdnBjaV90ZXJtaW5hdGlu
Zz8gRG8geW91IHNlZSBpdCBhcyBhbiBhdG9taWMgdHlwZSBvciBqdXN0IGJvb2w/DQo+IEhhdmlu
ZyBzZWVuIG9ubHkgLi4uDQo+DQo+Pj4+IGRvX3BoeXNkZXZfb3AoUEhZU0RFVk9QX3BjaV9kZXZp
Y2VfcmVtb3ZlKSB3aWxsIG5lZWQgaHlwZXJjYWxsX2NyZWF0ZV9jb250aW51YXRpb24NCj4+Pj4g
dG8gYmUgaW1wbGVtZW50ZWQsIHNvIHdoZW4gcmUtc3RhcnQgcmVtb3ZhbCBpZiBuZWVkIGJlOg0K
Pj4+Pg0KPj4+PiB2cGNpX3JlbW92ZV9kZXZpY2UoKQ0KPj4+PiB7DQo+Pj4+ICAgIMKgIGQtPnZw
Y2lfdGVybWluYXRpbmcgPSB0cnVlOw0KPiAuLi4gdGhpcyB1c2Ugc28gZmFyLCBJIGNhbid0IHRl
bGwgeWV0LiBCdXQgYXQgYSBmaXJzdCBnbGFuY2UgYSBib29sZWFuDQo+IGxvb2tzIHRvIGJlIHdo
YXQgeW91IG5lZWQuDQo+DQo+Pj4+ICAgIMKgIHJlbW92ZSB2UENJIHJlZ2lzdGVyIGhhbmRsZXJz
IDwtIHRoaXMgd2lsbCBjdXQgb2ZmIFBDSV9DT01NQU5EIGVtdWxhdGlvbiBhbW9uZyBvdGhlcnMN
Cj4+Pj4gICAgwqAgaWYgKCAhd3JpdGVfdHJ5bG9jayhkLT52cGNpX3J3bG9jaykgKQ0KPj4+PiAg
ICDCoMKgwqAgcmV0dXJuIC1FUkVTVEFSVDsNCj4+Pj4gICAgwqAgeGZyZWUocGRldi0+dnBjaSk7
DQo+Pj4+ICAgIMKgIHBkZXYtPnZwY2kgPSBOVUxMOw0KPj4+PiB9DQo+Pj4+DQo+Pj4+IFRoZW4g
dGhpcyBkLT52cGNpX3J3bG9jayBiZWNvbWVzIGEgZGVkaWNhdGVkIHZwY2kgcGVyLWRvbWFpbiBs
b2NrIGZvcg0KPj4+PiBvdGhlciBvcGVyYXRpb25zIHdoaWNoIG1heSByZXF1aXJlIGl0LCBlLmcu
IHZpcnR1YWwgYnVzIHRvcG9sb2d5IGNhbg0KPj4+PiB1c2UgaXQgd2hlbiBhc3NpZ25pbmcgdlNC
REYgZXRjLg0KPj4+Pg0KPj4+PiA0LiB2cGNpX3JlbW92ZV9kZXZpY2UgbmVlZHMgdG8gYmUgcmVt
b3ZlZCBmcm9tIHZwY2lfcHJvY2Vzc19wZW5kaW5nDQo+Pj4+IGFuZCBkbyBub3RoaW5nIGZvciBE
b20wIGFuZCBjcmFzaCBEb21VIG90aGVyd2lzZToNCj4+PiBXaHkgaXMgdGhpcz8gSSdtIG5vdCBv
dXRyaWdodCBvcHBvc2VkLCBidXQgSSBkb24ndCBpbW1lZGlhdGVseSBzZWUgd2h5DQo+Pj4gdHJ5
aW5nIHRvIHJlbW92ZSB0aGUgcHJvYmxlbWF0aWMgZGV2aWNlIHdvdWxkbid0IGJlIGEgcmVhc29u
YWJsZSBjb3Vyc2UNCj4+PiBvZiBhY3Rpb24gYW55bW9yZS4gdnBjaV9yZW1vdmVfZGV2aWNlKCkg
bWF5IG5lZWQgdG8gYmVjb21lIG1vcmUgY2FyZWZ1bA0KPj4+IGFzIHRvIG5vdCBjcmFzaGluZywN
Cj4+IHZwY2lfcmVtb3ZlX2RldmljZSBkb2VzIG5vdCBjcmFzaCwgdnBjaV9wcm9jZXNzX3BlbmRp
bmcgZG9lcw0KPj4+ICAgIHRob3VnaC4NCj4+IEFzc3VtZSB3ZSBhcmUgaW4gYW4gZXJyb3Igc3Rh
dGUgaW4gdnBjaV9wcm9jZXNzX3BlbmRpbmcgKm9uIG9uZSBvZiB0aGUgdkNQVXMqDQo+PiBhbmQg
d2UgY2FsbCB2cGNpX3JlbW92ZV9kZXZpY2UuIHZwY2lfcmVtb3ZlX2RldmljZSB0cmllcyB0byBh
Y3F1aXJlIHRoZQ0KPj4gbG9jayBhbmQgaXQgY2FuJ3QganVzdCBiZWNhdXNlIHRoZXJlIGFyZSBz
b21lIG90aGVyIHZwY2kgY29kZSBpcyBydW5uaW5nIG9uIG90aGVyIHZDUFUuDQo+PiBUaGVuIHdo
YXQgZG8gd2UgZG8gaGVyZT8gV2UgYXJlIGluIFNvZnRJUlEgY29udGV4dCBub3cgYW5kIHdlIGNh
bid0IHNwaW4NCj4+IHRyeWluZyB0byBhY3F1aXJlIGQtPnZwY2lfcndsb2NrIGZvcmV2ZXIuIE5l
aXRoZXIgd2UgY2FuIGJsaW5kbHkgZnJlZSB2cGNpDQo+PiBzdHJ1Y3R1cmUgYmVjYXVzZSBpdCBp
cyBzZWVuIGJ5IGFsbCB2Q1BVcyBhbmQgbWF5IGNyYXNoIHRoZW0uDQo+Pg0KPj4gSWYgdnBjaV9y
ZW1vdmVfZGV2aWNlIGlzIGluIGh5cGVyY2FsbCBjb250ZXh0IGl0IGp1c3QgcmV0dXJucyAtRVJF
U1RBUlQgYW5kDQo+PiBoeXBlcmNhbGwgY29udGludWF0aW9uIGhlbHBzIGhlcmUuIEJ1dCBub3Qg
aW4gU29mdElSUSBjb250ZXh0Lg0KPiBNYXliZSB0aGVuIHlvdSB3YW50IHRvIGludm9rZSB0aGlz
IGNsZWFudXAgZnJvbSBSQ1UgY29udGV4dCAod2hldGhlcg0KPiB2cGNpX3JlbW92ZV9kZXZpY2Uo
KSBpdHNlbGYgb3IgYSBzdWl0YWJsZSBjbG9uZSB0aGVyZSBvZiBpcyBUQkQpPyAoSQ0KPiB3aWxs
IGFkbWl0IHRob3VnaCB0aGF0IEkgZGlkbid0IGNoZWNrIHdoZXRoZXIgdGhhdCB3b3VsZCBzYXRp
c2Z5IGFsbA0KPiBjb25zdHJhaW50cy4pDQo+DQo+IFRoZW4gYWdhaW4gaXQgYWxzbyBoYXNuJ3Qg
YmVjb21lIGNsZWFyIHRvIG1lIHdoeSB5b3UgdXNlIHdyaXRlX3RyeWxvY2soKQ0KPiB0aGVyZS4g
VGhlIGxvY2sgY29udGVudGlvbiB5b3UgZGVzY3JpYmUgZG9lc24ndCwgb24gdGhlIHN1cmZhY2Us
IGxvb2sNCj4gYW55IGRpZmZlcmVudCBmcm9tIHNpdHVhdGlvbnMgZWxzZXdoZXJlLg0KSSB1c2Ug
d3JpdGVfdHJ5bG9jayBpbiB2cGNpX3JlbW92ZV9kZXZpY2UgYmVjYXVzZSBpZiB3ZSBjYW4ndA0K
YWNxdWlyZSB0aGUgbG9jayB0aGVuIHdlIGRlZmVyIGRldmljZSByZW1vdmFsLiBUaGlzIHdvdWxk
IHdvcmsNCndlbGwgaWYgY2FsbGVkIGZyb20gYSBoeXBlcmNhbGwgd2hpY2ggd2lsbCBlbXBsb3kg
aHlwZXJjYWxsIGNvbnRpbnVhdGlvbi4NCkJ1dCBTb2Z0SVJRIGdldHRpbmcgLUVSRVNUQVJUIGlz
IHNvbWV0aGluZyB0aGF0IHdlIGNhbid0IHByb2JhYmx5DQpoYW5kbGUgYnkgcmVzdGFydGluZyBh
cyBoeXBlcmNhbGwgY2FuLCB0aHVzIEkgb25seSBzZWUgdGhhdCB2cGNpX3Byb2Nlc3NfcGVuZGlu
Zw0Kd2lsbCBuZWVkIHRvIHNwaW4gYW5kIHdhaXQgdW50aWwgdnBjaV9yZW1vdmVfZGV2aWNlIHN1
Y2NlZWRzLg0KPg0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

