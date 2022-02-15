Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E1C4B701B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 17:28:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273418.468599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK0gY-0006X3-Fl; Tue, 15 Feb 2022 16:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273418.468599; Tue, 15 Feb 2022 16:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK0gY-0006VB-Bz; Tue, 15 Feb 2022 16:28:14 +0000
Received: by outflank-mailman (input) for mailman id 273418;
 Tue, 15 Feb 2022 16:28:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xOiq=S6=epam.com=prvs=4045782cdb=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nK0gX-0006V3-26
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 16:28:13 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43c15f8c-8e7c-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 17:28:11 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21FG7J3t001754;
 Tue, 15 Feb 2022 16:28:06 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e8ede8ham-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 16:28:06 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by PAXPR03MB7665.eurprd03.prod.outlook.com (2603:10a6:102:200::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Tue, 15 Feb
 2022 16:28:02 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::1161:703b:9ce9:8e34]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::1161:703b:9ce9:8e34%5]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 16:28:02 +0000
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
X-Inumbo-ID: 43c15f8c-8e7c-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiPpVqF1nh/aazzzcQTdWvPc7FgLCxNUGA5FPRAgSs0d5wJOK99CQQyhvP5SJ9GygvQ9mxKu3GpYxGskb7Ye2OAI0i8p9Lh5iQWX+yXZFmyKl3XFYc/oTUKK4VIr9HH2pAxVhv+YzpELrIKFBNlItL+uwsGtczuNdnnvXhZtF3fYAzDm5DiEw3UqmJnBzGBmGH2FsBqufTgnesZa6HhL6nfo9Nfu3l1s2uZ3KXJifAaLL7aYB8PYiAwb5v5KyvMeQ6RfxVJmeYxCefsnPeOLNKoK1426lJjVybDPthzhe9uY617ukZt2XjvOltCNQKbvgUUPZedLycRbVpxnWArz+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgZOaJt+FH67mQt3LsTqeHmCsVVjuzwlxt8mtpFdPQ4=;
 b=nGCkEWwqcRvRijvqher5pvMNojryGc99hZNtWAwGVocuv3eHuakr0atTYL3S85PdmXJ0IGN0Q6ZZYx0tPMkNlAjweQUR48WAQb1xOdE9SyR+r91CyMVDIoV5u+WqWvimNJBv8qqSzn8P3TsjcMy+ETNMKdl7ckuJFkQE8WJtat4A1FgtLxBqds+gjr0nCWPTbRwnz+xKRlqmIjekUMMUekER6bgVDPMyc13ZEWRpuv5XjJr0i8sjpgEb9YTj39RnAOcRxKRMrPwPKJSlSUFMXr0AszLyUs3gdQeV3VeEU2XHep/zBEjH1xDuE3Do0opKT7t/shon+ljCJFosKy7cVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgZOaJt+FH67mQt3LsTqeHmCsVVjuzwlxt8mtpFdPQ4=;
 b=dvnaJQIfUPelv6Ltrx3BtAxLbWdQX99sIG4FDTWuWwt4YoPsRwwEjuQkrQVnxc+tL2aLZB1QMHFjZbR4c5JF0oBYqQ9HJrjjD4KkXjR5GTLX7E+/1d+VkeOCtnxC9eW48jPUfk8Uijnl3pKMH8xoKbw+B1JT1IHlF5UqnZGoQZg51MFjWkhCtHOWQtlwMQ8GvItj4fTxEF0icR9uVFovTi212VhdW0/AVv2A+o3URzwF/l80+kofvtEdVoQOv8hRldNg/CFL77l0A4w1570jloiSNTTuGhpgi1o5S+DMdEM7PAsDrrs1XOUHE/HLuJ/93Nkm2shkO5uuWnogB7W/mA==
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
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Topic: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: 
 AQHYIkOs9pmsZb0l5kefj1m3qdTVCayUboeAgAAGwYCAAAeVgIAAAZQAgAABlwCAAAEVAIAADewAgAADdICAAC9JAIAACSyAgAAChoA=
Date: Tue, 15 Feb 2022 16:28:01 +0000
Message-ID: <8781c4ad-52c7-2e04-0901-b5b9a36c1904@epam.com>
References: <20220215081135.1497470-1-andr2000@gmail.com>
 <YguE7RWOteSnvVNY@Air-de-Roger>
 <c5b9b02c-93f8-d018-6048-9abf2e7de4dc@epam.com>
 <YguQ8wfhfYFXTWSU@Air-de-Roger>
 <70dbd7fd-3f74-d0d3-6e30-c1e1e24fc279@epam.com>
 <0d8f01b2-b015-a08e-dd49-e9c688ff7245@suse.com>
 <bbb36ebc-de66-297d-f82f-abc0e63f20a2@epam.com>
 <22d25499-cab0-00c1-3ad3-bddd74c97a55@epam.com>
 <772eb410-be1a-3b5f-3b51-e363c43bc3c6@suse.com>
 <504327d2-0d82-7f88-e155-e6a45ba11a74@epam.com>
 <0c7aa17a-1735-1d9c-9cec-fa3693025256@suse.com>
In-Reply-To: <0c7aa17a-1735-1d9c-9cec-fa3693025256@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37c1814d-a932-498f-2e5e-08d9f0a022de
x-ms-traffictypediagnostic: PAXPR03MB7665:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PAXPR03MB7665F05376ADD03EA1E32450E7349@PAXPR03MB7665.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 X+Hh8Gc4qOe47pht7h0rQPyjLfcn/ybf+kCEGgDvTutv8zv5jc+E/a856DRuavqFblSX2Z4odAsG27SPnivRMQXdqJgq4u1OiJEdezbGAYrGR7ekaweAI544hTxKHg2POFjMZQUQgQnzyBOcRZP68cbllMzscckQ4obP7q19jk3KDYla2NYfEGDadmu6B6e13WF7O3JsDjEtVL0w506wMGqqBX4smwKadUxdnhpjyLs6PoElayIwd5/focZhnQXZpJ+zqxqUJmjhQHySLTMKikk+MGhw2emFb1z3tzAJVdVBz18+soSA+5UFsmN1AsF+uPZZzRJX/ZXFdwg4rHXbLX3rWtZnaPxNZb135tyYVFh2Z0hXJszxKK/oTILJR/if9oWBEwP2zcP3iiPZAOOswbCvvbhOeQ/fUkXM/I9zhElHOPt/Fdinz2+EUBIentek23YZsL8e6oEnQQdmW/PMsKb6IKw3HUcYO1UZaPX2ebRCPh/xHfoMAPEUC0/26TD6N5EPRgOk+XYRfUWA7Jm1hFATOWMWQJoK69sw69LpFRYWi7c424SCjCNSKHqOdNZBvXobqko0FX3SuAQ13qvhlSuAxvAkKY2Oh9FUZz33CNC258DJvflQslkrrXIcss44LKn4YIAKBENqRu0h69xGAaq/CZ/2Fz8fe12BmVvF38XbWdTX418bAGfcFsKf4Ea7LT1bVnqwgBH/Cr6VfMj4bDuiqMegqnGrU/hAOnlrTZBi0t9LKQT0VHf7OH3TfQbkdSXWtIGeuxI7PcFQbCpypA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(6506007)(6512007)(53546011)(2616005)(83380400001)(8936002)(186003)(26005)(2906002)(71200400001)(508600001)(38100700002)(54906003)(6916009)(76116006)(122000001)(38070700005)(8676002)(86362001)(4326008)(64756008)(31696002)(36756003)(66556008)(316002)(31686004)(66446008)(66476007)(5660300002)(66946007)(21314003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cHdnYXlKdUlJci9tQjhDZS9jaDlKUjUxd3drc09IUE1zUFJtR3lhWFVjY2xu?=
 =?utf-8?B?MlVMNElVQ0dxWXF0NjNuZHFFWXMwSlpWYmFMOWd6VEw0ZVlRcnBPRGJqbU1Q?=
 =?utf-8?B?SWc2MkxWY0tsNUw0UWYzSUY1OGt0ZUlRQnFZL3dVT2Y1YzRqakJLTWYrekVL?=
 =?utf-8?B?cUlLSlpEbmhzam9XRHdtZ29MY1FGbGwyMmltcWZMcm1TUHViNUoxSzJzSDhO?=
 =?utf-8?B?aXBqZXd4RTJZQXZOOVliQWNoN2dvckZFTlh0N1Nod0ZWb1NhZ0FmN085NERt?=
 =?utf-8?B?bzllNWs1Nm1TL2NaeTdtK3l0cUs3UEQzRUNjd2RKRkpNaHRmNWprSzdwWXlH?=
 =?utf-8?B?R2RtQ2F6SUpjaE1VMHVHZEIvY1MvUHpqZUxsc045RWtPMExJYlJMSnIrVSt5?=
 =?utf-8?B?NFlEanRUUHhndURtVXVXQlBHcXNrMGlIYWFDWHJvU3lTSXNWbks0Nkgwbm4y?=
 =?utf-8?B?Qm12VklUVFZvU2FBWk14NmtoczNMMHo0cWhMNVhxYkhaTDkyMmdPQ1JjQXZV?=
 =?utf-8?B?SVJVSk9KcWpnZVk3OVNveUJPRm5pSmtnc1JxaTNrV0t0Q0pXbkx6eG02OFJ4?=
 =?utf-8?B?YkM2a050SGRWbE5mSERsblpxbmFYbVB0MTcvNGI1aTJscFVkeWJKOWJhUm9x?=
 =?utf-8?B?Y1dMazkrL09UeXJoOU0rOFFEellwK21JQnlGR2FEWkVWVXJMZXhhcW5HZDUz?=
 =?utf-8?B?bFY4NnlINHppYURZdG9RYTFvZGlVbXJYbFFPcnhhL1dMNHU4WndCdHhvOEU1?=
 =?utf-8?B?ZzNkcWhsK1VvQWVQbk9tenV2YXBxZ3dxRWZ3WE9hcXY1akd4ZXVmTm5sYndp?=
 =?utf-8?B?cmUzOGJmQ3dQWTZRSHREZk9pY3QyT0JhTnFBS2JWaVo1WGZLNnJWVDQvTEJS?=
 =?utf-8?B?ZVFNNnJvYmlqQUp3K2IvN1luaklYdHdsRFovaUlRK29pdkcvdGk1Ti8zTlB5?=
 =?utf-8?B?empJMG10WUN2dDQ4QUdVRVpuaTRTSS8vSUtlMkdEWmFBVnNOaGJqZVNsWDhM?=
 =?utf-8?B?eis2Y2dPcGtUVnV3WlhNVTA4U1FPZXJsak9mTFJKWjdOcjhTd0lja0dFL3hI?=
 =?utf-8?B?cmJIUDM1UElGajdWU3ZlczVuLy9YRDlpVkhpSDJrUWIyby9ibGlqQjU2RXZ3?=
 =?utf-8?B?ZTQwbTVQaFFxZllRKzFTWGRMUGdseXJ3WmNvNUxjUE9TZlpoRCtJUFAzOGRB?=
 =?utf-8?B?eFFBUWV0R1ljWTZGWWQ2eXV2OWVyVm1leXM5RW9WSUxERVMyeG4zdis1UHlk?=
 =?utf-8?B?NlA4SVY1VGVueDBTd0tUOVY0cXJONXNkNXFzM3Mxd0x2V3lPN0FibmVMQ2ZX?=
 =?utf-8?B?TW5NTTFoZUhEZ0R1dGR3TlY2OFpMQU55Y1M5Q095WEpaK04renpzbzlnMVp3?=
 =?utf-8?B?TTFEVmpWSUtnY1pUUnpSb2dJY05lU3ZCTWowWDJLL2oxMjFtRGtNODBRNW1h?=
 =?utf-8?B?cXRVazc4UlJBSFVlT00rbVJBZ3NnYVltT242eFp1cUNnSWg4TlJ1YzNhSUNi?=
 =?utf-8?B?ZWV6RlY1Ri94dng1eGJLbWo5RlpmTEpHNGNudDlrZjAwU2psbVRLTDFNQmlH?=
 =?utf-8?B?dHgrK2lUTUdyUjBRVVBKUTJib2RCVGlyTmpaNTBXZkx4czBneDdwTlpJRzNH?=
 =?utf-8?B?YUF4TjZFemZNNFR3RXpmM1kyMGpxL3MxQWh3L3hhdWdQaUYwUG9hL2xsemJ2?=
 =?utf-8?B?Y1dwaXRrOW5ucTZHUWEzUGhzVnFVQXcxWjE3NmNoaDBJNk4vY1VkZDBrc0pz?=
 =?utf-8?B?a2s4RHRpRTJsU3lVMkVrWkVxWUpFdHU5WUIyWDllN0VCb1FreE9TNDZRZkEz?=
 =?utf-8?B?WUZ6U2VBcjdmWDc0WnRvSUI4V0xLNnZ3N2V0b1JaTHQyTmpoSERCZjFDVTk2?=
 =?utf-8?B?NFN0SlRiV1owTkxsQ3htZ0F1d1hMRHhyRVU1Q0FKbGRuZjN5d28zT2c5Ky9Q?=
 =?utf-8?B?MWozc2cxbFppWlpHOXB5K2NKZk4xdWFTSzh3Rkx0Y1k0cmtTRDNDT1VaSHhN?=
 =?utf-8?B?eG1ZWXRNY04wWWUyOS9GOEpsSDVmUEVkclZ6MTZ5dzMrbytsZ0FKU0ptV3hp?=
 =?utf-8?B?cWFOc1BUZ3cwRGYxWVc2eCsrcUxLSndNck5kM3ovWjRiR1hwWWNxTEZFY2tW?=
 =?utf-8?B?N09qSVl3YnpPVXZoWjNYSXpjaVlPck11dFVsMVZzWWNnK0dMV2Vyc0xXUDF2?=
 =?utf-8?B?TmtCeVZsQ1RScXlhMUE4bFhXajJYT293VXdXUzRxU1VoRVNFenE3ZzFFT0Z1?=
 =?utf-8?B?RG9mRytpQVN6cFR5NmhXVUM4cGlRMkRaR2tERDVsaHRUUGhYZy9uLzdHR00z?=
 =?utf-8?B?aG1vOG9qRUlDZVovM2NlUHRBWFhnb05JM2YxSEViS3djUjM0T3cxUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7471F7BF7FA6B34EB3FF05463A450F5E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c1814d-a932-498f-2e5e-08d9f0a022de
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 16:28:01.8494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1JMPDibn9YbjWe14tC0dlzethwGHnLcavIbpvUP/+DB62ZL8DkVc2FxP6WM3RIC1MDFKqhQa0N37sYFvoh8qiEbMtz8p5sdMyTsYqhHhn7K5Ead2hXBBBfH6gvHa6Bsi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7665
X-Proofpoint-GUID: RG2gtI7eFVMVEirT3TmUCuo-RSQ3Ignq
X-Proofpoint-ORIG-GUID: RG2gtI7eFVMVEirT3TmUCuo-RSQ3Ignq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 mlxlogscore=837 bulkscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150097

DQoNCk9uIDE1LjAyLjIyIDE4OjE4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTUuMDIuMjAy
MiAxNjo0NiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBRdWVzdGlvbjogY2Fu
IGFueW9uZSBwbGVhc2UgZXhwbGFpbiB3aHkgcGNpZGV2cyBpcyBhIHJlY3Vyc2l2ZSBsb2NrPw0K
PiBXZWxsLCBhc3N1bWluZyB5b3UgZGlkIGxvb2sgYXQgdGhlIGNoYW5nZSBtYWtpbmcgaXQgc28s
IGNhbiB5b3UgYmUgYQ0KPiBsaXR0bGUgbW9yZSBzcGVjaWZpYyB3aXRoIHlvdXIgcXVlc3Rpb24/
IEFyZSB5b3UgcGVyaGFwcyBzdWdnZXN0aW5nDQo+IHRoZSBvcmlnaW5hbCByZWFzb24gaGFzIGRp
c2FwcGVhcmVkLCBhbmQgbm8gbmV3IG9uZSBoYXMgYXBwZWFyZWQ/IEknbQ0KPiBhZnJhaWQgSSBo
YXZlIHRvIHJlcGVhdCB3aGF0IEkgZGlkIHNheSBiZWZvcmU6IElmIHlvdSB3YW50IHRvIHJlbW92
ZQ0KPiB0aGUgcmVjdXJzaXZlIG5hdHVyZSBvZiB0aGUgbG9jaywgdGhlbiBpdCBpcyBhbGwgb24g
eW91IHRvIHByb3ZlIHRoYXQNCj4gdGhlcmUncyBubyBjb2RlIHBhdGggd2hlcmUgdGhlIGxvY2sg
aXMgdGFrZW4gcmVjdXJzaXZlbHkuIElPVyBldmVuIGlmDQo+IG5vLW9uZSBrbmV3IG9mIGEgcmVh
c29uLCB5b3UnZCBzdGlsbCBuZWVkIHRvIHByb3ZpZGUgdGhpcyBwcm9vZi4NCj4gVW5sZXNzIG9m
IGNvdXJzZSB3ZSdkIGFsbCBhZ3JlZSB3ZSdyZSBva2F5IHRvIHRha2UgdGhlIHJpc2s7IEkgZG9u
J3QNCj4gc2VlIHVzIGRvaW5nIHNvLCB0aG91Z2guDQpUaGUgcXVlc3Rpb24gd2FzIGV4YWN0bHkg
YXMgYXNrZWQ6IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgaXQgaXMNCnJlY3Vyc2l2ZSBhbmQgZm9y
IHdoYXQgcmVhc29uLiBJIGFtIG5vdCBzdWdnZXN0aW5nIHdlIGJsaW5kbHkNCmNoYW5nZSBpdCB0
byBhIG5vcm1hbCBzcGlubG9jay4NCg0KTXkgaW1wcmVzc2lvbiB3YXMgdGhhdCB0aGUgY29kZSBp
cyBzdHJ1Y3R1cmVkIGluIGEgd2F5DQp0aGF0IHRoZSBzYW1lIGZ1bmN0aW9uYWxpdHkgaXMgY29k
ZWQgc3VjaCBhcyBmdW5jdGlvbnMsDQp3aGljaCBhbHJlYWR5IGhvbGQgdGhlIGxvY2ssIGNhbiBj
YWxsIG90aGVycyB3aGljaCBhcmUNCmFib3V0IHRvIGFjcXVpcmUgdGhlIHNhbWUuIFNvLCB0aGF0
IGFsbG93ZWQgbm90IGludHJvZHVjaW5nDQpYWFggYW5kIFhYWF91bmxvY2tlZCBmdW5jdGlvbiBw
YWlycyB3aGljaCBjYW4gYmUgZG9uZQ0KZm9yIG1hbnkgcmVhc29ucy4NCg0KVGhhdCdzIGl0DQoN
Cj4gSmFuDQo+DQo+DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

