Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5418E6ED01E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 16:16:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525430.816618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqwyr-0008Jy-MR; Mon, 24 Apr 2023 14:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525430.816618; Mon, 24 Apr 2023 14:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqwyr-0008IH-Iw; Mon, 24 Apr 2023 14:15:49 +0000
Received: by outflank-mailman (input) for mailman id 525430;
 Mon, 24 Apr 2023 14:15:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPGB=AP=epam.com=prvs=84781ceaa2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pqwyq-0008IB-2U
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 14:15:48 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80cd1a4d-e2aa-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 16:15:46 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33OCJOL4030609; Mon, 24 Apr 2023 14:15:33 GMT
Received: from eur03-am7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2241.outbound.protection.outlook.com [104.47.51.241])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3q5sp18hcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 14:15:33 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB6790.eurprd03.prod.outlook.com (2603:10a6:20b:295::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.54; Mon, 24 Apr
 2023 14:15:28 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9b45:4d32:a743:d5e3]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9b45:4d32:a743:d5e3%3]) with mapi id 15.20.6298.045; Mon, 24 Apr 2023
 14:15:28 +0000
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
X-Inumbo-ID: 80cd1a4d-e2aa-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kya0Lf8UgkTl7eggJ80mcaQwnFyTlpqFk9HK9cigxJGuf2FPII6ZDEkYAqQRJ12LWYkBHTehE3qSMnBEQ0nMkDSU8qBHcHQFIAlBDAvDSgFJ7GkEt9jbVSp1ucvJVwpRImaa9G1gtiCayS3RrbKY9vC5sMiPDwe3f3N054N6J5ZHWLqQajTNHSDZzJ1iFhIEfDq8wsMRUbqMGLPlHKus2+KCIEai/gUW/5sltpZPuYZObKvzyLrWgcm7pZ7Dx1XYn+1S/lOvlfW5UWO5I0aEa9IXsTc0qg2OszIC0hZraBs9IRcHzRuY1qftsa0KbdrafuZcVO/jEqBH0G0q7et2XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bopo97wd/BIYYnVeTcenWCOubx9SKDmqoQghR5ldbdk=;
 b=LYNOarAtzLjMX8mHjKz/K4sGn5Aa17x3rQzGKuzRi98rzspMhc6R3fsmUzXU3KRxovQaJs2djIyvxcRHCJfbR+sHIA6GhFdR94BkYtid2PreARlUg4QaVTA/fFVOJJR7SWoctX88XONdDjaEQxaxnrnPNEukqEnjt0Vw/0q8i2CkYyMc0h15kNCnbRmqezVtQl52M64bpA6Kk29JHzodWH4NJzKJu+VSy4Zty6lmFy5HTHLh1Mpd9Lp1l20/gD5q7jLRLeAI5+XHXxHRr68JazT3ZeKWnJKhAjdjW2GoOwakr8cS6kXAkw7FlnEWi8ffo1IyK2sHen6VcOVfkJQuqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bopo97wd/BIYYnVeTcenWCOubx9SKDmqoQghR5ldbdk=;
 b=TCx62TyzkNv0NTkeekev3q/FNpvS3n/9fCHh3QI/zM7EObeVaTHVH+KUNf/hufK9I7CTXbzYleFNuhGb/dKIKIe49qa5Hzu7GbKTvh4wk0awKoRDUB76lGAiuSeGEHOdncb0QSWszQM/jnBtxIXsVv2sRvBU+/p8GFvqLMWwlLg5cw757cyB6zXU4deYVdeBEFSxf5h/6xFDrpabvd8Yf5E7BgK1YQiomb0UZkCjX2C0dmXbESwt6oONHJGA9Ixb6l/OKDGZv4fw1stj7RHr9rD6Wk06q9CdmOELzDwA+St/NjZtBxWLo4HUwuQ2v7mlwpNEktUxGHwryDPOmZyJpw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Paul Durrant <paul@xen.org>, Kevin Tian
	<kevin.tian@intel.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Thread-Topic: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Thread-Index: 
 AQHZVrdzsdckomMx4kauxHkZQ597Iq79mAMAgClI2ACAAK/igIAAVGGAgAGe14CAAJvOAIAFXoKAgAAEr4CAAAS6AIAGQ32AgAAsn4CAAAL9gIAEWYgAgABm+AA=
Date: Mon, 24 Apr 2023 14:15:27 +0000
Message-ID: <87h6t574e9.fsf@epam.com>
References: <ZBNA9q5DXJYG3KVp@Air-de-Roger> <873556xa0g.fsf@epam.com>
 <ZDZ2S4OxP2e12oSX@Air-de-Roger> <87v8i0wyv0.fsf@epam.com>
 <ZDgZEZIG89oW6rEw@Air-de-Roger> <87leivw8qp.fsf@epam.com>
 <ZD0cyXLt1knXyUzA@Air-de-Roger>
 <963624f1-a36a-5d48-c34f-552d9d6c4950@suse.com>
 <ZD0krtCOrEwiKMFP@Air-de-Roger> <87354t8pqg.fsf@epam.com>
 <ZEKLN8AlzDUckorU@Air-de-Roger> <87o7nh727c.fsf@epam.com>
 <bb71c3f3-20a7-b020-6685-879bd4e5786d@suse.com>
In-Reply-To: <bb71c3f3-20a7-b020-6685-879bd4e5786d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB6790:EE_
x-ms-office365-filtering-correlation-id: 888fb90e-94b2-4311-020c-08db44ce5abf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dcbnCLVKQkdmUt+BTWoREEouabY/LFlkeiZTnr6S/53DtIJXNmIh7BoCEM7+VcS1S5px2823iXpbEAQBK4yKVcA/KSwF4peRJeIeNOsuG5xO4w3t/5j41ZEvInxOaZAPieI2z85GK6RwgbiXXg30I/9kuhmg67J+NJ1fDB4Q8XGzSJsmghfEZH8VmTrnQt3X2EYcL10YhXhfCVV5Aym+QT8xBYL3Nidx18K2W//xJo5VPB5X239kF9cNf7IPuoxG/OSsWtzTvy9z5/oXpsBx0kS9GRzswdyGOo8sQaJPNS304VG/77XUDJGyrArPLw31BQJiOZ8CSRo72P20ZydEY1qUM4wJhGiAbJpNT9jlYKcIk0n2k14o/EtDrj5PtvqUq8v1VTZ9mWyE5w3lOu7Ii/WPl19IB9tf057a0aIj4p6/rcVjb9G2ZR22GL6fYeNT8+60Tl5PzyBJdvdXlZmbONyKcOI1ykOnug0NipZXPTIXPuOJ70I3glVrmukkmgWP4iL6/e+s24c/cdbJ/KlBRmj1byW99bZ4/RuGQrDfYJzgygeO2jEcqxPWKji+y5zNg4yzK8zWS14OreSh311cQ8OurM4JrYt+wjkbVXigXmV5+gtFgXfDHHlAOqHrF/o+
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199021)(38070700005)(2616005)(2906002)(5660300002)(26005)(55236004)(6506007)(53546011)(6512007)(122000001)(41300700001)(83380400001)(8936002)(8676002)(7416002)(38100700002)(66899021)(316002)(66446008)(66476007)(64756008)(66556008)(66946007)(4326008)(76116006)(6916009)(186003)(36756003)(54906003)(86362001)(91956017)(478600001)(6486002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eUozT0VWcU9oVk5QdWJKdE9wcG9obDI2TWJpMU1xVzBaLzB1eVd0dTJKRHRk?=
 =?utf-8?B?YnRjeFozSE9LZ2NuZFJ5SGRlQ1R1bXlPdE1xdHVSbGRFQnQrZGc4YkpidjZr?=
 =?utf-8?B?UVVKU0MxSll6WG9NZktHK1B0SjBzZFlNV2JBRFdRc1hBUThrb1dBc2M2bTli?=
 =?utf-8?B?b1dxbmNvLzNGVnp3UDI3dDZUb0d1N3ZJZkVVdzJmY3JKOG1aQTZYTWtRUm5H?=
 =?utf-8?B?T0tSRnlNUlkrOG9wdjVIT0tyeHRCa0M2Ni84Mi9najRnc0J5eGVRSkJ1ZnNr?=
 =?utf-8?B?c2xHOTVSV0l0bjNWcVh6eUx1aTM0WThYOUxCdEJ3T3U1OFpTQWI1b1lHNWxP?=
 =?utf-8?B?RTVFRXZxblZsbVQrZ1dGQVhId0VYdDlJY01rMWdnM1Uzd3FsRXlpdUFSSFVN?=
 =?utf-8?B?RVZqSEdtSFBmRHdzSkowTzZQV0tlaVl6b1hlZEE2dzZVWWNqRWk1aFFMU1U1?=
 =?utf-8?B?cGZqQkNQVGozSzdQR0ZpdHZ5RkpjaGtFUXNaTHM4YnVVUjZXMVMxQ1hLTGNB?=
 =?utf-8?B?Tll4TTNuNGlMZWI2Uy94VDVKbUNFdUFFSzhzc0RpaTBpTU5HVy9CekE3bGU3?=
 =?utf-8?B?QmtsRTNrKzhRdHJiT20xaWZLTGdKWXBBMEZNU2RqYVBYWTU0ck4xbjVFbVpz?=
 =?utf-8?B?cmlBTVlJL25GZkdKZDlnWFpvZWJ3NmJSS1U3NG5VN1lOdUxiVHZDeTVRRWRD?=
 =?utf-8?B?K0xQdEZVN1RUUHNsV2JiTkVxSjYrM3l1bUEwWkV4eUdEQ05yN0phdElVOXVR?=
 =?utf-8?B?N3ZxamNtTzN2MHVaOTZ5ekhIbVdxSFpaemFnaStncEhKd1R3K1BmTjZOVVEv?=
 =?utf-8?B?ZWlpS3ViNFRMUFhadXVtbTFFYmZKYzFGcTJlcXZKNGk4dXk5SUV1dXdBbzZN?=
 =?utf-8?B?ckZHSGp3UkprQkw1RVAzN0VPVWpwZVE5bXAzcnJYd1RvNEdaTDVRTnBPVXBZ?=
 =?utf-8?B?Qis0RTFaY2RrTEVuMFprdjNtSm9hQ1JBR2F2T25IQmd1elJ5SDNYZjQ3K1Mz?=
 =?utf-8?B?RVNpRmpySkhRT0FzbUpuSVBKV1Mwajh0VHFvRnNhckkzaXdVdnpVVlNJQXRo?=
 =?utf-8?B?YzNKWTkxZ09Uekp3RjJ2Qmw4R3UzSkY2TmVEbE1EVHFjd05DTng2UHRHRVR4?=
 =?utf-8?B?QTJMRVlJcmgwNStacGNOQjBpRElVVnAzdjkxS0NQZnJ4UkNMUE9nV1RIR0N5?=
 =?utf-8?B?UURqT3dpdW9INVNweXRjYlF0VzV4TWpaZEhjbWhDOGJ6WWkrS3g3UDhiUmxt?=
 =?utf-8?B?ZWlUc2lKWVRvTmhvT0tKZDZEUi9nb1hlWVRkZ3R5cElUZHZ6WER3QzNObFht?=
 =?utf-8?B?STJ0K3U1WFZHejZhajJnaUpGbXRDRlJ6NFhIOTlkdzFnLy9QVnRMNElzVlBl?=
 =?utf-8?B?T2tHZnZXcnRhTVJZQVFTN2dOR2tjY0pHZWF3NmlVZkdsbWFuQ0Q5KzdtbWt2?=
 =?utf-8?B?NGE2OUpHb3lLUHlZVWF2a0pmdTRPV2txRHFMNUQyQmR2TE5LSjNFRU1SWnVy?=
 =?utf-8?B?MllVL1h3azh6QUNqZG5QZVI5cVh1SURseVNWU3ZBbTBNNVY4UUwyQ0Y3RE9Q?=
 =?utf-8?B?UXE3K1k1K2lVa0ZmK2VjVWp5cVh2RHhRMDVHd2hnQk5hM29FdUpmNENucVlH?=
 =?utf-8?B?Tk5tTHZHcm5sUGQyRnZYM3ArWkI0QzVIRDQxNENtWFRpMFFTYjk4YUFKazNO?=
 =?utf-8?B?QTdRQkl4UGlKL3dNd3hiMnJ6ak4wU2NZODBUQ0l6S1Z0aDA1RU84RHdYNVJk?=
 =?utf-8?B?a2JOUjZJWGt3SllBZUtPS0pzTXFydjl6MFIzbWZvbDZJUG1kME9ES0Zadks1?=
 =?utf-8?B?RnZlb1ZNVUZoQitWcXFuZ3pJMUFoZW5lTEtKcXNma3B6SXpoblpoclQ3Wnl0?=
 =?utf-8?B?UmhpemJyYkhDaUU1VjJWU2FXcVBsWE9mdmEwTkNWVUl3V01sOEdDNUFDR1Bx?=
 =?utf-8?B?SXYzZEIra0psMEJQUUZpZmRiM1FUenpFV3pvT2NRbHRLMHhrdms5VUh5ejYv?=
 =?utf-8?B?cTBFTTk2WTJFRXBsRTB6dngzbzcybGh4QWNocWtlR0srelZIM3dXZHNiMVE4?=
 =?utf-8?B?eExQQTcrU3A1WEg5WWxDZm9jaWxwZS9iZmNNaWRsWDN2eXdDdy9FY25wWjRx?=
 =?utf-8?B?Z1lXREMxeXNIS25SUjdhNWRHRXN3MzhuOHorWjFxdVFYKytpb2dXdEc2OXVr?=
 =?utf-8?B?UUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD6D32B3D8FF9C499F7D85CE4F1C6B5E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 888fb90e-94b2-4311-020c-08db44ce5abf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 14:15:27.9065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tj/gHxEK3ny3LcGTpetyCHmiDTdJAJ3K13GLa+4f1Bd3BQaTlY2r8ka/POs2/eOgHzX+lccuNs1DbfglV0iM/hfEFYIzA0uz3vtCyDqPGGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6790
X-Proofpoint-GUID: hE1raLViRgYM09NPYzPKOD0ujMZcs_wu
X-Proofpoint-ORIG-GUID: hE1raLViRgYM09NPYzPKOD0ujMZcs_wu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_09,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304240128

DQpIaSBKYW4sDQoNCkphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JpdGVzOg0KDQo+
IE9uIDIxLjA0LjIwMjMgMTY6MTMsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0KPj4gDQo+PiBI
aSBSb2dlciwNCj4+IA0KPj4gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
IHdyaXRlczoNCj4+IA0KPj4+IE9uIEZyaSwgQXByIDIxLCAyMDIzIGF0IDExOjAwOjIzQU0gKzAw
MDAsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0KPj4+Pg0KPj4+PiBIZWxsbyBSb2dlciwNCj4+
Pj4NCj4+Pj4gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyaXRlczoN
Cj4+Pj4NCj4+Pj4+IE9uIE1vbiwgQXByIDE3LCAyMDIzIGF0IDEyOjM0OjMxUE0gKzAyMDAsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+IE9uIDE3LjA0LjIwMjMgMTI6MTcsIFJvZ2VyIFBhdSBN
b25uw6kgd3JvdGU6DQo+Pj4+Pj4+IE9uIEZyaSwgQXByIDE0LCAyMDIzIGF0IDAxOjMwOjM5QU0g
KzAwMDAsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0KPj4+Pj4+Pj4gQWJvdmUgSSBoYXZlIHBy
b3Bvc2VkIGFub3RoZXIgdmlldyBvbiB0aGlzLiBJIGhvcGUsIGl0IHdpbGwgd29yayBmb3INCj4+
Pj4+Pj4+IHlvdS4gSnVzdCB0byByZWl0ZXJhdGUsIGlkZWEgaXMgdG8gYWxsb3cgImhhcm1sZXNz
IiByZWZjb3VudHMgdG8gYmUgbGVmdA0KPj4+Pj4+Pj4gYWZ0ZXIgcmV0dXJuaW5nIGZyb20gcGNp
X3JlbW92ZV9kZXZpY2UoKS4gQnkgImhhcm1sZXNzIiBJIG1lYW4gdGhhdA0KPj4+Pj4+Pj4gb3du
ZXJzIG9mIHRob3NlIHJlZmNvdW50cyB3aWxsIG5vdCB0cnkgdG8gYWNjZXNzIHRoZSBwaHlzaWNh
bCBQQ0kNCj4+Pj4+Pj4+IGRldmljZSBpZiBwY2lfcmVtb3ZlX2RldmljZSgpIGlzIGFscmVhZHkg
ZmluaXNoZWQuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEknbSBub3Qgc3RyaWN0bHkgYSBtYWludGFpbmVy
IG9mIHRoaXMgcGllY2UgY29kZSwgYWxiZWl0IEkgaGF2ZSBhbg0KPj4+Pj4+PiBvcGluaW9uLiAg
SSB3aWxsIGxpa2UgdG8gYWxzbyBoZWFyIEphbnMgb3Bpbmlvbiwgc2luY2UgaGUgaXMgdGhlDQo+
Pj4+Pj4+IG1haW50YWluZXIuDQo+Pj4+Pj4NCj4+Pj4+PiBJJ20gYWZyYWlkIEkgY2FuJ3QgcmVh
bGx5IGFwcHJlY2lhdGUgdGhlIHRlcm0gImhhcm1sZXNzIHJlZmNvdW50cyIuIFdob2V2ZXINCj4+
Pj4+PiBob2xkcyBhIHJlZiBpcyBlbnRpdGxlZCB0byBhY2Nlc3MgdGhlIGRldmljZS4gQXMgc3Rh
dGVkIGJlZm9yZSwgSSBzZWUgb25seQ0KPj4+Pj4+IHR3byB3YXlzIG9mIGdldHRpbmcgdGhpbmdz
IGNvbnNpc3RlbnQ6IEVpdGhlciBwY2lfcmVtb3ZlX2RldmljZSgpIGlzDQo+Pj4+Pj4gaW52b2tl
ZCB1cG9uIGRyb3BwaW5nIG9mIHRoZSBsYXN0IHJlZiwNCj4+Pj4+DQo+Pj4+PiBXaXRoIHRoaXMg
YXBwcm9hY2gsIHdoYXQgd291bGQgYmUgdGhlIGltcGxlbWVudGF0aW9uIG9mDQo+Pj4+PiBQSFlT
REVWT1BfbWFuYWdlX3BjaV9yZW1vdmU/ICBXb3VsZCBpdCBqdXN0IGNoZWNrIHdoZXRoZXIgdGhl
IHBkZXYNCj4+Pj4+IGV4aXN0IGFuZCBlaXRoZXIgcmV0dXJuIDAgb3IgLUVCVVNZPw0KPj4+Pj4N
Cj4+Pj4NCj4+Pj4gT2theSwgSSBhbSBwcmVwYXJpbmcgcGF0Y2hlcyB3aXRoIHRoZSBiZWhhdmlv
ciB5b3UgcHJvcG9zZWQuIFRvIHRlc3QgaXQsDQo+Pj4+IEkgYXJ0aWZpY2lhbGx5IHNldCByZWZj
b3VudCB0byAyIGFuZCBpbmRlZWQgUEhZU0RFVk9QX21hbmFnZV9wY2lfcmVtb3ZlDQo+Pj4+IHJl
dHVybmVkIC1FQlVTWSwgd2hpY2ggcHJvcGFnYXRlZCB0byB0aGUgbGludXggZHJpdmVyLiBQcm9i
bGVtIGlzIHRoYXQNCj4+Pj4gTGludXggZHJpdmVyIGNhbid0IGRvIGFueXRoaW5nIHdpdGggdGhp
cy4gSXQganVzdCBkaXNwbGF5ZWQgYW4gZXJyb3INCj4+Pj4gbWVzc2FnZSBhbmQgcmVtb3ZlZCBk
ZXZpY2UgYW55d2F5cy4gVGhpcyBpcyBiZWNhdXNlIExpbnV4IHNlbmRzDQo+Pj4+IFBIWVNERVZP
UF9tYW5hZ2VfcGNpX3JlbW92ZSBpbiBkZXZpY2VfcmVtb3ZlKCkgY2FsbCBwYXRoIGFuZCB0aGVy
ZSBpcyBubw0KPj4+PiB3YXkgdG8gcHJldmVudCB0aGUgZGV2aWNlIHJlbW92YWwuIFNvLCBhZG1p
biBpcyBub3QgY2FwYWJsZSB0byB0cnkgdGhpcw0KPj4+PiBhZ2Fpbi4NCj4+Pg0KPj4+IElkZWFs
bHkgTGludXggd29uJ3QgcmVtb3ZlIHRoZSBkZXZpY2UsIGFuZCB0aGVuIHRoZSBhZG1pbiB3b3Vs
ZCBnZXQgdG8NCj4+PiByZXRyeS4gIE1heWJlIHRoZSB3YXkgdGhlIExpbnV4IGhvb2sgaXMgcGxh
Y2VkIGlzIG5vdCB0aGUgYmVzdCBvbmU/DQo+Pj4gVGhlIGh5cGVydmlzb3Igc2hvdWxkIGJlIGF1
dGhvcml0YXRpdmUgb24gd2hldGhlciBhIGRldmljZSBjYW4gYmUNCj4+PiByZW1vdmVkIG9yIG5v
dCwgYW5kIGhlbmNlIFBIWVNERVZPUF9tYW5hZ2VfcGNpX3JlbW92ZSByZXR1cm5pbmcgYW4NCj4+
PiBlcnJvciAoRUJVU1kgb3Igb3RoZXJ3aXNlKSBzaG91bGRuJ3QgYWxsb3cgdGhlIGRldmljZSB1
bnBsdWcgaW4gTGludXgNCj4+PiB0byBjb250aW51ZS4NCj4+IA0KPj4gWWVzLCBpdCB3b3VsZCBi
ZSBpZGVhbGx5LCBidXQgTGludXggZHJpdmVyL2RldmljZSBtb2RlbCBpcyB3cml0dGVuIGluIGEN
Cj4+IHN1Y2ggd2F5LCB0aGF0IFBDSSBzdWJzeXN0ZW0gdHJhY2tzIGFsbCB0aGUgUENJIGRldmlj
ZSB1c2FnZSwgc28gaXQgY2FuDQo+PiBiZSBjZXJ0YWluIHRoYXQgaXQgY2FuIHJlbW92ZSB0aGUg
ZGV2aWNlLiBUaHVzLCBmdW5jdGlvbnMgaW4gdGhlIGRldmljZQ0KPj4gcmVtb3ZhbCBwYXRoIGVp
dGhlciByZXR1cm4gdm9pZCBvciAwLiBPZiBjb3Vyc2UsIGtlcm5lbCBkb2VzIG5vdCBrbm93IHRo
YXQNCj4+IGh5cGVydmlzb3IgaGFzIGFkZGl0aW9uYWwgdXNlcyBmb3IgdGhlIGRldmljZSwgc28g
dGhlcmUgaXMgbm8gbWVjaGFuaXNtcw0KPj4gdG8gcHJldmVudCByZW1vdmFsLg0KPg0KPiBDb3Vs
ZCBwY2liYWNrIG9idGFpbiBhIHJlZmVyZW5jZSBvbiBiZWhhbGYgb2YgdGhlIGh5cGVydmlzb3Is
IGRyb3BwaW5nIGl0DQo+IHdoZW4gZGV2aWNlIHJlbW92YWwgaXMgcmVxdWVzdGVkIChpLmUuIG11
Y2ggY2xvc2VyIHRvIHRoZSBzdGFydCBvZiB0aGF0DQo+IG9wZXJhdGlvbiksIGFuZCBvbmx5IGlm
IGl0IGZpbmRzIHRoYXQgbm8gZ3Vlc3RzIHVzZSB0aGUgZGV2aWNlIGFueW1vcmU/DQoNClllcywg
aXQgY2FuLCBpdCB0aGlzIGluZGVlZCB3aWxsIGhvbGQgYSByZWZlcmVuY2UgdG8gYSBwY2kgZGV2
aWNlIGZvciBhDQp0aW1lLCBidXQgdGhlcmUgYXJlIHNvbWUgY29uc2lkZXJhdGlvbiB0aGF0IG1h
ZGUgdGhpcyBhcHByb2FjaCBub3QNCmZlYXNpYmxlLg0KDQpCYXNpY2FsbHksIHdoZW4gYW4gdXNl
ciB3cml0ZXMgdG8gL3N5cy9idXMvcGNpL1NCREYvcmVtb3ZlLCB0aGUNCmZvbGxvd2luZyBoYXBw
ZW5zOg0KDQoxLiAvc3lzL2J1cy9wY2kvU0JGRC9yZW1vdmUgZW50cnkgaXMgcmVtb3ZlZCAtIHdl
IGNhbid0IHJldHJ5IHRoZQ0Kb3BlcmF0aW9uIGFueW1vcmUNCg0KW3VuaW1wb3J0YW50IHRoaW5n
c10NCg0KTi4gcGNpX3N0b3BfZGV2KCkgZnVuY3Rpb24gaXMgY2FsbGVkLiBUaGlzIGZ1bmN0aW9u
IHVubG9hZHMgYSBkZXZpY2UNCmRyaXZlci4gQW55IGdvb2QgYmVoYXZpbmcgZHJpdmVyIHNob3Vs
ZCBkcm9wIGFsbCBhZGRpdGlvbmFsIHJlZmVyZW5jZXMNCnRvIGEgZGV2aWNlIGF0IHRoaXMgcG9p
bnQuDQoNClttb3JlIHVuaW1wb3J0YW50IHRoaW5nc10NCg0KTS4gUENJIHN1YnN5c3RlbSBkcm9w
cyBvd24gcmVmZXJlbmNlIHRvIGEgZ2VuZXJpYyBkZXZpY2Ugb2JqZWN0DQoNClNvLCBhcyB5b3Ug
Y2FuIHNlZSwgYWRtaW4gY2FuJ3QgcmVzdGFydCBhICJmYWlsZWQiIGF0dGVtcHQgdG8gcmVtb3Zl
IGENClBDSSBkZXZpY2UuDQoNCk9uIG90aGVyIGhhbmQsIHJlbW92ZSgpIGZ1bmN0aW9uIGNhbiBz
bGVlcC4gVGhpcyBhbGxvd3MgdXMgdG8gcGF1c2UNCnJlbW92YWwgcHJvY2VzcyBhIGJpdCBhbmQg
Y2hlY2sgaWYgaHlwZXJ2aXNvciBoYWQgZmluaXNoZWQgcmVtb3ZpbmcgYQ0KUENJIGRldmljZSBv
biBpdHMgc2lkZS4gQnV0LCBhcyB5b3UgcG9pbnRlZCBvdXQsIHRoaXMgY2FuIHRha2Ugd2Vla3Mu
Li4NCg0KLS0gDQpXQlIsIFZvbG9keW15cg==

