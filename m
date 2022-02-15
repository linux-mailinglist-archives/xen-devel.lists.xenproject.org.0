Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C9E4B6CCC
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 13:57:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273142.468219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJxOD-0008U6-26; Tue, 15 Feb 2022 12:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273142.468219; Tue, 15 Feb 2022 12:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJxOC-0008QL-UD; Tue, 15 Feb 2022 12:57:04 +0000
Received: by outflank-mailman (input) for mailman id 273142;
 Tue, 15 Feb 2022 12:57:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xOiq=S6=epam.com=prvs=4045782cdb=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nJxOB-0008Ms-Cw
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 12:57:03 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c44441c2-8e5e-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 13:57:02 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21FCpm6v002326;
 Tue, 15 Feb 2022 12:56:58 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e8apa8hu0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 12:56:57 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM6PR03MB5235.eurprd03.prod.outlook.com (2603:10a6:20b:c6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Tue, 15 Feb
 2022 12:56:54 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 12:56:54 +0000
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
X-Inumbo-ID: c44441c2-8e5e-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIMy1RqA0bpPgbKnVaCXOW9Qc5EoqaatsCm4E6ZheZ5x6eKu/gRvawY9r/fEhnxwrbiNylCcCJtMdLQWb0ndvWwY168amord4eOw15CjkePqniyNrifadYwvXXj4OGV4J3/fl9FkDlnn33cQBa+wZUeGq2kSjaUpokxzPyjMGOuhPNRbVc3JvAVo/Yx4nyFFbGSenv+QAxb1daot9t17dXGW5S1L3cRxUw2FaR0g4QU7ilV13dK5YB+bFtoV73fR6G1d/m5nPy8te7Bmgntn/FP4oILl+2sldV5BoJFPU0vlq3N6BC6kUTsNnauPtii8IQb24bZI8n8TX7zJJF5NOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qU4sQkyqUjQnwqBOMm9sNau7Cji4hxy1oJP7CcMdoE=;
 b=i8/nGRTsRRY8q6LONUPOvTvXuFJ3HwQmaBRJfwOkOQTDtxxDp49Xf5dq7ReW3iiMDe81ti2bbtQcAQ5QZ8eoRu+5N18ehhYUQjBdQSQVfYxGlFx+loTsk5ZccTbQ2Q7UuGgXbh3KO90cU7XbC2q9zFFSacQ8eEBWEKsxI06cdpJbTl5Awbm5qifvs/xYcwA4FJPRtfrzP99IUqGYl8sP/WCobzSdokTs0+4TGvxrSUCL9NgonUjE3Suj2QqfH1CsxL1CLBVx/Ltk0LSqFFmBm56RU2U9JFI5c4poQ8a4sXer6UlghDT5Pqrv4jmEJFr6/MHNVqpsVNa2RW08WB/FxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qU4sQkyqUjQnwqBOMm9sNau7Cji4hxy1oJP7CcMdoE=;
 b=RIZb+KFlAx5MGAaHhdtmso+wC5aMudr5aMWoiKVuQ28HUn5dya6DoodKxlSZQx32CpGDc9RWUgWyyxf2IMwf+q2l3DuX9m7fG0HViShdonOOIOwzW4hZtpcPqxbfPdYI/I4FEPXf+3Gm7Wsbi7GV18c2+KEf1pQZtCTp9TTrcN4qpkJpKeqsCNT0H6O7rzo9cek13/e4XUJwP7f3cUUoHZCT0N1nqDUD2tz/T9YCfkebCpUOm5GJR+nEzg3zNx0wHbdVPBuLT5PdPVDkLH+JS/0CPVSWk+BhokIegp822pcsnaf8vhmpOPShpmzQtJRlNgA0M9nOVoHLwCtKnVtWKA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
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
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Topic: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: 
 AQHYIkOs9pmsZb0l5kefj1m3qdTVCayUboeAgAAGwYCAAAeVgIAAAZQAgAABlwCAAAEVAIAAD0CAgAACHAA=
Date: Tue, 15 Feb 2022 12:56:54 +0000
Message-ID: <9f4e7308-6ede-302d-35c1-6fa824df69bd@epam.com>
References: <20220215081135.1497470-1-andr2000@gmail.com>
 <YguE7RWOteSnvVNY@Air-de-Roger>
 <c5b9b02c-93f8-d018-6048-9abf2e7de4dc@epam.com>
 <YguQ8wfhfYFXTWSU@Air-de-Roger>
 <70dbd7fd-3f74-d0d3-6e30-c1e1e24fc279@epam.com>
 <0d8f01b2-b015-a08e-dd49-e9c688ff7245@suse.com>
 <bbb36ebc-de66-297d-f82f-abc0e63f20a2@epam.com>
 <34832b7b-c1c0-06e9-9214-6c434cfb1282@suse.com>
In-Reply-To: <34832b7b-c1c0-06e9-9214-6c434cfb1282@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41022b7c-a9d2-4672-9d00-08d9f082a474
x-ms-traffictypediagnostic: AM6PR03MB5235:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB523500BAEFF602AB76559689E7349@AM6PR03MB5235.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yPMs7YN1W1uVIM7wyjSYAn12RZ2JoPdnaCQo49ygtAGd4V2AppC/E2v+NpuyayXgpmf6Vrj7Qvwm2XkyX7+v+nt43qWIrDCZn5cfZJk2+80sxHpZTScLEuWOyel3R7D1ZUXG3brJLGpvlVsWAX3S5NlVAqF7b6J7nGLQEUkQBdlOhOqws3eQn9ULtn0Bi0nXSydLi7yZ/qUizKytyBHyAiEBTd1INkl9/TBmTd5rrP8y1AYu+OU1Of1QkC8dqzvcDlXRxSBToYgHsHSs2DxyW4AuCf2lyvceN3G0QErEb5q64kdvSciAyKJeRb4Tev21xahMB7IMmb4evTvy9XqGuG7W3C2eG0CfaYJW41MR1pGhsP/yBCVPOKRk/Xhm8TH2M2yP3wFA8540SiROaaOUPosSNaLIGEs2gfhrkHRxz0t4YJqGsYvT8zDwODZ2cE4uYivL9iZXtrmkPg6YN/rwhGCZBMTuasaX6MUkGYh0Bgtmgivkyv4OHP9FnUtRi9x6bYjSButeJW4u8oUgsse5W97Ejn0WutaDHNdqjf69swGToBwSFXiPmvqhSp/CbnLnLYCgkoyFEGScasIP/njBSoXrRhID3BkXXJkkHtojXOQowW0cOwhxoWvFahwNWc+rimxIMzqh+MSrUfl346LvH+RXqofmlDi9xfBGsqlJTpK44plowhiS7LnJQThJfCZptbhIp263MNVg827d+BIaKTs40FDoLfevKBIBA1VGjJE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(107886003)(26005)(186003)(31686004)(6512007)(2906002)(5660300002)(4744005)(8936002)(55236004)(53546011)(71200400001)(83380400001)(6486002)(36756003)(508600001)(6506007)(31696002)(66476007)(122000001)(38100700002)(76116006)(86362001)(38070700005)(54906003)(91956017)(4326008)(6916009)(64756008)(8676002)(66446008)(66946007)(316002)(66556008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MDlhR3BHd2tlcURjeTdtZG11TmJKUVRxRkdwZHc5RkFpZWZqNXA2OVhZNklN?=
 =?utf-8?B?ZWJBWUNibmh1anFSUVh0dlovYzVQcWJNS05xQ3RoRGRGUVE2MkJIZXp6Zmdw?=
 =?utf-8?B?dUVUcktPM0NtMTZ4YkN1OTVtRUNCK0VUZUZBNjFwSDJob0dzV0MyV2hKL25w?=
 =?utf-8?B?L0ltaDNMZkxuNEhKNWYzMGhOcWZOVVIwYUlqTFNCcTdtR3BzdEFiY1BpWkYw?=
 =?utf-8?B?VEhRdkdnU09jbmpBQXgvcHZ6WVN3YVU4R01vT0V5K3lVdkNGSjhyc2lSNGlC?=
 =?utf-8?B?SVAzcmdjYWhIMitXb3pPZEtPQmhreXpjc0Q4cDVMVmFhbnpmaUZZWm1jbStz?=
 =?utf-8?B?OWhMM2txUGt4cXJLVXY3OTFTTEsxdmp1Y3NSdWUvd0FPMFRmZVBxcTd1WHFu?=
 =?utf-8?B?TmdKZmhGaEZDOXE5M3dGWGNxRURUakIzY0xreE1XUmhIdSt0OGl5eHMzUHVj?=
 =?utf-8?B?eWtjdDA4Q2s1SURpeU5qaTBPeExxZ0cwY01KdjlGYzU4aUdlWUtDSE51d1JQ?=
 =?utf-8?B?NnFVaks4ZkRCU29BWjlMN3RCRkNDc05td2lvTU81czd1Sm4wRlI0K1ZPamNO?=
 =?utf-8?B?UFlMdDVnTU9MLzByd0hYNytRNmxEMjB2b1luMng5TVZYb1NMaGhkOU92UG84?=
 =?utf-8?B?MmgyYXlqdGIyOTJVNkRuekRjM0ltQTllMi9GQ0pvcXhaMDdLaC9QcDlaMThP?=
 =?utf-8?B?YnZ3Vk9rWjlLdjJxQ1lFRzJKWW0weTFreWZPc0lkck9mckI0K3pmZkZYNkdj?=
 =?utf-8?B?ZEdzRWZMeHEyWnlLODNXSU5tUkhlL25IeEJ4SjdyWG5JV0V5aVV1M21GK05K?=
 =?utf-8?B?TzJDN21VQmxZUDMzSEFVUm1WeVFJUmc4V2JvOU9DRWRKTk9OZ3U4bkFYdDNk?=
 =?utf-8?B?MFN1V1lKbDMvdmFDRVpSTlFIaUgwczhJd2kvOEhHK0NNSDRKUEN3QVR5QW12?=
 =?utf-8?B?VTR1d0MxMUdCVnVDNUIwZmtCMUVyNmtnaTZxdFFsR2pYOTdrS09iVlc2VmRw?=
 =?utf-8?B?bGpqdVRmSFlBSi9TOW5nRU9xNWdyZEVqeUNWdG9sWUlxTnd3ZWwxdGI4Y3Nv?=
 =?utf-8?B?eUpXdEJpK2ZXczlteTBKYUdMcnV6T2MyYldMTVRpWnUraGdRZ3BPOFNVem41?=
 =?utf-8?B?eFJGdTBhNDZEZzcrcmZySlNNTjBqNXBnWWZSMVhpVnI1aDR4MFlpYmprc0V0?=
 =?utf-8?B?RFRjenNFSndWRTNndEg0bFgvWEViNjdlV2RleGRCOHlISEl4emJBa1hyRGNj?=
 =?utf-8?B?cU5MRHE2OFpWeEJVYVBEcDkxcWJwNFdFc2hNNzVScVMwanJwTExIUG1CT01Z?=
 =?utf-8?B?ZTYrNXFrUU9LblA2ODVJZ0kySmFVYjVnSnZXQzVZWjNKazZaYzhqRjg0eGNz?=
 =?utf-8?B?dnJyYkd1OGNMUndLb0dDWDd5VkNLbnhMekcvSXFOYjUvUHdWWWIyOVQ3Qy8y?=
 =?utf-8?B?UWNSVzlUSWxSRHRidXVraUZCNGpQcEh3cmlzYXlvMTRIQzQ4bCtwTmIxRndr?=
 =?utf-8?B?V0ZwdGxablpRd0srRkZPdHJ5TzNlMitKQjBhNU9QalFUeEthT0xzS3NQSmhp?=
 =?utf-8?B?YkptQjcvc2xxTlpYQ2pLT3F6MEtabzU3ZWxaTnR2TVd1VEpDRFViZnJFY1pF?=
 =?utf-8?B?VmpVcGsxOElUUWpZVmdtbDd6OG05UkpoRVVUZHViekZpdFZxalpCQUpLWi9U?=
 =?utf-8?B?L21aUjcrNTJHY3RhbEJzSTh2YnZJMVJETVFza204OGFpQXZHV1pvUTZJNTM3?=
 =?utf-8?B?cXc3WmdNRFZoaGxKK24xNVJ6SElYT3JLYnhYQUFmRTcyYVBQM3pPZDUrS2ZM?=
 =?utf-8?B?WGxYTUlvcEw3eWVRT3FlZGxOaTFQUjhCd0JIOVgzVXdEeldWUHEveW9rUXZG?=
 =?utf-8?B?OXJrcWk2WjhjYk84Y0YrTXhGcFhUbFdlakE3cENCL2xWaEhNOGRlV1lqbTJv?=
 =?utf-8?B?Y29odWlYNE1iQ0oxRWJCYnJoSlhvaEo5bjRtZGhZalFIL1o2b1BXcHlSdk8y?=
 =?utf-8?B?Z3ZtNEEvVUcyVHdEdFM3ZEJBdEUvNUxmZmpEa0pud2h5QUhSaFNvVkdNVFA1?=
 =?utf-8?B?Mk9kNXNOajc3cFRTVktNTDlZNnUwUEdLZWZXcDBYeDJWa1QyeVRKUlByWEN4?=
 =?utf-8?B?RlJ6S2dGSHdqRjVLSGpjY1oxT1Y3T1ZNR2xxV3BjdFBKWW0weEVjZTRva1BV?=
 =?utf-8?B?WGZVdVdibE1FZGpPNjF1NFRUTXQvMWNkaDBtNUhhU3NQNm9ZMnF0MUFTaGFH?=
 =?utf-8?B?VzQ1K3JaSnNHOVNnWEd5MENvRTRHQTV1dFpld1QrTEFhSUo2K0pML0lLaUpL?=
 =?utf-8?B?NGNmWFpxdDk3ZFFraXlDcEw5Qm9mSnpOK0hXTHdtc01DcUczTm5zNVBxcWNS?=
 =?utf-8?Q?B+KrN5Lv5iHlaYHQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1FC0F05EBF73554C92FFF94E178D637E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41022b7c-a9d2-4672-9d00-08d9f082a474
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 12:56:54.3594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NKwSessZyWwPVDcnZn8IOjHxjXAyeHJa2/JwAAln8Yo0gVq8IUoXxbuYTYodZYcASuk/v5PDgHqs31EFUrZ3cNPR513qIGreitQxYb78a8jbWoGGRkDg+jEJ8TrQP+zt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5235
X-Proofpoint-ORIG-GUID: wShCf-yNj8J6zw3LKHFe3A0YasgsAOlq
X-Proofpoint-GUID: wShCf-yNj8J6zw3LKHFe3A0YasgsAOlq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202150074

DQoNCk9uIDE1LjAyLjIyIDE0OjQ5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTUuMDIuMjAy
MiAxMjo1NCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxNS4wMi4yMiAx
Mzo1MCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTUuMDIuMjAyMiAxMjo0NSwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IEknbSBvbiB5b3VyIHNpZGUsIEkganVzdCB3
YW50IHRvIGhlYXIgdGhhdCB3ZSBhbGwgYWdyZWUgcGNpZGV2cw0KPj4+PiBuZWVkcyB0byBiZSBj
b252ZXJ0ZWQgaW50byByd2xvY2sgYWNjb3JkaW5nIHdpdGggdGhlIHBsYW4geW91DQo+Pj4+IHN1
Z2dlc3RlZCBhbmQgYXQgbGVhc3Qgbm93IGl0IHNlZW1zIHRvIGJlIGFuIGFjY2VwdGFibGUgc29s
dXRpb24uDQo+Pj4gSSdkIGxpa2UgdG8gZXhwcmVzcyB3b3JyaWVzIHRob3VnaCBhYm91dCB0aGUg
Y29udmVyc2lvbiBvZiB0aGlzDQo+Pj4gcmVjdXJzaXZlIGxvY2sgaW50byBhbiByL3cgb25lLg0K
Pj4gQ291bGQgeW91IHBsZWFzZSBlbGFib3JhdGUgbW9yZSBvbiB0aGlzPw0KPiBOb3Qgc3VyZSB3
aGF0IHRvIHNheSBiZXlvbmQgdGhlIG9idmlvdXM6DQpJIHRob3VnaHQgeW91IGhhdmUgc29tZXRo
aW5nIHNwZWNpZmljIGluIHlvdXIgbWluZCB0aGF0IHdvcnJpZXMNCnlvdSBhbmQgeW91IGNhbiB0
ZWxsIHdoYXQgaXQgaXMuIFRodXMgdGhlIHF1c3Rpb24NCj4gICBBdCB0aGUgdGltZSBvZiB0aGUg
Y29udmVyc2lvbiwNCj4gdGhlcmUgY2VydGFpbmx5IHdhcyBhbiBpc3N1ZSB0byBiZSBzb2x2ZWQu
IFlvdSdkIG5lZWQgdG8gc29sdmUgdGhpcw0KPiBpc3N1ZSBkaWZmZXJlbnRseSB0aGVuLiBQbHVz
IHlvdSdkIG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgbm8gZnVydGhlcg0KPiBpbmNhcm5hdGlvbnMg
b2YgdGhlIG9yaWdpbmFsIGlzc3VlIGhhZCBiZWVuIHRoZXJlIG9yIGhhdmUgYmVlbiBhZGRlZCBp
bg0KPiB0aGUgbWVhbnRpbWUuDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

