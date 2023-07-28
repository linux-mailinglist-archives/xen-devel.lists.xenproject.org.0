Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 070217660BC
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 02:22:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571302.894835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPBFC-0006Bl-VE; Fri, 28 Jul 2023 00:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571302.894835; Fri, 28 Jul 2023 00:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPBFC-00069R-S3; Fri, 28 Jul 2023 00:22:10 +0000
Received: by outflank-mailman (input) for mailman id 571302;
 Fri, 28 Jul 2023 00:22:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOvc=DO=epam.com=prvs=15732b3b8b=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qPBFA-00069L-GM
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 00:22:08 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c68bb304-2cdc-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 02:22:04 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36RHFWSN021292; Fri, 28 Jul 2023 00:22:00 GMT
Received: from eur03-am7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2233.outbound.protection.outlook.com [104.47.51.233])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3s3mq9ua5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jul 2023 00:21:59 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB7987.eurprd03.prod.outlook.com (2603:10a6:20b:42a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Fri, 28 Jul
 2023 00:21:55 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85%3]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 00:21:54 +0000
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
X-Inumbo-ID: c68bb304-2cdc-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5h/WE6H6oVcPC5KoAJjrYYvDW1cwHC9dcWdNmARl2NJxqIrsFY0Vjq4ZC5sa5jP+0wXlAWlfHGySmrwBGcPD6dssnw1eumTptp0Svurl5xRCdfRZDHp5hJinxE8PJeGAdFN9eJ51l7paxVj2vxMqPBjfZ0up99zeEij4htaC+F8/GXgc6kJoNO8m2oybzN/KU6h5wyAAWQHF4UixLRlYL3LWTXp1QIZ6MRYorln6HiKfz0HVTRlbsUrhp1NUjfONpGtVfxBEHyWGwzF4G8PcNQVkiIpNDoBPtG2F//PolQvIkjsjSCOqKaJEaTGcsE8xm1BRU31V3AGbYx2zpk+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+f4typXSugZLDpj2djbBYPXReNGva54XD63rE6iHb0=;
 b=KHx8/6BsgpxvenwH1JbUASjAl8cPyRbEuo7V1cBiRIqOmgDH7/EQGJMyHgRUNLocAaq3cQhtMqylSyndbzdEb87dPKe8X8DSw5tk+eEHOqC6tQHVngb9y20+2pWPYakOzj61x7heAf0uLSrJeMLySwmNqRiBGWcB32vKwXFJEmL9HN+cO+WlZekMg9f0vgU7/YwpctGnaStnggrINIXdA4KJlddArqpdp/2u/8xDH2M983w67AyzL/GuFtOdHTopGeVU31obtIKpUhbF4ExzWfAmxPEeeYlbSGkNgaC43tF8lXbVHsGgqR8FfRxNSPGlrQsU2SyLRYMsvauxPbIyDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+f4typXSugZLDpj2djbBYPXReNGva54XD63rE6iHb0=;
 b=dwLaEbUaQZKyiiPLonbqFTTySP/IERqOdl94bnPS1sBweww/K9WVoi7PeO9PLAvOrpuP9lQLeI8J36VLaZHVk/xAxK4P0jSEj0XVs6PpQYP093Zy92OFiWwudmbdf3PaffBe1iL7p1uszW5eXRCTUzVN92fs6s2Lmi9CgOycXf2bIJyb8gxhe4vgC9Xw1F9cp1YLRMaqgHWtDbsHNyMc00WnL5nwpf2WUC/G2tMsRuyYCvm4rYd9dew++Scksbw7u7gw5sCyu7AJNSYQV/VsVoczlqGILDzHd02hTo8G6n7KphFpc2ECBdFFyij26MvmjR4oHMpmrsWrYyE9Vtkvtw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Jan Beulich
	<jbeulich@suse.com>
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Thread-Topic: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Thread-Index: 
 AQHZuqGrLMJPz1ipBEu4urExXp8yi6/CgxUAgAWEoICAA8vwgIAA+VsAgADNRYCAALGHgA==
Date: Fri, 28 Jul 2023 00:21:54 +0000
Message-ID: <87cz0cc2ce.fsf@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <ZLkYdhOPLTmogXGq@MacBook-Air-de-Roger.local> <87ila7cvy2.fsf@epam.com>
 <ZMDox0WwumxMGnzV@MacBook-Air-de-Roger.local> <87y1j2b296.fsf@epam.com>
 <ZMJmJTkSFLKZXkKB@MacBook-Air-de-Roger.local>
In-Reply-To: <ZMJmJTkSFLKZXkKB@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7987:EE_
x-ms-office365-filtering-correlation-id: 594e30b5-7640-49b4-b050-08db8f00a5a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YtTZqK49qetVUWGRdCfP8vO6WUX7KYjFR9O22EF9n0UQlL/J9IKZXeoeliWGERi+IK1DQwVtGX08Sf4IrWRT1iwBSYUy4qt9hpb2mL93d2Qbrup+q/pq6RWXYxn7e4qVk98FMnhdS8m+A+M3g7voXUuTmpE7A0juMmfPiqH7RJy08CLEiKWDxD8LmtFHVI1FICzCwRSvTXbjrx+QmnzJLFkmjFQVAh6NqNQ9V4QK1neHpKuS/fug1MylxN1S5Uv27/LC9lBjyrkTrL5OfEQpC04yfzCdSq8YVbFvwK01i5k6GgQrvv/ttYORHamfcPoxJ1mvF3+vPaKCtZSnRRDMiwXbNDmv93WRp3PXqwv5AhR4DYwJX0EK27eMjXnWdF29EFMwJWCZMurhoCm3pd4epUwG89M1HZ/mcNvPuN7jO1gW/nio01axd/qrg3yeyVg50jJK/4qgB9gmHWSxRfncQWHIkuRlZ5JdeZqtFc4eVhYiEknzg5lx8OAnC9NT/ajnmADgDTFQLjZHd64a+ZshWTWk5cQuShadehzmhm1aq0s0ihSLnnO4XA6trA0mhI5e+CfeKH609tDORaG+YI8nFEMphpOEIXCzatyGZM5dfyw2f+30DoXFOVQVzNiJar6s
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199021)(5660300002)(66946007)(38100700002)(478600001)(122000001)(66556008)(2616005)(55236004)(83380400001)(36756003)(66446008)(71200400001)(8936002)(8676002)(6916009)(316002)(6486002)(76116006)(54906003)(41300700001)(91956017)(6512007)(6506007)(4326008)(26005)(64756008)(186003)(66476007)(2906002)(38070700005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dkpnblEyNXBQdlpyTlNBVldGQlptRDhoVXNBNC9FNk0vaEtiYzJMa3k2TzND?=
 =?utf-8?B?YWJ4clA2Qk1helRMdVBxKzB1d3RLNWdxQVIxQWtJN3dmQWtRdDRSUytjcm14?=
 =?utf-8?B?KzhiQXQwY0VzeDJBTUpjaXZ6cmdTVGIzSGZDYXRoNHVpSGpVRzZ5VFB2UHNB?=
 =?utf-8?B?aWh1S0M1TDJkaGFuZWgzZjk1OUkvZEVLaWUwa2RWbGpiQXB2ZDR2YW1ZNjQx?=
 =?utf-8?B?enhxVWdyQnJMS1dwWnZkaGttMUZOM3R1K05hZVNYeG8vdm4wRGIzMW5RakNN?=
 =?utf-8?B?WXJOc0VVUTgrYkFOQXBYSXVsbmpqNWdEK1h1K3V4MFpmdVBsNGlhOXIvejZr?=
 =?utf-8?B?YTVSa09GZ0dGYnFwVnFYdlphOXlLN0xuZm9NRGhCODgzeG1WSWYrMVZVTEg5?=
 =?utf-8?B?UTVNQVR5WmdlTUNVN1FUcU5ZQ0wrWTR4ZkM2RWRZQVZvVGtMZDNZdnJhT2xo?=
 =?utf-8?B?b0RvMTZBbmd3WE9TNitBRzBRMjV6NUNRRUs2Y2ozMDh4VlBMaEtlOXpEb1Fp?=
 =?utf-8?B?Sm1xQVNGL1ZKUGxTbXhZNVRwSnZDdGw5SThIekNhOUplWFQyaXA2UlNtOXA1?=
 =?utf-8?B?QXFQYXVOVEVxL2hiYWJiWU1PcGFRT3hUOTlLS3NuRlJaMjFhM2hVY3NUa3JS?=
 =?utf-8?B?SnpxZ3BRQmpaN1RrK0s3U0E1eWRQUXdHSi9KMDBJaU5RRVFJUktEQ0JLekUz?=
 =?utf-8?B?KzI0Mm9kZmhVZjR3MTdCeC9GS0pCSHIwUDlHd2FYZHpFT2ZZbVM0bTEwcy9L?=
 =?utf-8?B?K2ZGZS9PS0pTSkYrVTNuRHRlaEZCNGplZnozcHJLSm8zOU1XZGZaaXVlcTE2?=
 =?utf-8?B?VDA4TGdBWGV0aGNBSGxHdUk2NGo3aUxwZWdzalp4a2hQdElmOUxzdk1JcVVR?=
 =?utf-8?B?em1ldnJzYUIvQURwZ0MvNzk1ZDQ4YWQvSjBIMit0NUtQYUF0OHdFQ0UzKzhT?=
 =?utf-8?B?d0RJRjBtTXQ4VDFpOEozb0htV0g0VWFtdkVFZWM4VzY5L0J5blNSYnhUcHpH?=
 =?utf-8?B?Wm03TXdoOHUzR3hvVGVzdjQvTHJXTjljeDlGY0NxdlNVdHJTSUxDOWR2bUNp?=
 =?utf-8?B?akM0NVpPakNsbXN5d1M3SHZYbzNSMFo5d3gvajRBcFhOOTE0R2pHckZhWFFp?=
 =?utf-8?B?M2RiYVN3ZTQyZC9Zd3pSMEdTZ3IyaGs3K1ZRNXVBL2p4Rk9yNElwM3VBdEt0?=
 =?utf-8?B?SU90WTBaTGloMVVPaTEybTVseTdEbGloWWJpT1REb3RqYVk5Z3M0RkFXcmFY?=
 =?utf-8?B?TDh5MVdVdkJldWhxSlpseWpsekRTODJ0MEN6aXJWREhQWFZYajVpd1Rxa0Vs?=
 =?utf-8?B?VG9xdmpuVjhnTE9ueWpMV1g5TUo5L05udFpvOTZ2K0RuUnJnTjZEN2tWZ1Fl?=
 =?utf-8?B?aGJWMmhFQ2p3eXdNRldzZE9iYXBIZW1HcFRsS21UUU1xRWordUpRM2JpYjNh?=
 =?utf-8?B?SVY4NTZjVzduVEdudWhQMm9EbzNwdy9LU0l0bzNrUXh5cktnV3FpbDF1d0JY?=
 =?utf-8?B?STJXL3A3VWJKVklkSnpRa0VYT0dKRldKWkx6a0pHOHhlbGZNakJQUEZaN2xq?=
 =?utf-8?B?VXd3ZTMvVjdDalpmS1UrMjVDa0R6L2ErZ2hYLzMvTFFDR1A3dEd2OWlocHJI?=
 =?utf-8?B?NnJtd3FuSHpsVDljdEF0b1NYZkxSL0tWZmlyWXRGTVV2SllEcWlzeTFkL0FL?=
 =?utf-8?B?SThSVENYN1hScWw2NTFPVW9NU3V2NjRpNmZwRWZaN3Z6ZXVCa0hKd0NETk9i?=
 =?utf-8?B?TXJkU0dvNTFURnI3KzU0UjBDbFJkM1V6MWJOWkQ4QTdTWUlWcDFRM0ZERlJB?=
 =?utf-8?B?Q0QvdzAzVm9nM3BlZzNlZmVlZU5TaS81NEJlZWV0WUttbDVQc015bldES2k0?=
 =?utf-8?B?elBld2VucEpjcGdsVVFweGFhcVRkMHFvY1AvdWQxam5seldWaFE5S3JWM0NL?=
 =?utf-8?B?Y1d0VENIVGZuTmdrbUFxRjZzZEFjMEZ6ekQvL2NxN0pxbTU0QU16NGMwanVV?=
 =?utf-8?B?ckUrUDgxSUJ0eGpSYkRiTGdQZk14Y1RIY21qVGd0MFlRcGtack5XNVpobHRE?=
 =?utf-8?B?aE45a0hEV2FwTGUvNFk4VzRzLzdpY3JkUWtqeEFVT2pWdnRIa1o5bU5jUmJr?=
 =?utf-8?B?MjU3dmpaZk5XSStrUGFrMW1WbENPVUFLdmM2ajJzMytkdm1vUnBPSGJLdW8y?=
 =?utf-8?B?K2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1EBAEAF660ABB41A1A730F343AC6827@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594e30b5-7640-49b4-b050-08db8f00a5a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2023 00:21:54.4785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0mB9wilj+WFm7+n69Vez+RzZIwwW6K1PS5amama3ERFCQfi8dDF7iNjNQUXubfLMkeSy75JYSN05tu4yL3HvIivy3zwClkY2Dtl1WH1vpgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7987
X-Proofpoint-ORIG-GUID: ACrdNsf0uY5TwhwaIdgVUdaj64rD5at7
X-Proofpoint-GUID: ACrdNsf0uY5TwhwaIdgVUdaj64rD5at7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=683 phishscore=0 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 impostorscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307280001

DQpIaSBSb2dlciwNCg0KUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
aXRlczoNCg0KPiBPbiBUaHUsIEp1bCAyNywgMjAyMyBhdCAxMjo1Njo1NEFNICswMDAwLCBWb2xv
ZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+IEhpIFJvZ2VyLA0KPj4gDQo+PiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JpdGVzOg0KPj4gDQo+PiA+IE9uIFdlZCwgSnVs
IDI2LCAyMDIzIGF0IDAxOjE3OjU4QU0gKzAwMDAsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0K
Pj4gPj4gDQo+PiA+PiBIaSBSb2dlciwNCj4+ID4+IA0KPj4gPj4gUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyaXRlczoNCj4+ID4+IA0KPj4gPj4gPiBPbiBUaHUsIEp1
bCAyMCwgMjAyMyBhdCAxMjozMjozMUFNICswMDAwLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToN
Cj4+ID4+ID4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVz
aGNoZW5rb0BlcGFtLmNvbT4NCj4+ID4+ID4+IEBAIC00OTgsNiArNTM3LDcgQEAgdm9pZCB2cGNp
X3dyaXRlKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywgdW5zaWduZWQgaW50IHNp
emUsDQo+PiA+PiA+PiAgICAgICAgICBBU1NFUlQoZGF0YV9vZmZzZXQgPCBzaXplKTsNCj4+ID4+
ID4+ICAgICAgfQ0KPj4gPj4gPj4gICAgICBzcGluX3VubG9jaygmcGRldi0+dnBjaS0+bG9jayk7
DQo+PiA+PiA+PiArICAgIHVubG9ja19sb2NrcyhkKTsNCj4+ID4+ID4NCj4+ID4+ID4gVGhlcmUn
cyBvbmUgaXNzdWUgaGVyZSwgc29tZSBoYW5kbGVycyB3aWxsIGNhbCBwY2lkZXZzX2xvY2soKSwg
d2hpY2gNCj4+ID4+ID4gd2lsbCByZXN1bHQgaW4gYSBsb2NrIG92ZXIgaW52ZXJzaW9uLCBhcyBp
biB0aGUgcHJldmlvdXMgcGF0Y2ggd2UNCj4+ID4+ID4gYWdyZWVkIHRoYXQgdGhlIGxvY2tpbmcg
b3JkZXIgd2FzIHBjaWRldnNfbG9jayBmaXJzdCwgZC0+cGNpX2xvY2sNCj4+ID4+ID4gYWZ0ZXIu
DQo+PiA+PiA+DQo+PiA+PiA+IEZvciBleGFtcGxlIHRoZSBNU0kgY29udHJvbF93cml0ZSgpIGhh
bmRsZXIgd2lsbCBjYWxsDQo+PiA+PiA+IHZwY2lfbXNpX2FyY2hfZW5hYmxlKCkgd2hpY2ggdGFr
ZXMgdGhlIHBjaWRldnMgbG9jay4gIEkgdGhpbmsgSSB3aWxsDQo+PiA+PiA+IGhhdmUgdG8gbG9v
ayBpbnRvIHVzaW5nIGEgZGVkaWNhdGVkIGxvY2sgZm9yIE1TSSByZWxhdGVkIGhhbmRsaW5nLCBh
cw0KPj4gPj4gPiB0aGF0J3MgdGhlIG9ubHkgcGxhY2Ugd2hlcmUgSSB0aGluayB3ZSBoYXZlIHRo
aXMgcGF0dGVybiBvZiB0YWtpbmcgdGhlDQo+PiA+PiA+IHBjaWRldnNfbG9jayBhZnRlciB0aGUg
ZC0+cGNpX2xvY2suDQo+PiA+PiANCj4+ID4+IEknbGwgbWVudGlvbiB0aGlzIGluIHRoZSBjb21t
aXQgbWVzc2FnZS4gSXMgdGhlcmUgc29tZXRoaW5nIGVsc2UgdGhhdCBJDQo+PiA+PiBzaG91bGQg
ZG8gcmlnaHQgbm93Pw0KPj4gPg0KPj4gPiBXZWxsLCBJIGRvbid0IHRoaW5rIHdlIHdhbnQgdG8g
Y29tbWl0IHRoaXMgYXMtaXMgd2l0aCBhIGtub3duIGxvY2sNCj4+ID4gaW52ZXJzaW9uLg0KPj4g
Pg0KPj4gPiBUaGUgZnVuY3Rpb25zIHRoYXQgcmVxdWlyZSB0aGUgcGNpZGV2cyBsb2NrIGFyZToN
Cj4+ID4NCj4+ID4gcHRfaXJxX3tjcmVhdGUsZGVzdHJveX1fYmluZCgpDQo+PiA+IHVubWFwX2Rv
bWFpbl9waXJxKCkNCj4+ID4NCj4+ID4gQUZBSUNUIHRob3NlIGZ1bmN0aW9ucyByZXF1aXJlIHRo
ZSBsb2NrIGluIG9yZGVyIHRvIGFzc2VydCB0aGF0IHRoZQ0KPj4gPiB1bmRlcmx5aW5nIGRldmlj
ZSBkb2Vzbid0IGdvIGF3YXksIGFzIHRoZXkgZG8gYWxzbyB1c2UgZC0+ZXZlbnRfbG9jaw0KPj4g
PiBpbiBvcmRlciB0byBnZXQgZXhjbHVzaXZlIGFjY2VzcyB0byB0aGUgZGF0YSBmaWVsZHMuICBQ
bGVhc2UgZG91YmxlDQo+PiA+IGNoZWNrIHRoYXQgSSdtIG5vdCBtaXN0YWtlbi4NCj4+IA0KPj4g
WW91IGFyZSByaWdodCwgYWxsIHRocmVlIGZ1bmN0aW9uIGRvZXMgbm90IGFjY2VzcyBhbnkgb2Yg
UENJIHN0YXRlDQo+PiBkaXJlY3RseS4gSG93ZXZlci4uLg0KPj4gDQo+PiA+IElmIHRoYXQncyBh
Y2N1cmF0ZSB5b3Ugd2lsbCBoYXZlIHRvIGNoZWNrIHRoZSBjYWxsIHRyZWUgdGhhdCBzcGF3bnMN
Cj4+ID4gZnJvbSB0aG9zZSBmdW5jdGlvbnMgaW4gb3JkZXIgdG8gbW9kaWZ5IHRoZSBhc3NlcnRz
IHRvIGNoZWNrIGZvcg0KPj4gPiBlaXRoZXIgdGhlIHBjaWRldnMgb3IgdGhlIHBlci1kb21haW4g
cGNpX2xpc3QgbG9jayBiZWluZyB0YWtlbi4NCj4+IA0KPj4gLi4uIEkgY2hlY2tlZCBjYWxscyBm
b3IgUFRfSVJRX1RZUEVfTVNJIGNhc2UsIHRoZXJlIGlzIG9ubHkgY2FsbCB0aGF0DQo+PiBib3Ro
ZXJzIG1lOiBodm1fcGlfdXBkYXRlX2lydGUoKSwgd2hpY2ggY2FsbHMgSU8tTU1VIGNvZGUgdmlh
DQo+PiB2bXhfcGlfdXBkYXRlX2lydGUoKToNCj4+IA0KPj4gYW1kX2lvbW11X21zaV9tc2dfdXBk
YXRlX2lyZSgpIG9yIG1zaV9tc2dfd3JpdGVfcmVtYXBfcnRlKCkuDQo+DQo+IFRoYXQgcGF0aCBp
cyBvbmx5IGZvciBWVC1kLCBzbyBzdHJpY3RseSBzcGVha2luZyB5b3Ugb25seSBuZWVkIHRvIHdv
cnJ5DQo+IGFib3V0IG1zaV9tc2dfd3JpdGVfcmVtYXBfcnRlKCkuDQo+DQo+IG1zaV9tc2dfd3Jp
dGVfcmVtYXBfcnRlKCkgZG9lcyB0YWtlIHRoZSBJT01NVSBpbnRyZW1hcCBsb2NrLg0KPg0KPiBU
aGVyZSBhcmUgYWxzbyBleGlzdGluZyBjYWxsZXJzIG9mIGlvbW11X3VwZGF0ZV9pcmVfZnJvbV9t
c2koKSB0aGF0DQo+IGNhbGwgdGhlIGZ1bmN0aW9ucyB3aXRob3V0IHRoZSBwY2lkZXZzIGxvY2tl
ZC4gIFNlZQ0KPiBocGV0X21zaV9zZXRfYWZmaW5pdHkoKSBmb3IgZXhhbXBsZS4NCg0KVGhhbmsg
eW91IGZvciBjbGFyaWZ5aW5nIHRoaXMuDQoNCkkgaGF2ZSBmb3VuZCBhbm90aGVyIGNhbGwgcGF0
aCB3aGljaCBjYXVzZXMgdHJvdWJsZXM6DQpfX3BjaV9lbmFibGVfbXNpW3hdIGlzIGNhbGxlZCBm
cm9tIHBjaV9lbmFibGVfbXNpKCkgdmlhIHZNU0ksIHZpYQ0KcGh5c2Rldl9tYXBfaXJxIGFuZCBh
bHNvIGRpcmVjdGx5IGZyb20gbnMxNjU1MCBkcml2ZXIuDQoNCl9fcGNpX2VuYWJsZV9tc2lbeF0g
YWNjZXNzZXMgcGRldiBmaWVsZHMsIG1vc3RseSBwZGV2LT5tc2l4IG9yDQpwZGV2LT5tc2lfbGlz
dCwgc28gbG9va3MgbGlrZSB3ZSBuZWVkIHBjaWRldnNfbG9jaygpLCBhcyBwZGV2IGZpZWxkcyBh
cmUNCm5vdCBwcm90ZWN0ZWQgYnkgZC0+cGNpX2xvY2suLi4NCg0KLS0gDQpXQlIsIFZvbG9keW15
cg==

