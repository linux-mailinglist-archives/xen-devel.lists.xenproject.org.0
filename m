Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAB96E013E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 23:55:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520397.807938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmiQJ-00041e-Hn; Wed, 12 Apr 2023 21:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520397.807938; Wed, 12 Apr 2023 21:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmiQJ-0003yw-EC; Wed, 12 Apr 2023 21:54:39 +0000
Received: by outflank-mailman (input) for mailman id 520397;
 Wed, 12 Apr 2023 21:54:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gYIF=AD=epam.com=prvs=8466f4a093=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pmiQH-0003yq-Aw
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 21:54:37 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ade299c-d97c-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 23:54:32 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33CGB4kA030903; Wed, 12 Apr 2023 21:54:18 GMT
Received: from eur02-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur02lp2049.outbound.protection.outlook.com [104.47.11.49])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3pwrwhatfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 21:54:17 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DB9PR03MB7273.eurprd03.prod.outlook.com (2603:10a6:10:22f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 12 Apr
 2023 21:54:12 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9b45:4d32:a743:d5e3]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9b45:4d32:a743:d5e3%3]) with mapi id 15.20.6298.030; Wed, 12 Apr 2023
 21:54:12 +0000
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
X-Inumbo-ID: 9ade299c-d97c-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6GLVl387ZrE80wvyItqIgZ+yYpRggbraWYA6bT3tPwZrRdZnLoC9xoOXXZMquiTCQWrnUvqgNi5kneD3VO1KTJVn1dKDiiqRTFYJZv50nROoZhCSbi/9BrhrV2I/PKg3ctUoe67dnMev7JN0zbietpzkfaTiskFp2oIJCV9pBnQuu+H9v8FtWyPLJTsfN5bZxa41bpEgsHlNMzZz/s2AwrSowwS7cHLLS1EllJ04ITAi+nxYf3LVBBV1Zpdtf5eZMRyILCvWnLe3TJj3R00gysxNcAJdhrw4xofQRs0qabvDJno5K4sTCxiCnSP/mHMApgL3jBfdYaMdomfCE6DhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlxlCw/RFtXuleUg42Tg0KKb8+9yk2ViQOEkqs2gl2A=;
 b=O66MBguRLmkJzvATzeV1d3RI6xykDI6Fr8HK702aPL1qPnWPmrnKOvE9wF++E3jk2pARgnq4/BG/Xf/eBuqqGTU5fYMvZQbydJWrC5L9cesa0yOWhHU3koicYiloBS/cdC7JHBteEwKbZQZLkTRhaQlqjmnHHa8U+nHvBo+F6+1yW31y7xs6E0DaNTAxLq6gLtpoOhRZ9y+HVlaOeKDXvuFUmbzTMStZwEey0Bx6NGvikSVefcuyMeKlXSDrW9WW9WTsgcoH3jrfrkbkrTp99lzssUZHti6SQBp0pnQEBamfgTxXmcXduj/IAScCVoNiX6n/qD3AvaNyDCNAk0/b5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlxlCw/RFtXuleUg42Tg0KKb8+9yk2ViQOEkqs2gl2A=;
 b=NQOIXr4UojOVy65+omauUceM4kKsWVuwb/9dQlOt3T0WcJXFl2Ge8xMlXsI7d0s35UqeXX+h3sgHpurce/wUkk17jzqPs3xZuh4oPYciqfgCoEf95xg+BHTcQiV6+1bx9+z4DhVmr5TeiTzJmw7c93F3BipTczLYiwiMKhpHHHHOQnAURiKJ0ZimVqXzFhOqT/iudF0a8/fwJHxqKLg3NUGVLWT6CmNH1eXA9WnfOJsUrqU1Rtolys0NFyNjOlEYt72735f22Ot9oKWQ92PzY2ZSHmL/L6Tgr45EgAmIyGM7EGOBPmfhRqu62UF5w+8kyhJrUaQX3j1HLN6pBuR0mQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Jan
 Beulich <jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>,
        George Dunlap <george.dunlap@citrix.com>,
        Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Paul Durrant
	<paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Thread-Topic: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Thread-Index: AQHZVrdzsdckomMx4kauxHkZQ597Iq79mAMAgClI2ACAAK/igIAAVGGA
Date: Wed, 12 Apr 2023 21:54:12 +0000
Message-ID: <87v8i0wyv0.fsf@epam.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-3-volodymyr_babchuk@epam.com>
 <ZBNA9q5DXJYG3KVp@Air-de-Roger> <873556xa0g.fsf@epam.com>
 <ZDZ2S4OxP2e12oSX@Air-de-Roger>
In-Reply-To: <ZDZ2S4OxP2e12oSX@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DB9PR03MB7273:EE_
x-ms-office365-filtering-correlation-id: 5b1d0827-00f8-46f8-d438-08db3ba073ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zQUakqcvCwF65m8IKsS+ihj1nBvJUJgm30uuPDY4di74TjDy+qptEGHuB3d6vCCpTWz+g5S7QobjWGyksc9Bi+BjYt+lANOsegsuMXt+mwlZYRMm8zZm4irenjT5XPBkVirYfJjKFisYfLtxKYwSB7T4/osa3Qj+PDBcZOUeRiZRQF62txgpJghWjQDU0qZTZhFr/ttXQbnt0gvNNHcpHxZfT6oN8HHe7Z8bgBd1+v4lJGJSO/YMKgx0Mnc5EAZfc7zHFsFMmQhy4eVow+XLUAPoXJyTJRAZaY19Fo0/JS4M2y3EFXyUnfXTrAK+9QEv/VKXRsoCm93aX/MmOOjV3b54r8+4mfSnwT7AmUyclynCL9AIyy8CnwHMkc26HMkuCsYkD1/G202rd5YY8i2KKNkmvkljKLYCH2HCmWMn9N/auKkxy5qlYDBEGyY0iD1sHZfuLXD+BR2dHsNV54GfJO7rUBGswKPHx9gvQIK3GLvxmEla0YDUswdtuGv8yC0mVwt40AX8Gfw9Dg1AUj8uFV0dxcbFwROCSAY/wA9TxeM7G1fzrZ0I9JWshe2MLeNL8Maj03zno+IPuF4QidBlZKt/y94JLpv4KEhSCEeHAnw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(316002)(54906003)(6916009)(4326008)(91956017)(76116006)(66946007)(66476007)(64756008)(966005)(66446008)(66556008)(6486002)(71200400001)(478600001)(5660300002)(8676002)(8936002)(41300700001)(7416002)(30864003)(36756003)(122000001)(2906002)(38070700005)(86362001)(38100700002)(83380400001)(2616005)(26005)(55236004)(6506007)(6512007)(186003)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZndaT3FhSXdBRUNiSHZoVThNcGY1WmM4SUZNZlJ6anE1aUlURitoRVoveTE3?=
 =?utf-8?B?TTdwT1RaY2tGMVdRQko0ZTNPWU9IODV6c3N2bm96UldkL2NLRWljM0hsb0Z6?=
 =?utf-8?B?VVA2MEJkL0UwNTVvWDJ6QVFyM0Q4TEQ1V1NwSjJKOHBNUHRHb0ZwY28wMldv?=
 =?utf-8?B?SXk2RmlrMnJERm05NUhwNUFVdi9CUW1mQnZmT2hTaHRFcENkMVIxV2pFdDJX?=
 =?utf-8?B?MjhMeGx6QmIvcDE4eGFKeWhUTXpHa1pEQXQ0VStPU0drb0JhVGFFUUp4MHJH?=
 =?utf-8?B?MzA0WWtnQWFkSUtJV2pWbm5ZaFZaRmsrUTNsUGdPSWEyWFVRNWkxT05yTXM5?=
 =?utf-8?B?S0RqbExlKzk2Z0cvWGJtV2NNT3c2TGVnQnIzSDlsd25xY2NPN2lXd053MXZM?=
 =?utf-8?B?cHpXamNmSExuZUkrdWxZME1uQ0dpcmk3di8wakhzQlNHS0FER2VDR2dkQlp0?=
 =?utf-8?B?V2RoUmxkanBQRm5aeDc4bUdjMmRBd1VkTUxwWWdEcldmcUpEamNndVlqL3o2?=
 =?utf-8?B?d3kzS1lHZ1Fsd24vczRUd2xxKzljQW05QTB2bVY4dE5Td2xGb3g3TFNCczNT?=
 =?utf-8?B?Ly9BRzlTVG5QOVNRNUZuSGJlL25Lamc2NG5ISEJja1kzdTdHUFNLY25FbHUx?=
 =?utf-8?B?NkNOMDJ5UG1CSUZhMlhieTg2VzNlSHNWQldFN2ZaSFBNdXBQY0lyS1p4WVRi?=
 =?utf-8?B?cGtBR2paS2syUEdBZWlMOWFla1gwUStxb0VTQUN2a0JpL1VzVFZ3MnViYXU3?=
 =?utf-8?B?cE5DSDJPK1FtYkNBcmdvSGRiYVlId1dLaVlNTEh4Umo4a3VGVzUwcGswVGlS?=
 =?utf-8?B?dzhMMmoxT3RPYStkUFlnMWJ2emYvakJCbkFGbmdSSU4rU2d3QVd5NFlxVEda?=
 =?utf-8?B?WEltZzFua1lPTjFvWS96WCt6dXF1TzhDR3JrS0I2dWlsbWJwUlNtZ01SeUpl?=
 =?utf-8?B?VTVDSVJHYTRDdmk1K21OMzhYSE1RVWd5eDVIMTFleFBubmdiRnAzL2xmZk1V?=
 =?utf-8?B?c0FnK3RsVnhxaUpiUm5NbUprSUpJR25mZk1UdGZ1KzdsTUY3YUkxOUNyTmx6?=
 =?utf-8?B?TjVQcnNRQm0zTG0yZmVKMncxcGhaKzBLVjljYVZ0eEo0OHBySGc4TytwdlhT?=
 =?utf-8?B?K09ySThSNExueWxGWGNEcy8vcTlRYjhWUnlKbHQ2Tml1bTVtNGc0akZBeGU2?=
 =?utf-8?B?TTJNVVBWREVBYzZNMnZjcHdxMzdUMXFlT2xUckFMSXRqTHR5NnZ3dkpBeUtv?=
 =?utf-8?B?MmpVN1ZlMnJmU1haWFpXK3ZlVWg2ZWkvRXdPTWJseUVadWRXYjkzYW5CQjAy?=
 =?utf-8?B?UXFhTlBEYVVPVWJrMGpEK1VkRWZBSjc0WVFEK1B6WGxqc2lLbGRPQUZTKzd5?=
 =?utf-8?B?Z2pyaXR4UFo2aHRpekt1Q01zcUdRdVlPaGdqZWZ0djFFNUZ3N083bHJGTWdM?=
 =?utf-8?B?WjByMWp6NjB6T1h5Qll1b0Q1THpKY3NJOUlIT29pVnZ2eWp6VGc5a3oyLzVl?=
 =?utf-8?B?Q2wwN2FwZC8zR29kQlRNVDdRQW02elloRHFHbDg2blJHblV4cUFHaU5kdU45?=
 =?utf-8?B?cWk2UWhodDNaQjZHODJZSW9LVis3OGsrS2xOWXRMQUJqMzhacm9VM0ZmTWx0?=
 =?utf-8?B?OHVOclZ6R3lIMjRiclNNTnNETTh6TG56Zml3ZGpHMktxSndKZTA0WjkwMk1t?=
 =?utf-8?B?d014SzQ0c2FMZ3c2MlgyZUJRY1d0Y1RCY3NIaW1YcWpTeUFoNmx0L3VwUmpQ?=
 =?utf-8?B?OWRiMWNFbkFOdnZpczZ0aGVhZDhYM1MvVjEweFl2TGhBUndtSEdrRk9rWG9I?=
 =?utf-8?B?TDc4TVc3MXdvcjNMMzFFeHVoZS9lcEp5c3NRbFIvdVpSdzVFZWZwRUlJWFAw?=
 =?utf-8?B?QXRGcnNVb05FTFdiMGRhQ2tZb3FRallMbXZYS2JiSVVtV0NjNmpOTTJ1UTBX?=
 =?utf-8?B?YUxhQytrWFl1RjZjcUJXanhHYkYwUjRTQ2dXZXVhYWdza0xGbjZWMVhyRlVH?=
 =?utf-8?B?bUkzTWE2dngzVGtZeU9IU2RYZ2NCQjJmQUZ5L1J3MGRVaTIybldJMmlKUnln?=
 =?utf-8?B?N0Rsenk4aXVES1ZVZFkvNG9QSVV6cm5pKzVhbmlZRFErem5kSHQ3WTdseG9O?=
 =?utf-8?B?M0g0eGg4Y2ZhNlpyUURPZ0ZTRkI4U29OQnp4Kzh3ODZieFlUckVYZHljR281?=
 =?utf-8?B?bXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7AA23B5AD2C5324CAAF5852778763AF9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b1d0827-00f8-46f8-d438-08db3ba073ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2023 21:54:12.6334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d7XdYb4w4kHdoLPzVQS+5pvrEmkQVfp0eCvkkd5nzwPWX0ryIg66R6kldTZ2w4j+1du62jEBI41nkyNpCyXTem/B/cB3kTQ21K/RlsVFVRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7273
X-Proofpoint-ORIG-GUID: o3vUuPCoyRd1aiAp6Zk_FFOMh1K8xJwC
X-Proofpoint-GUID: o3vUuPCoyRd1aiAp6Zk_FFOMh1K8xJwC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_12,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1011 bulkscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120186

DQpIaSBSb2dlciwNCg0KRmlyc3Qgb2YgYWxsLCBJIHdhbnQgdG8gcHJvdmlkZSBsaW5rIFsxXSB0
byB0aGUgUkZDIHNlcmllcyB3aGVyZSBJIHRyaWVkDQp0b3RhbCBQQ0kgbG9ja2luZyByZXdvcmsu
IEFmdGVyIGRpc2N1c3Npbmcgd2l0aCBKYW4sIGl0IGJlY2FtZSBjbGVhciBmb3INCm1lLCB0aGF0
IHRhc2sgaXMgbXVjaCBoYXJkZXIsIHRoYW4gSSBhbnRpY2lwYXRlZC4gU28sIGl0IHdhcyBkZWNp
ZGVkIHRvDQptb3ZlIHdpdGggYSBzbWFsbGVyIHN0ZXBzLiBGaXJzdCBzdGVwIGlzIHRvIG1ha2Ug
dlBDSSBjb2RlIGluZGVwZW5kZWQNCmZyb20gdGhlIGdsb2JhbCBQQ0kgbG9jay4gQWN0dWFsbHks
IHRoaXMgaXMgbm90IHRoZSBmaXJzdCB0cnkuDQpPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB0cmll
ZCB0byB1c2Ugci93IGxvY2sgZm9yIHRoaXM6IFsyXS4gQnV0LA0KSmFuIHN1Z2dlc3RlZCB0byB1
c2UgcmVmY291bnRpbmcgaW5zdGVhZCBvZiByL3cgbG9ja3MsIGFuZCBJIGxpa2VkIHRoZQ0KaWRl
YS4gU28sIHRoaXMgaXMgd2h5IHlvdSBhcmUgc2VlaW5nIHRoaXMgcGF0Y2ggc2VyaWVzLg0KDQoN
Cg0KUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyaXRlczoNCg0KPiBP
biBUdWUsIEFwciAxMSwgMjAyMyBhdCAxMTo0MTowNFBNICswMDAwLCBWb2xvZHlteXIgQmFiY2h1
ayB3cm90ZToNCj4+IA0KPj4gSGkgUm9nZXIsDQo+PiANCj4+IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPiB3cml0ZXM6DQo+PiANCj4+ID4gT24gVHVlLCBNYXIgMTQsIDIw
MjMgYXQgMDg6NTY6MjlQTSArMDAwMCwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+PiA+PiBQ
cmlvciB0byB0aGlzIGNoYW5nZSwgbGlmZXRpbWUgb2YgcGNpX2RldiBvYmplY3RzIHdhcyBwcm90
ZWN0ZWQgYnkgZ2xvYmFsDQo+PiA+PiBwY2lkZXZzX2xvY2soKS4gTG9uZy10ZXJtIHBsYW4gaXMg
dG8gcmVtb3ZlIHRoaXMgbG9nLCBzbyB3ZSBuZWVkIHNvbWUNCj4+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXiBsb2NrDQo+PiA+DQo+PiA+IEkg
d291bGRuJ3Qgc2F5IHJlbW92ZSwgYXMgb25lIHdheSBvciBhbm90aGVyIHdlIG5lZWQgYSBsb2Nr
IHRvIHByb3RlY3QNCj4+ID4gY29uY3VycmVudCBhY2Nlc3Nlcy4NCj4+ID4NCj4+IA0KPj4gSSds
bCB3cml0ZSAicmVwbGFjZSB0aGlzIGdsb2JhbCBsb2NrIHdpdGggY291cGxlIG9mIG1vcmUgZ3Jh
bnVsYXINCj4+IGxvY2tpbmcgZGV2aWNlcyINCj4+IGlmIHRoaXMgaXMgb2theSBmb3IgeW91Lg0K
Pj4gDQo+PiA+PiBvdGhlciBtZWNoYW5pc20gdG8gZW5zdXJlIHRoYXQgdGhvc2Ugb2JqZWN0cyB3
aWxsIG5vdCBkaXNhcHBlYXIgdW5kZXINCj4+ID4+IGZlZXQgb2YgY29kZSB0aGF0IGFjY2VzcyB0
aGVtLiBSZWZlcmVuY2UgY291bnRpbmcgaXMgYSBnb29kIGNob2ljZSBhcw0KPj4gPj4gaXQgcHJv
dmlkZXMgZWFzeSB0byBjb21wcmVoZW5kIHdheSB0byBjb250cm9sIG9iamVjdCBsaWZldGltZS4N
Cj4+ID4+IA0KPj4gPj4gVGhpcyBwYXRjaCBhZGRzIHR3byBuZXcgaGVscGVyIGZ1bmN0aW9uczog
cGNpZGV2X2dldCgpIGFuZA0KPj4gPj4gcGNpZGV2X3B1dCgpLiBwY2lkZXZfZ2V0KCkgd2lsbCBp
bmNyZWFzZSByZWZlcmVuY2UgY291bnRlciwgd2hpbGUNCj4+ID4+IHBjaWRldl9wdXQoKSB3aWxs
IGRlY3JlYXNlIGl0LCBkZXN0cm95aW5nIG9iamVjdCB3aGVuIGNvdW50ZXIgcmVhY2hlcw0KPj4g
Pj4gemVyby4NCj4+ID4+IA0KPj4gPj4gcGNpZGV2X2dldCgpIHNob3VsZCBiZSB1c2VkIG9ubHkg
d2hlbiB5b3UgYWxyZWFkeSBoYXZlIGEgdmFsaWQgcG9pbnRlcg0KPj4gPj4gdG8gdGhlIG9iamVj
dCBvciB5b3UgYXJlIGhvbGRpbmcgbG9jayB0aGF0IHByb3RlY3RzIG9uZSBvZiB0aGUNCj4+ID4+
IGxpc3RzIChkb21haW4sIHBzZWcgb3IgYXRzKSB0aGF0IHN0b3JlIHBjaV9kZXYgc3RydWN0cy4N
Cj4+ID4+IA0KPj4gPj4gcGNpZGV2X2dldCgpIGlzIHJhcmVseSB1c2VkIGRpcmVjdGx5LCBiZWNh
dXNlIHRoZXJlIGFscmVhZHkgYXJlDQo+PiA+PiBmdW5jdGlvbnMgdGhhdCB3aWxsIHByb3ZpZGUg
dmFsaWQgcG9pbnRlciB0byBwY2lfZGV2IHN0cnVjdDoNCj4+ID4+IHBjaV9nZXRfcGRldigpLCBw
Y2lfZ2V0X3JlYWxfcGRldigpLiBUaGV5IHdpbGwgbG9jayBhcHByb3ByaWF0ZSBsaXN0LA0KPj4g
Pj4gZmluZCBuZWVkZWQgb2JqZWN0IGFuZCBpbmNyZWFzZSBpdHMgcmVmZXJlbmNlIGNvdW50ZXIg
YmVmb3JlIHJldHVybmluZw0KPj4gPj4gdG8gdGhlIGNhbGxlci4NCj4+ID4+IA0KPj4gPj4gTmF0
dXJhbGx5LCBwY2lfcHV0KCkgc2hvdWxkIGJlIGNhbGxlZCBhZnRlciBmaW5pc2hpbmcgd29ya2lu
ZyB3aXRoIGENCj4+ID4+IHJlY2VpdmVkIG9iamVjdC4gVGhpcyBpcyB0aGUgcmVhc29uIHdoeSB0
aGlzIHBhdGNoIGhhdmUgc28gbWFueQ0KPj4gPj4gcGNpZGV2X3B1dCgpcyBhbmQgc28gbGl0dGxl
IHBjaWRldl9nZXQoKXM6IGV4aXN0aW5nIGNhbGxzIHRvDQo+PiA+PiBwY2lfZ2V0XyooKSBmdW5j
dGlvbnMgbm93IHdpbGwgaW5jcmVhc2UgcmVmZXJlbmNlIGNvdW50ZXINCj4+ID4+IGF1dG9tYXRp
Y2FsbHksIHdlIGp1c3QgbmVlZCB0byBkZWNyZWFzZSBpdCBiYWNrIHdoZW4gd2UgZmluaXNoZWQu
DQo+PiA+DQo+PiA+IEFmdGVyIGxvb2tpbmcgYSBiaXQgaW50byB0aGlzLCBJIHdvdWxkIGxpa2Ug
dG8gYXNrIHdoZXRoZXIgaXQncyBiZWVuDQo+PiA+IGNvbnNpZGVyZWQgdGhlIG5lZWQgdG8gaW5j
cmVhc2UgdGhlIHJlZmNvdW50IGZvciBlYWNoIHVzZSBvZiBhIHBkZXYuDQo+PiA+DQo+PiANCj4+
IFRoaXMgaXMgaG93IExpbnV4IHVzZXMgcmVmZXJlbmNlIGxvY2tpbmcuIEl0IGRlY3JlYXNlcyBj
b2duaXRpdmUgbG9hZA0KPj4gYW5kIGNoYW5jZSBmb3IgYW4gZXJyb3IsIGFzIHRoZXJlIGlzIGEg
c2ltcGxlIHNldCBvZiBydWxlcywgd2hpY2ggeW91DQo+PiBmb2xsb3cuDQo+PiANCj4+ID4gRm9y
IGV4YW1wbGUgSSB3b3VsZCBjb25zaWRlciB0aGUgaW5pdGlhbCBhbGxvY19wZGV2KCkgdG8gdGFr
ZSBhDQo+PiA+IHJlZmNvdW50LCBhbmQgdGhlbiBwY2lfcmVtb3ZlX2RldmljZSgpIF9tdXN0XyBi
ZSB0aGUgZnVuY3Rpb24gdGhhdA0KPj4gPiByZW1vdmVzIHRoZSBsYXN0IHJlZmNvdW50LCBzbyB0
aGF0IGl0IGNhbiByZXR1cm4gLUVCVVNZIG90aGVyd2lzZSAoc2VlDQo+PiA+IG15IGNvbW1lbnQg
YmVsb3cpLg0KPj4gDQo+PiBJIHRlbmQgdG8gZGlzYWdyZWUgdGhlcmUsIGFzIHRoaXMgcnVpbnMg
dGhlIHZlcnkgaWRlYSBvZiByZWZlcmVuY2UNCj4+IGNvdW50aW5nLiBXZSBjYW4ndCBrbm93IHdo
byBlbHNlIGhvbGRzIHJlZmVyZW5jZSByaWdodCBub3cuIE9rYXksIHdlDQo+PiBtaWdodCBrbm93
LCBidXQgdGhpcyByZXF1aXJlcyBhZGRpdGlvbmFsIGxvY2sgdG8gc2VyaWFsaXplDQo+PiBhY2Nl
c3Nlcy4gV2hpY2gsIGluIHR1cm4sIG1ha2VzIHJlZmNvdW50IHVuLW5lZWRlZC4NCj4NCj4gSW4g
cHJpbmNpcGxlIHBjaV9yZW1vdmVfZGV2aWNlKCkgbXVzdCByZXBvcnQgd2hldGhlciB0aGUgZGV2
aWNlIGlzDQo+IHJlYWR5IHRvIGJlIHBoeXNpY2FsbHkgcmVtb3ZlZCBmcm9tIHRoZSBzeXN0ZW0s
IHNvIGl0IG11c3QgcmV0dXJuDQo+IC1FQlVTWSBpZiB0aGVyZSBhcmUgc3RpbGwgdXNlcnMgYWNj
ZXNzaW5nIHRoZSBkZXZpY2UuDQo+DQo+IEEgdXNlciB3b3VsZCB1c2UgUEhZU0RFVk9QX21hbmFn
ZV9wY2lfcmVtb3ZlIHRvIHNpZ25hbCBYZW4gaXQncyB0cnlpbmcNCj4gdG8gcGh5c2ljYWxseSBy
ZW1vdmUgYSBQQ0kgZGV2aWNlIGZyb20gYSBzeXN0ZW0sIHNvIHdlIG11c3QgZW5zdXJlDQo+IHRo
YXQgd2hlbiB0aGUgaHlwZXJ2aXNvciByZXR1cm5zIHN1Y2Nlc3MgdGhlIGRldmljZSBpcyByZWFk
eSB0byBiZQ0KPiBwaHlzaWNhbGx5IHJlbW92ZWQuDQo+DQo+IE9yIGF0IGxlYXN0IHRoYXQncyBt
eSB1bmRlcnN0YW5kaW5nIG9mIGhvdyB0aGlzIHNob3VsZCB3b3JrLg0KPg0KDQpBcyBJIGNhbiBz
ZWUsIHRoaXMgaXMgbm90IGhvdyBpdCBpcyBpbXBsZW1lbnRlZCByaWdodA0Kbm93LiBwY2lfcmVt
b3ZlX2RldmljZSgpIGlzIG5vdCBjaGVja2luZyBpZiBkZXZpY2UgaXMgbm90IGFzc2lnbmVkIHRv
IGENCmRvbWFpbi4gSWQgZG9lcyBub3QgY2hlY2sgaWYgdGhlcmUgYXJlIHN0aWxsIHVzZXJzIGFj
Y2Vzc2luZyB0aGUNCmRldmljZS4gSXQganVzdCByZWxpZXMgb24gYSB0aGUgZ2xvYmFsIFBDSSBs
b2NrIHRvIGVuc3VyZSB0aGF0IGRldmljZSBpcw0KcmVtb3ZlZCBpbiBhbiBvcmRlcmx5IG1hbm5l
ci4NCg0KTXkgcGF0Y2ggc2VyaWVzIGhhcyBubyBpbnRlbnRpb24gdG8gY2hhbmdlIHRoaXMgYmVo
YXZpb3IuIEFsbCB3aGF0IEkNCndhbnQgdG8gYWNoaWV2ZSAtIGlzIHRvIGFsbG93IHZwY2kgY29k
ZSBhY2Nlc3Mgc3RydWN0IHBkZXYgb2JqZWN0cw0Kd2l0aG91dCBob2xkaW5nIHRoZSBnbG9iYWwg
UENJIGxvY2suIA0KDQo+PiA+DQo+PiA+IEkgd291bGQgYWxzbyB0aGluayB0aGF0IGhhdmluZyB0
aGUgZGV2aWNlIGFzc2lnbmVkIHRvIGEgZ3Vlc3Qgd2lsbCB0YWtlDQo+PiA+IGFub3RoZXIgcmVm
Y291bnQsIGFuZCB0aGVuIGFueSB1c2FnZSBmcm9tIGZ1cnRoZXIgY2FsbGVycyAoaWU6IGxpa2UN
Cj4+ID4gdnBjaSkgd2lsbCBuZWVkIHNvbWUga2luZCBvZiBwcm90ZWN0aW9uIGZyb20gcHJldmVu
dGluZyB0aGUgZGV2aWNlDQo+PiA+IGZyb20gYmVpbmcgZGVhc3NpZ25lZCBmcm9tIGEgZG9tYWlu
IHdoaWxlIHZQQ0kgaGFuZGxlcnMgYXJlIHJ1bm5pbmcsDQo+PiA+IGFuZCB0aGUgY3VycmVudCBy
ZWZjb3VudCB3b24ndCBoZWxwIHdpdGggdGhhdC4NCj4+IA0KPj4gWWVzLCBpZGVhIG9mIHRoaXMg
cmVmY291bnRpbmcgaXMgdG8gZW5zdXJlIHRoYXQgYSBwZGV2IG9iamVjdCBleGlzdHMgYXMgYW4N
Cj4+IHZhbGlkIG9iamVjdCBpbiBtZW1vcnkgaWYgd2UgYXJlIGhvbGRpbmcgYSBsb25nLXRlcm0g
cG9pbnRlciB0bw0KPj4gaXQuIEluZGVlZCwgdlBDSSBoYW5kbGVycyBzaG91bGQgdXNlIHNvbWUg
b3RoZXIgbWVjaGFuaXNtIHRvIGVuc3VyZSB0aGF0DQo+PiBwZGV2IGlzIG5vdCBiZWluZyByZS1h
c3NpZ25lZCB3aGlsZSBoYW5kbGVycyBhcmUgcnVubmluZy4gSSBiZWxpZXZlLA0KPj4gdGhpcyBp
cyB0aGUgdGFzayBvZiB2cGNpLT5sb2NrLiBTaG91bGQgd2UgY2FsbA0KPj4gdnBjaV9yZW1vdmVf
ZGV2aWNlL3ZwY2lfYWRkX2hhbmRsZXJzIGVhY2ggdGltZSB3ZSByZS1hc3NpZ24gYSBQQ0kgZGV2
aWNlPw0KPg0KPiBZZXMsIEkgdGhpbmsgdGhpcyB3YXMgYWxzbyBwYXJ0IG9mIGEgY29tbWVudCBJ
J3ZlIG1hZGUgb24gYSBkaWZmZXJlbnQNCj4gcGF0Y2guICBUaGUgZGV2aWNlIHN0YXRlIG5lZWRz
IHRvIGJlIGNsZWFyZWQgd2hlbiBhc3NpZ25lZCB0byBhDQo+IGRpZmZlcmVudCBndWVzdCAoYXMg
dGhlIGhhcmR3YXJlIGRvbWFpbiB3aWxsIGFsc28gcGVyZm9ybSBhIGRldmljZQ0KPiByZXNldCku
DQo+DQo+IEkgdGhpbmsgdGhlcmUgYXJlIHNvbWUgcG9pbnRzIHRoYXQgbmVlZHMgdG8gYmUgcGFy
dCBvZiB0aGUgY29tbWl0DQo+IG1lc3NhZ2Ugc28gdGhlIGNvZGUgY2FuIGJlIHByb3Blcmx5IGV2
YWx1YXRlZDoNCj4NCj4gIC0gVGhlIHJlZmVyZW5jZSBjb3VudGluZyBpcyBvbmx5IHVzZWQgdG8g
ZW5zdXJlIHRoZSBvYmplY3QgY2Fubm90IGJlDQo+ICAgIHJlbW92ZWQgd2hpbGUgaW4gdXNlLiAg
VXNlcnMgb2YgdGhlIHBjaSBkZXZpY2Ugb2JqZWN0IHNob3VsZA0KPiAgICBpbXBsZW1lbnQgd2hh
dGV2ZXIgcHJvdGVjdGlvbnMgcmVxdWlyZWQgaW4gb3JkZXIgdG8gZ2V0IG11dHVhbA0KPiAgICBl
eGNsdXNpb24gYmV0d2VlbiB0aGVtIGFuZCBkZXZpY2Ugc3RhdGUgY2hhbmdlcy4NCj4NCg0KU3Vy
ZSwgSSB3aWxsIGFkZCB0aGlzLg0KDQo+PiA+DQo+PiA+IFRoYXQgbWFrZXMgbWUgd29uZGVyIGlm
IGZvciBleGFtcGxlIGNhbGxlcnMgb2YgcGNpX2dldF9wZGV2KGQsIHNiZGYpDQo+PiA+IGRvIG5l
ZWQgdG8gdGFrZSBhbiBleHRyYSByZWZjb3VudCwgYmVjYXVzZSBzdWNoIGFjY2VzcyBpcyBhbHJl
YWR5DQo+PiA+IHByb3RlY3RlZCBmcm9tIHRoZSBwZGV2IGdvaW5nIGF3YXkgYnkgdGhlIGZhY3Qg
dGhhdCB0aGUgZGV2aWNlIGlzDQo+PiA+IGFzc2lnbmVkIHRvIGEgZ3Vlc3QuICBCdXQgbWF5YmUg
aXQncyB0b28gbXVjaCB3b3JrIHRvIHNlcGFyYXRlIHVzZXJzDQo+PiA+IG9mIHBjaV9nZXRfcGRl
dihkLCAuLi4pOyB2cyBwY2lfZ2V0X3BkZXYoTlVMTCwgLi4uKTsuDQo+PiA+DQo+PiA+IFRoZXJl
J3MgYWxzbyBhIHdpbmRvdyB3aGVuIHRoZSByZWZjb3VudCBpcyBkcm9wcGVkIHRvIDAsIGFuZCB0
aGUNCj4+ID4gZGVzdHJ1Y3Rpb24gZnVuY3Rpb24gaXMgY2FsbGVkLCBidXQgYXQgdGhlIHNhbWUg
dGltZSBhIGNvbmN1cnJlbnQNCj4+ID4gdGhyZWFkIGNvdWxkIGF0dGVtcHQgdG8gdGFrZSBhIHJl
ZmVyZW5jZSB0byB0aGUgcGRldiBzdGlsbD8NCj4+IA0KPj4gTGFzdCBwY2lkZXZfcHV0KCkgd291
bGQgYmUgY2FsbGVkIGJ5IHBjaV9yZW1vdmVfZGV2aWNlKCksIGFmdGVyIHJlbW92aW5nDQo+PiBp
dCBmcm9tIGFsbCBsaXN0cy4gVGhpcyBzaG91bGQgcHJldmVudCBvdGhlciB0aHJlYWRzIGZyb20g
b2J0YWluaW5nIGEgdmFsaWQNCj4+IHJlZmVyZW5jZSB0byB0aGUgcGRldi4NCj4NCj4gV2hhdCBp
ZiBhIGNvbmN1cnJlbnQgdXNlciBoYXMgdGFrZW4gYSByZWZlcmVuY2UgdG8gdGhlIG9iamVjdCBi
ZWZvcmUNCj4gcGNpX3JlbW92ZV9kZXZpY2UoKSBoYXMgcmVtb3ZlZCB0aGUgZGV2aWNlIGZyb20g
dGhlIGxpc3RzLCBhbmQgc3RpbGwNCj4gaG9sZHMgaXQgd2hlbiBwY2lfcmVtb3ZlX2RldmljZSgp
IHBlcmZvcm1zIHRoZSBzdXBwb3NlZGx5IGxhc3QNCj4gcGNpZGV2X3B1dCgpIGNhbGw/DQoNCldl
bGwsIGxldCdzIGNvbnNpZGVyIFZQQ0kgY29kZSBhcyB0aGlzIGNvbmN1cnJlbnQgdXNlciwgZm9y
DQpleGFtcGxlLiBGaXJzdCwgaXQgd2lsbCB0cnkgdG8gdGFrZSB2cGNpLT5sb2NrLiBEZXBlbmRp
bmcgb24gd2hlcmUgaW4NCnBjaV9yZW1vdl9kZXZpY2UoKSB0aGVyZSB3aWxsIGJlIHRocmVlIGNh
c2VzOg0KDQoxLiBMb2NrIGlzIHRha2VuIGJlZm9yZSB2cGNpX3JlbW92ZV9kZXZpY2UoKSB0YWtl
cyB0aGUgbG9jay4gSW4gdGhpcw0KY2FzZSB2cGNpIGNvZGUgd29ya3MgYXMgYWx3YXlzDQoNCjIu
IEl0IHRyaWVzIHRvIHRha2UgdGhlIGxvY2sgd2hlbiB2cGNpX3JlbW92ZV9kZXZpY2UoKSBpcyBh
bHJlYWR5IGxvY2tlZA0KdGhpcy4gSW4gdGhpcyBjYXNlIHdlIGFyZSBmYWxsaW5nIHRvIHRoZSBu
ZXh0IGNhc2U6DQoNCjMuIExvY2sgaXMgdGFrZW4gYWZ0ZXIgdnBjaV9yZW1vdmVfZGV2aWNlKCkg
aGFkIGZpbmlzaGVkIGl0J3Mgd29yay4gSW4gdGhpcw0KY2FzZSB2UENJIGNvZGUgc2VlcyB0aGF0
IGl0IHdhcyBjYWxsZWQgZm9yIGEgZGV2aWNlIGluIGFuIGludmFsaWQgc3RhdGUNCmFuZCBleGl0
cy4NCg0KQXMgeW91IGNhbiBzZWUsIHRoZXJlIGlzIG5vIGNhc2Ugd2hlcmUgdlBDSSBjb2RlIGlz
IHJ1bm5pbmcgb24gYW4gZGV2aWNlDQp3aGljaCB3YXMgcmVtb3ZlZC4NCg0KQWZ0ZXIgdlBDSSBj
b2RlIGRyb3BzIHJlZmNvdW50ZXIsIHBkZXYgb2JqZWN0IHdpbGwgYmUgZnJlZWQgb25jZSBhbmQg
Zm9yDQphbGwuIFBsZWFzZSBub2RlLCB0aGF0IEkgYW0gdGFsa2luZyBhYm91dCBwZGV2IG9iamVj
dCB0aGVyZSwgbm90IGFib3V0DQpQQ0kgZGV2aWNlLCBiZWNhdXNlIFBDSSBkZXZpY2UgKGFzIGEg
aGlnaC1sZXZlbCBlbnRpdHkpIHdhcyBkZXN0cm95ZWQgYnkNCnBjaV9yZW1vdmVfZGV2aWNlKCku
IHJlZmNvdW50IGlzIG5lZWRlZCBqdXN0IGZvciB0aGUgbGFzdCBjbGVhbi11cA0Kb3BlcmF0aW9u
cy4NCg0KPg0KPj4gPg0KPj4gPj4gICAgICAgICAgc2JkZi5kZXZmbiAmPSB+c3RyaWRlOw0KPj4g
Pj4gICAgICAgICAgcGRldiA9IHBjaV9nZXRfcGRldihOVUxMLCBzYmRmKTsNCj4+ID4+ICAgICAg
ICAgIGlmICggcGRldiAmJiBzdHJpZGUgIT0gcGRldi0+cGhhbnRvbV9zdHJpZGUgKQ0KPj4gPj4g
KyAgICAgICAgew0KPj4gPj4gKyAgICAgICAgICAgIHBjaWRldl9wdXQocGRldik7DQo+PiA+PiAg
ICAgICAgICAgICAgcGRldiA9IE5VTEw7DQo+PiA+PiArICAgICAgICB9DQo+PiA+PiAgICAgIH0N
Cj4+ID4+ICANCj4+ID4+ICAgICAgcmV0dXJuIHBkZXY7DQo+PiA+PiBAQCAtNTQ4LDEzICs1MjYs
MTggQEAgc3RydWN0IHBjaV9kZXYgKnBjaV9nZXRfcGRldihjb25zdCBzdHJ1Y3QgZG9tYWluICpk
LCBwY2lfc2JkZl90IHNiZGYpDQo+PiA+PiAgICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5ICgg
cGRldiwgJnBzZWctPmFsbGRldnNfbGlzdCwgYWxsZGV2c19saXN0ICkNCj4+ID4+ICAgICAgICAg
ICAgICBpZiAoIHBkZXYtPnNiZGYuYmRmID09IHNiZGYuYmRmICYmDQo+PiA+PiAgICAgICAgICAg
ICAgICAgICAoIWQgfHwgcGRldi0+ZG9tYWluID09IGQpICkNCj4+ID4+ICsgICAgICAgICAgICB7
DQo+PiA+PiArICAgICAgICAgICAgICAgIHBjaWRldl9nZXQocGRldik7DQo+PiA+PiAgICAgICAg
ICAgICAgICAgIHJldHVybiBwZGV2Ow0KPj4gPj4gKyAgICAgICAgICAgIH0NCj4+ID4+ICAgICAg
fQ0KPj4gPj4gICAgICBlbHNlDQo+PiA+PiAgICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5ICgg
cGRldiwgJmQtPnBkZXZfbGlzdCwgZG9tYWluX2xpc3QgKQ0KPj4gPj4gICAgICAgICAgICAgIGlm
ICggcGRldi0+c2JkZi5iZGYgPT0gc2JkZi5iZGYgKQ0KPj4gPj4gKyAgICAgICAgICAgIHsNCj4+
ID4+ICsgICAgICAgICAgICAgICAgcGNpZGV2X2dldChwZGV2KTsNCj4+ID4+ICAgICAgICAgICAg
ICAgICAgcmV0dXJuIHBkZXY7DQo+PiA+PiAtDQo+PiA+PiArICAgICAgICAgICAgfQ0KPj4gPj4g
ICAgICByZXR1cm4gTlVMTDsNCj4+ID4+ICB9DQo+PiA+PiAgDQo+PiA+PiBAQCAtNjYzLDcgKzY0
NiwxMCBAQCBpbnQgcGNpX2FkZF9kZXZpY2UodTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbiwNCj4+
ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX1NCREYoc2VnLCBpbmZvLT5waHlz
Zm4uYnVzLA0KPj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbmZv
LT5waHlzZm4uZGV2Zm4pKTsNCj4+ID4+ICAgICAgICAgIGlmICggcGRldiApDQo+PiA+PiArICAg
ICAgICB7DQo+PiA+PiAgICAgICAgICAgICAgcGZfaXNfZXh0Zm4gPSBwZGV2LT5pbmZvLmlzX2V4
dGZuOw0KPj4gPj4gKyAgICAgICAgICAgIHBjaWRldl9wdXQocGRldik7DQo+PiA+PiArICAgICAg
ICB9DQo+PiA+PiAgICAgICAgICBwY2lkZXZzX3VubG9jaygpOw0KPj4gPj4gICAgICAgICAgaWYg
KCAhcGRldiApDQo+PiA+PiAgICAgICAgICAgICAgcGNpX2FkZF9kZXZpY2Uoc2VnLCBpbmZvLT5w
aHlzZm4uYnVzLCBpbmZvLT5waHlzZm4uZGV2Zm4sDQo+PiA+PiBAQCAtODE4LDcgKzgwNCw5IEBA
IGludCBwY2lfcmVtb3ZlX2RldmljZSh1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuKQ0KPj4gPj4g
ICAgICAgICAgICAgIGlmICggcGRldi0+ZG9tYWluICkNCj4+ID4+ICAgICAgICAgICAgICAgICAg
bGlzdF9kZWwoJnBkZXYtPmRvbWFpbl9saXN0KTsNCj4+ID4+ICAgICAgICAgICAgICBwcmludGso
WEVOTE9HX0RFQlVHICJQQ0kgcmVtb3ZlIGRldmljZSAlcHBcbiIsICZwZGV2LT5zYmRmKTsNCj4+
ID4+IC0gICAgICAgICAgICBmcmVlX3BkZXYocHNlZywgcGRldik7DQo+PiA+PiArICAgICAgICAg
ICAgbGlzdF9kZWwoJnBkZXYtPmFsbGRldnNfbGlzdCk7DQo+PiA+PiArICAgICAgICAgICAgcGRl
dl9tc2lfZGVpbml0KHBkZXYpOw0KPj4gPj4gKyAgICAgICAgICAgIHBjaWRldl9wdXQocGRldik7
DQo+PiA+DQo+PiA+IEhtLCBJIHRoaW5rIGhlcmUgd2Ugd2FudCB0byBtYWtlIHN1cmUgdGhhdCB0
aGUgZGV2aWNlIGhhcyBiZWVuIGZyZWVkLA0KPj4gPiBvciBlbHNlIHlvdSB3b3VsZCBoYXZlIHRv
IHJldHVybiAtRUJVU1kgdG8gdGhlIGNhbGxzIHRvIG5vdGlmeSB0aGF0DQo+PiA+IHRoZSBkZXZp
Y2UgaXMgc3RpbGwgaW4gdXNlLg0KPj4gDQo+PiBXaHk/IEFzIEkgY2FuIHNlZSwgcGRldiBvYmpl
Y3QgaXMgc3RpbGwgbWF5IHBvdGVudGlhbGx5IGJlIGFjY2Vzc2VkIGJ5DQo+PiBzb21lIG90aGVy
IENQVSByaWdodCBub3cuIFNvIHBkZXYgb2JqZWN0IHdpbGwgYmUgZnJlZWQgYWZ0ZXIgbGFzdA0K
Pj4gcmVmZXJlbmNlIGlzIGRyb3BwZWQuIEFzIGl0IGlzIGFscmVhZHkgcmVtb3ZlZCBmcm9tIGFs
bCB0aGUgbGlzdHMsDQo+PiBwY2lfZGV2X2dldCgpIHdpbGwgbm90IGZpbmQgaXQgYW55bW9yZS4N
Cj4+IA0KPj4gQWN0dWFsbHksIEkgY2FuJ3Qgc2VlIGhvdyB0aGlzIGNhbiBoYXBwZW4gaW4gcmVh
bGl0eSwgYXMgVlBDSSwgTVNJIGFuZA0KPj4gSU9NTVUgYXJlIGFscmVhZHkgZGVhY3RpdmF0ZWQg
Zm9yIHRoaXMgZGV2aWNlLiBTbywgbm8gb25lIHdvdWxkIHRvdWNoIGl0Lg0KPg0KPiBXb3VsZG4n
dCBpdCBiZSBwb3NzaWJsZSBmb3IgYSBjb25jdXJyZW50IHVzZXIgdG8gaG9sZCBhIHJlZmVyZW5j
ZSBmcm9tDQo+IGJlZm9lIHRoZSBkZXZpY2UgaGFzIGJlZW4gJ2RlYWN0aXZhdGVkJz8NCj4NCg0K
WWVzLCBpdCBjYW4gaG9sZCBhIHJlZmVyZW5jZS4gVGhpcyBpcyB3aHkgd2UgbmVlZCBhZGRpdGlv
bmFsIGxvY2tpbmcgdG8NCmVuc3VyZSB0aGF0LCBzYXksIHBjaV9jbGVhbnVwX21zaSgpIGRvZXMg
bm90IHJhY2VzIHdpdGggcmVzdCBvZiB0aGUgTVNJDQpjb2RlLiBSaWdodCBub3cgdGhpcyBpcyBl
bnN1cmVkIGJ5IHRoZW4gZ2xvYmFsIFBDSSBsb2NrLg0KDQo+PiA+DQo+PiA+IEkgdGhpbmsgd2Ug
bmVlZCBhbiBleHRyYSBwY2lkZXZfcHV0X2ZpbmFsKCkgb3Igc2ltaWxhciB0aGF0IGNhbiBiZQ0K
Pj4gPiB1c2VkIGluIHBjaV9yZW1vdmVfZGV2aWNlKCkgdG8gYXNzZXJ0IHRoYXQgdGhlIGRldmlj
ZSBoYXMgYmVlbg0KPj4gPiBhY3R1YWxseSByZW1vdmVkLg0KPj4gDQo+PiBXaWxsIHNvbWV0aGlu
ZyBicmVhayBpZiB3ZSBkb24ndCBkbyB0aGlzPyBJIGNhbid0IHNlZSBob3cgdGhpcyBjYW4NCj4+
IGhhcHBlbi4NCj4NCj4gQXMgbWVudGlvbmVkIGFib3ZlLCBvbmNlIHBjaV9yZW1vdmVfZGV2aWNl
KCkgcmV0dXJucyAwIHRoZSBhZG1pbg0KPiBzaG91bGQgYmUgY2FwYWJsZSBvZiBwaHlzaWNhbGx5
IHJlbW92aW5nIHRoZSBkZXZpY2UgZnJvbSB0aGUgc3lzdGVtLg0KPg0KDQpUaGlzIHBhdGNoIHNl
cmllcyBkb2VzIG5vdCBhbHRlciB0aGlzIHJlcXVpcmVtZW50LiBBZG1pbiBpcyBzdGlsbA0KY2Fw
YWJsZSBvZiBwaHlzaWNhbGx5IHJlbW92aW5nIHRoZSBkZXZpY2UgZnJvbSB0aGUgc3lzdGVtLiBB
ZnRlcg0Kc3VjY2Vzc2Z1bCBjYWxsIHRvIHRoZSBwY2lfcmVtb3ZlX2RldmljZSgpDQoNCj4+ID4N
Cj4+ID4+ICAgICAgICAgICAgICBicmVhazsNCj4+ID4+ICAgICAgICAgIH0NCj4+ID4+ICANCj4+
ID4+IEBAIC04NDgsNyArODM2LDcgQEAgc3RhdGljIGludCBkZWFzc2lnbl9kZXZpY2Uoc3RydWN0
IGRvbWFpbiAqZCwgdWludDE2X3Qgc2VnLCB1aW50OF90IGJ1cywNCj4+ID4+ICAgICAgew0KPj4g
Pj4gICAgICAgICAgcmV0ID0gaW9tbXVfcXVhcmFudGluZV9kZXZfaW5pdChwY2lfdG9fZGV2KHBk
ZXYpKTsNCj4+ID4+ICAgICAgICAgIGlmICggcmV0ICkNCj4+ID4+IC0gICAgICAgICAgIHJldHVy
biByZXQ7DQo+PiA+PiArICAgICAgICAgICAgZ290byBvdXQ7DQo+PiA+PiAgDQo+PiA+PiAgICAg
ICAgICB0YXJnZXQgPSBkb21faW87DQo+PiA+PiAgICAgIH0NCj4+ID4+IEBAIC04NzgsNiArODY2
LDcgQEAgc3RhdGljIGludCBkZWFzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgdWludDE2
X3Qgc2VnLCB1aW50OF90IGJ1cywNCj4+ID4+ICAgICAgcGRldi0+ZmF1bHQuY291bnQgPSAwOw0K
Pj4gPj4gIA0KPj4gPj4gICBvdXQ6DQo+PiA+PiArICAgIHBjaWRldl9wdXQocGRldik7DQo+PiA+
PiAgICAgIGlmICggcmV0ICkNCj4+ID4+ICAgICAgICAgIHByaW50ayhYRU5MT0dfR19FUlIgIiVw
ZDogZGVhc3NpZ24gKCVwcCkgZmFpbGVkICglZClcbiIsDQo+PiA+PiAgICAgICAgICAgICAgICAg
ZCwgJlBDSV9TQkRGKHNlZywgYnVzLCBkZXZmbiksIHJldCk7DQo+PiA+PiBAQCAtMTAxMSw3ICsx
MDAwLDEwIEBAIHZvaWQgcGNpX2NoZWNrX2Rpc2FibGVfZGV2aWNlKHUxNiBzZWcsIHU4IGJ1cywg
dTggZGV2Zm4pDQo+PiA+PiAgICAgICAgICAgICAgcGRldi0+ZmF1bHQuY291bnQgPj49IDE7DQo+
PiA+PiAgICAgICAgICBwZGV2LT5mYXVsdC50aW1lID0gbm93Ow0KPj4gPj4gICAgICAgICAgaWYg
KCArK3BkZXYtPmZhdWx0LmNvdW50IDwgUFRfRkFVTFRfVEhSRVNIT0xEICkNCj4+ID4+ICsgICAg
ICAgIHsNCj4+ID4+ICsgICAgICAgICAgICBwY2lkZXZfcHV0KHBkZXYpOw0KPj4gPj4gICAgICAg
ICAgICAgIHBkZXYgPSBOVUxMOw0KPj4gPj4gKyAgICAgICAgfQ0KPj4gPj4gICAgICB9DQo+PiA+
PiAgICAgIHBjaWRldnNfdW5sb2NrKCk7DQo+PiA+PiAgDQo+PiA+PiBAQCAtMTAyMiw2ICsxMDE0
LDggQEAgdm9pZCBwY2lfY2hlY2tfZGlzYWJsZV9kZXZpY2UodTE2IHNlZywgdTggYnVzLCB1OCBk
ZXZmbikNCj4+ID4+ICAgICAgICogY29udHJvbCBpdCBmb3IgdXMuICovDQo+PiA+PiAgICAgIGN3
b3JkID0gcGNpX2NvbmZfcmVhZDE2KHBkZXYtPnNiZGYsIFBDSV9DT01NQU5EKTsNCj4+ID4+ICAg
ICAgcGNpX2NvbmZfd3JpdGUxNihwZGV2LT5zYmRmLCBQQ0lfQ09NTUFORCwgY3dvcmQgJiB+UENJ
X0NPTU1BTkRfTUFTVEVSKTsNCj4+ID4+ICsNCj4+ID4+ICsgICAgcGNpZGV2X3B1dChwZGV2KTsN
Cj4+ID4+ICB9DQo+PiA+PiAgDQo+PiA+PiAgLyoNCj4+ID4+IEBAIC0xMTM4LDYgKzExMzIsNyBA
QCBzdGF0aWMgaW50IF9faHdkb21faW5pdCBjZl9jaGVjayBfc2V0dXBfaHdkb21fcGNpX2Rldmlj
ZXMoDQo+PiA+PiAgICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiRG9tJWQg
b3duaW5nICVwcD9cbiIsDQo+PiA+PiAgICAgICAgICAgICAgICAgICAgICAgICBwZGV2LT5kb21h
aW4tPmRvbWFpbl9pZCwgJnBkZXYtPnNiZGYpOw0KPj4gPj4gIA0KPj4gPj4gKyAgICAgICAgICAg
IHBjaWRldl9wdXQocGRldik7DQo+PiA+PiAgICAgICAgICAgICAgaWYgKCBpb21tdV92ZXJib3Nl
ICkNCj4+ID4+ICAgICAgICAgICAgICB7DQo+PiA+PiAgICAgICAgICAgICAgICAgIHBjaWRldnNf
dW5sb2NrKCk7DQo+PiA+PiBAQCAtMTM4NSwzMyArMTM4MCwyOCBAQCBzdGF0aWMgaW50IGlvbW11
X3JlbW92ZV9kZXZpY2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiA+PiAgICAgIHJldHVybiBp
b21tdV9jYWxsKGhkLT5wbGF0Zm9ybV9vcHMsIHJlbW92ZV9kZXZpY2UsIGRldmZuLCBwY2lfdG9f
ZGV2KHBkZXYpKTsNCj4+ID4+ICB9DQo+PiA+PiAgDQo+PiA+PiAtc3RhdGljIGludCBkZXZpY2Vf
YXNzaWduZWQodTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbikNCj4+ID4+ICtzdGF0aWMgaW50IGRl
dmljZV9hc3NpZ25lZChzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ID4+ICB7DQo+PiA+PiAtICAg
IHN0cnVjdCBwY2lfZGV2ICpwZGV2Ow0KPj4gPj4gICAgICBpbnQgcmMgPSAwOw0KPj4gPj4gIA0K
Pj4gPj4gICAgICBBU1NFUlQocGNpZGV2c19sb2NrZWQoKSk7DQo+PiA+PiAtICAgIHBkZXYgPSBw
Y2lfZ2V0X3BkZXYoTlVMTCwgUENJX1NCREYoc2VnLCBidXMsIGRldmZuKSk7DQo+PiA+PiAtDQo+
PiA+PiAtICAgIGlmICggIXBkZXYgKQ0KPj4gPj4gLSAgICAgICAgcmMgPSAtRU5PREVWOw0KPj4g
Pj4gICAgICAvKg0KPj4gPj4gICAgICAgKiBJZiB0aGUgZGV2aWNlIGV4aXN0cyBhbmQgaXQgaXMg
bm90IG93bmVkIGJ5IGVpdGhlciB0aGUgaGFyZHdhcmUNCj4+ID4+ICAgICAgICogZG9tYWluIG9y
IGRvbV9pbyB0aGVuIGl0IG11c3QgYmUgYXNzaWduZWQgdG8gYSBndWVzdCwgb3IgYmUNCj4+ID4+
ICAgICAgICogaGlkZGVuIChvd25lZCBieSBkb21feGVuKS4NCj4+ID4+ICAgICAgICovDQo+PiA+
PiAtICAgIGVsc2UgaWYgKCBwZGV2LT5kb21haW4gIT0gaGFyZHdhcmVfZG9tYWluICYmDQo+PiA+
PiAtICAgICAgICAgICAgICBwZGV2LT5kb21haW4gIT0gZG9tX2lvICkNCj4+ID4+ICsgICAgaWYg
KCBwZGV2LT5kb21haW4gIT0gaGFyZHdhcmVfZG9tYWluICYmDQo+PiA+PiArICAgICAgICAgcGRl
di0+ZG9tYWluICE9IGRvbV9pbyApDQo+PiA+PiAgICAgICAgICByYyA9IC1FQlVTWTsNCj4+ID4+
ICANCj4+ID4+ICAgICAgcmV0dXJuIHJjOw0KPj4gPj4gIH0NCj4+ID4+ICANCj4+ID4+ICAvKiBD
YWxsZXIgc2hvdWxkIGhvbGQgdGhlIHBjaWRldnNfbG9jayAqLw0KPj4gPg0KPj4gPiBJIHdvdWxk
IGFzc3VtZSB0aGUgY2FsbGVyIGhhcyB0YWtlbiBhbiBleHRyYSByZWZlcmVuY2UgdG8gdGhlIHBk
ZXYsIHNvDQo+PiA+IGhvbGRpbmcgdGhlIHBjaWRldnNfbG9jayBpcyBubyBsb25nZXIgbmVlZGVk
Pw0KPj4gDQo+PiBJIGFtIGFzc3VtZWQgdGhhdCBsb2NrIG1heSBiZSByZXF1aXJlZCBieSBNU0lY
IG9yIElPTU1VIGZ1bmN0aW9ucywgdGhhdA0KPj4gYXJlIGJlaW5nIGNhbGxlZCBoZXJlLiBGb3Ig
ZXhhbXBsZSwgSSBjYW4gc2VlIHRoYXQgcmVhc3NpZ25fZGV2aWNlKCkgaW4NCj4+IHBjaV9hbWRf
aW9tbXUuYyBtYW5pcHVsYXRlcyB3aXRoIHNvbWUgbGlzdHMuIEkgYmVsaWV2ZSwgaXQgc2hvdWxk
IGJlDQo+PiBwcm90ZWN0ZWQgd2l0aCB0aGUgbG9jay4NCj4NCj4gT0ssIHNvIHRoYXQncyBwY2lk
ZXZzX2xvY2sgYmVpbmcgdXNlZCB0byBwcm90ZWN0IHNvbWV0aGluZyBlbHNlIHRoYXQncw0KPiBu
b3Qgc3RyaWN0bHkgYSBwY2kgZGV2aWNlLCBidXQgYSByZWxhdGVkIHN0cnVjdHVyZS4NCj4NCg0K
WWVzLiBJIGhhdmUgZm91bmQgbXVsdGlwbGUgc3VjaCBwbGFjZXMsIHdoZW4gSSB0cmllZCB0b3Rh
bCBQQ0kgbG9ja2luZw0KcmV3b3JraW5nLg0KDQo+PiA+DQo+PiA+PiAtc3RhdGljIGludCBhc3Np
Z25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4sIHUz
MiBmbGFnKQ0KPj4gPj4gK3N0YXRpYyBpbnQgYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpk
LCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdTMyIGZsYWcpDQo+PiA+PiAgew0KPj4gPj4gICAgICBj
b25zdCBzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZCA9IGRvbV9pb21tdShkKTsNCj4+ID4+IC0gICAg
c3RydWN0IHBjaV9kZXYgKnBkZXY7DQo+PiA+PiArICAgIHVpbnQ4X3QgZGV2Zm47DQo+PiA+PiAg
ICAgIGludCByYyA9IDA7DQo+PiA+PiAgDQo+PiA+PiAgICAgIGlmICggIWlzX2lvbW11X2VuYWJs
ZWQoZCkgKQ0KPj4gPj4gQEAgLTE0MjIsMTAgKzE0MTIsMTEgQEAgc3RhdGljIGludCBhc3NpZ25f
ZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4sIHUzMiBm
bGFnKQ0KPj4gPj4gIA0KPj4gPj4gICAgICAvKiBkZXZpY2VfYXNzaWduZWQoKSBzaG91bGQgYWxy
ZWFkeSBoYXZlIGNsZWFyZWQgdGhlIGRldmljZSBmb3IgYXNzaWdubWVudCAqLw0KPj4gPj4gICAg
ICBBU1NFUlQocGNpZGV2c19sb2NrZWQoKSk7DQo+PiA+PiAtICAgIHBkZXYgPSBwY2lfZ2V0X3Bk
ZXYoTlVMTCwgUENJX1NCREYoc2VnLCBidXMsIGRldmZuKSk7DQo+PiA+PiAgICAgIEFTU0VSVChw
ZGV2ICYmIChwZGV2LT5kb21haW4gPT0gaGFyZHdhcmVfZG9tYWluIHx8DQo+PiA+PiAgICAgICAg
ICAgICAgICAgICAgICBwZGV2LT5kb21haW4gPT0gZG9tX2lvKSk7DQo+PiA+PiAgDQo+PiA+PiAr
ICAgIGRldmZuID0gcGRldi0+ZGV2Zm47DQo+PiA+PiArDQo+PiA+PiAgICAgIC8qIERvIG5vdCBh
bGxvdyBicm9rZW4gZGV2aWNlcyB0byBiZSBhc3NpZ25lZCB0byBndWVzdHMuICovDQo+PiA+PiAg
ICAgIHJjID0gLUVCQURGOw0KPj4gPj4gICAgICBpZiAoIHBkZXYtPmJyb2tlbiAmJiBkICE9IGhh
cmR3YXJlX2RvbWFpbiAmJiBkICE9IGRvbV9pbyApDQo+PiA+PiBAQCAtMTQ2MCw3ICsxNDUxLDcg
QEAgc3RhdGljIGludCBhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4
IGJ1cywgdTggZGV2Zm4sIHUzMiBmbGFnKQ0KPj4gPj4gICBkb25lOg0KPj4gPj4gICAgICBpZiAo
IHJjICkNCj4+ID4+ICAgICAgICAgIHByaW50ayhYRU5MT0dfR19XQVJOSU5HICIlcGQ6IGFzc2ln
biAoJXBwKSBmYWlsZWQgKCVkKVxuIiwNCj4+ID4+IC0gICAgICAgICAgICAgICBkLCAmUENJX1NC
REYoc2VnLCBidXMsIGRldmZuKSwgcmMpOw0KPj4gPj4gKyAgICAgICAgICAgICAgIGQsICZQQ0lf
U0JERihwZGV2LT5zZWcsIHBkZXYtPmJ1cywgZGV2Zm4pLCByYyk7DQo+PiA+PiAgICAgIC8qIFRo
ZSBkZXZpY2UgaXMgYXNzaWduZWQgdG8gZG9tX2lvIHNvIG1hcmsgaXQgYXMgcXVhcmFudGluZWQg
Ki8NCj4+ID4+ICAgICAgZWxzZSBpZiAoIGQgPT0gZG9tX2lvICkNCj4+ID4+ICAgICAgICAgIHBk
ZXYtPnF1YXJhbnRpbmUgPSB0cnVlOw0KPj4gPj4gQEAgLTE1OTUsNiArMTU4Niw5IEBAIGludCBp
b21tdV9kb19wY2lfZG9tY3RsKA0KPj4gPj4gICAgICAgICAgQVNTRVJUKGQpOw0KPj4gPj4gICAg
ICAgICAgLyogZmFsbCB0aHJvdWdoICovDQo+PiA+PiAgICAgIGNhc2UgWEVOX0RPTUNUTF90ZXN0
X2Fzc2lnbl9kZXZpY2U6DQo+PiA+PiArICAgIHsNCj4+ID4+ICsgICAgICAgIHN0cnVjdCBwY2lf
ZGV2ICpwZGV2Ow0KPj4gPj4gKw0KPj4gPj4gICAgICAgICAgLyogRG9uJ3Qgc3VwcG9ydCBzZWxm
LWFzc2lnbm1lbnQgb2YgZGV2aWNlcy4gKi8NCj4+ID4+ICAgICAgICAgIGlmICggZCA9PSBjdXJy
ZW50LT5kb21haW4gKQ0KPj4gPj4gICAgICAgICAgew0KPj4gPj4gQEAgLTE2MjIsMjYgKzE2MTYs
MzYgQEAgaW50IGlvbW11X2RvX3BjaV9kb21jdGwoDQo+PiA+PiAgICAgICAgICBzZWcgPSBtYWNo
aW5lX3NiZGYgPj4gMTY7DQo+PiA+PiAgICAgICAgICBidXMgPSBQQ0lfQlVTKG1hY2hpbmVfc2Jk
Zik7DQo+PiA+PiAgICAgICAgICBkZXZmbiA9IFBDSV9ERVZGTihtYWNoaW5lX3NiZGYpOw0KPj4g
Pj4gLQ0KPj4gPj4gICAgICAgICAgcGNpZGV2c19sb2NrKCk7DQo+PiA+PiAtICAgICAgICByZXQg
PSBkZXZpY2VfYXNzaWduZWQoc2VnLCBidXMsIGRldmZuKTsNCj4+ID4+ICsgICAgICAgIHBkZXYg
PSBwY2lfZ2V0X3BkZXYoTlVMTCwgUENJX1NCREYoc2VnLCBidXMsIGRldmZuKSk7DQo+PiA+PiAr
ICAgICAgICBpZiAoICFwZGV2ICkNCj4+ID4+ICsgICAgICAgIHsNCj4+ID4+ICsgICAgICAgICAg
ICBwcmludGsoWEVOTE9HX0dfSU5GTyAiJXBwIG5vbi1leGlzdGVudFxuIiwNCj4+ID4+ICsgICAg
ICAgICAgICAgICAgICAgJlBDSV9TQkRGKHNlZywgYnVzLCBkZXZmbikpOw0KPj4gPj4gKyAgICAg
ICAgICAgIHJldCA9IC1FSU5WQUw7DQo+PiA+PiArICAgICAgICAgICAgYnJlYWs7DQo+PiA+PiAr
ICAgICAgICB9DQo+PiA+PiArDQo+PiA+PiArICAgICAgICByZXQgPSBkZXZpY2VfYXNzaWduZWQo
cGRldik7DQo+PiA+PiAgICAgICAgICBpZiAoIGRvbWN0bC0+Y21kID09IFhFTl9ET01DVExfdGVz
dF9hc3NpZ25fZGV2aWNlICkNCj4+ID4+ICAgICAgICAgIHsNCj4+ID4+ICAgICAgICAgICAgICBp
ZiAoIHJldCApDQo+PiA+PiAgICAgICAgICAgICAgew0KPj4gPj4gLSAgICAgICAgICAgICAgICBw
cmludGsoWEVOTE9HX0dfSU5GTyAiJXBwIGFscmVhZHkgYXNzaWduZWQsIG9yIG5vbi1leGlzdGVu
dFxuIiwNCj4+ID4+ICsgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19HX0lORk8gIiVwcCBh
bHJlYWR5IGFzc2lnbmVkXG4iLA0KPj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgJlBDSV9T
QkRGKHNlZywgYnVzLCBkZXZmbikpOw0KPj4gPj4gICAgICAgICAgICAgICAgICByZXQgPSAtRUlO
VkFMOw0KPj4gPj4gICAgICAgICAgICAgIH0NCj4+ID4+ICAgICAgICAgIH0NCj4+ID4+ICAgICAg
ICAgIGVsc2UgaWYgKCAhcmV0ICkNCj4+ID4+IC0gICAgICAgICAgICByZXQgPSBhc3NpZ25fZGV2
aWNlKGQsIHNlZywgYnVzLCBkZXZmbiwgZmxhZ3MpOw0KPj4gPj4gKyAgICAgICAgICAgIHJldCA9
IGFzc2lnbl9kZXZpY2UoZCwgcGRldiwgZmxhZ3MpOw0KPj4gPj4gKw0KPj4gPj4gKyAgICAgICAg
cGNpZGV2X3B1dChwZGV2KTsNCj4+ID4NCj4+ID4gSSB3b3VsZCB0aGluayB5b3UgbmVlZCB0byBr
ZWVwIHRoZSByZWZjb3VudCBoZXJlIGlmIHJldCA9PSAwLCBzbyB0aGF0DQo+PiA+IHRoZSBkZXZp
Y2UgY2Fubm90IGJlIHJlbW92ZWQgd2hpbGUgYXNzaWduZWQgdG8gYSBkb21haW4/DQo+PiANCj4+
IExvb2tzIGxpa2Ugd2UgYXJlIHBlcmNlaXZpbmcgZnVuY3Rpb24gb2YgcmVmY250IGluIGEgZGlm
ZmVyZW50DQo+PiB3YXlzLiBGb3IgbWUsIHRoaXMgaXMgdGhlIG1lY2hhbmlzbSB0byBndWFyYW50
ZWUgdGhhdCBpZiB3ZSBoYXZlIGEgdmFsaWQNCj4+IHBvaW50ZXIgdG8gYW4gb2JqZWN0LCB0aGlz
IG9iamVjdCB3aWxsIG5vdCBkaXNhcHBlYXIgdW5kZXIgb3VyDQo+PiBmZWV0LiBUaGlzIGlzIHRo
ZSBtYWluIGZ1bmN0aW9uIG9mIGtyZWZzIGluIHRoZSBsaW51eCBrZXJuZWw6IGlmIHlvdXINCj4+
IGNvZGUgaG9sZHMgYSByZWZlcmVuY2UgdG8gYW4gb2JqZWN0LCB5b3UgY2FuIGJlIHN1cmUgdGhh
dCB0aGlzIG9iamVjdCBpcw0KPj4gZXhpc3RzIGluIG1lbW9yeS4NCj4+IA0KPj4gT24gb3RoZXIg
aGFuZCwgaXQgc2VlbXMgdGhhdCB5b3UgYXJlIGNvbnNpZGVyaW5nIHRoaXMgcmVmY250IGFzIGFu
IHVzYWdlDQo+PiBjb3VudGVyIGZvciBhbiBhY3R1YWwgUENJIGRldmljZSwgbm90ICJzdHJ1Y3Qg
cGRldiIgdGhhdCByZXByZXNlbnQNCj4+IGl0LiBUaG9zZSBhcmUgdHdvIHJlbGF0ZWQgdGhpbmdz
LCBidXQgbm90IHRoZSBzYW1lLiBTbywgSSBjYW4gc2VlIHdoeQ0KPj4geW91IGFyZSBzdWdnZXN0
aW5nIHRvIGdldCBhZGRpdGlvbmFsIHJlZmVyZW5jZSB0aGVyZS4gQnV0IGZvciBtZSwgdGhpcw0K
Pj4gbG9va3MgdW5uZWNlc3Nhcnk6IHRoZSB2ZXJ5IGZpcnN0IHJlZmNvdW50IGlzIG9idGFpbmVk
IGluDQo+PiBwY2lfYWRkX2RldmljZSgpIGFuZCB0aGVyZSBpcyB0aGUgY29ycmVzcG9uZGluZyBm
dW5jdGlvbg0KPj4gcGNpX3JlbW92ZV9kZXZpY2UoKSB0aGF0IHdpbGwgZHJvcCB0aGlzIHJlZmNv
dW50LiBTbywgZm9yIG1lLCBpZiBhZG1pbg0KPj4gd2FudHMgdG8gcmVtb3ZlIGEgUENJIGRldmlj
ZSB3aGljaCBpcyBhc3NpZ25lZCB0byBhIGRvbWFpbiwgdGhleSBjYW4gZG8NCj4+IHRoaXMgYXMg
dGhleSB3ZXJlIGFibGUgdG8gZG8gdGhpcyBwcmlvciB0aGlzIHBhdGNoZXMuDQo+DQo+IFRoaXMg
aXMgYWxsIGZpbmUsIGJ1dCBuZWVkcyB0byBiZSBzdGF0ZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdl
Lg0KPg0KDQpTdXJlLCBJIHdpbGwgYWRkIHRoaXMuDQoNCj4+IFRoZSBtYWluIHZhbHVlIG9mIGlu
dHJvZHVjaW5nIHJlZmNudCBpcyB0byBiZSBhYmxlIHRvIGFjY2VzcyBwZGV2IG9iamVjdHMNCj4+
IHdpdGhvdXQgaG9sZGluZyB0aGUgZ2xvYmFsIHBjaWRldnNfbG9jaygpLiBUaGlzIGRvZXMgbm90
IG1lYW4gdGhhdCB5b3UNCj4+IGRvbid0IG5lZWQgbG9ja2luZyBhdCBhbGwuIEJ1dCB0aGlzIGFs
bG93cyB5b3UgdG8gdXNlIHBkZXYtPmxvY2sgKHdoaWNoDQo+PiBkb2VzIG5vdCBleGlzdHMgaW4g
dGhpcyBzZXJpZXMsIGJ1dCB3YXMgaW50cm9kdWNlZCBpbiBhIFJGQyBlYXJsaWVyKSwgb3INCj4+
IHZwY2ktPmxvY2ssIG9yIGFueSBvdGhlciBzdWJzeXN0ZW0tPmxvY2suDQo+DQo+IEkgZ3Vlc3Mg
SSB3YXMgbWlzc2luZyB0aGlzIG90aGVyIGJpdCBhYm91dCBpbnRyb2R1Y2luZyBhDQo+IHBlci1k
ZXZpY2UgbG9jaywgd291bGQgaXQgYmUgcG9zc2libGUgdG8gYnVuZGxlIGFsbCB0aGlzIHRvZ2V0
aGVyIGludG8NCj4gYSBzaW5nbGUgcGF0Y2ggc2VyaWVzPw0KDQpBcyBJIHNhaWQgYXQgdGhlIHRv
cCBvZiB0aGlzIGVtYWlsLCBpdCB3YXMgdHJpZWQuIFlvdSBjYW4gY2hlY2sgUkZDIGF0IFsxXS4N
Cg0KPg0KPiBJdCB3b3VsZCBiZSBnb29kIHRvIHBsYWNlIHRoaXMgY2hhbmdlIHRvZ2V0aGVyIHdp
dGggYW55IG90aGVyIGxvY2tpbmcNCj4gcmVsYXRlZCBjaGFuZ2UgdGhhdCB5b3UgaGF2ZSBwZW5k
aW5nLg0KDQpIb25lc3RseSwgbXkgbWFpbiBnb2FsIGlzIHRvIGZpeCB0aGUgY3VycmVudCBpc3N1
ZXMgd2l0aCB2UENJLCBzbyBBUk0NCmNhbiBtb3ZlIGZvcndhcmQgb24gYWRkaW5nIFBDSSBzdXBw
b3J0IGZvciB0aGUgcGxhdGZvcm0uIFNvLCBJIGFtDQpmb2N1c2luZyBvbiB0aGlzIHJpZ2h0IG5v
dy4NCg0KWzFdDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVs
L2NvdmVyLzIwMjIwODMxMTQxMDQwLjEzMjMxLTEtdm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20v
DQoNClsyXQ0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3hlbi1kZXZlbC9j
b3Zlci8yMDIyMDIxNjE1MTYyOC4xNjEwNzc3LTEtYW5kcjIwMDBAZ21haWwuY29tLw0KDQotLSAN
CldCUiwgVm9sb2R5bXly

