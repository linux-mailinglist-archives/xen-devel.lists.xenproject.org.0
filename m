Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D34174A9974
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 13:37:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265469.458844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFxpy-0005qa-Tn; Fri, 04 Feb 2022 12:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265469.458844; Fri, 04 Feb 2022 12:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFxpy-0005om-QP; Fri, 04 Feb 2022 12:37:14 +0000
Received: by outflank-mailman (input) for mailman id 265469;
 Fri, 04 Feb 2022 12:37:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+82=ST=epam.com=prvs=4034f0a382=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFxpx-0005og-LQ
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 12:37:14 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b543b40-85b7-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 13:37:10 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 214C381w006851;
 Fri, 4 Feb 2022 12:37:07 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2056.outbound.protection.outlook.com [104.47.9.56])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e11uerjkb-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 12:37:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AS8PR03MB7842.eurprd03.prod.outlook.com (2603:10a6:20b:341::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Fri, 4 Feb
 2022 12:37:02 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 12:37:02 +0000
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
X-Inumbo-ID: 2b543b40-85b7-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmE7Skz90lB5JXm5ZGpJEBsr+rEWqJwcB7fqsnwHvHDwxGMuSfxKGc+YXAe8CNLHBiMQej54eg4rucO1EcDIkDmzvYIbsF6vf0a6+deD5+zOT0VnoA/oaF4UaUimkTIsy/giQKxeQYFOPF8Qhl1GcJ1sTUeNzBH2igIDF1BoHTB5yGwWRBSl5rOMclCQkreJnrB9bV+7kJTCQaYPkqoB0EQnwxVwL5+PEnF67I60QivTDCfyqTTUtHE8p1VIPVV133ewNUcPlkuS7gKfdLYlz44sDzSf3vmfysexnBrbc9QfplGCGwnblyu5De32P7NrPDya5jNDfyW39WBvA+b/JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXFWFp0WVV4MaLKwCh2i5LbxTT+ekPvTVyjxL00enwk=;
 b=Daj2WlPgHUnEXqe3hHLRNuuMDPs8B061XA/2doY5CbafE45E1m4XKRcgX7wJ47XQM8dg9H5BTvGch+HJT3kjJ4F4dRO5zeuhlF5vApdRKIF8AiRVlqghvQdGOp4GhQXxXm9aMIUSPbFyBGyZSOCU87NNTq/VSI/WNbIFNTxDSd83HFp27qZBUcuYCFFu0HgF8zOzqIKWz/8I3mCNeiUwRSYZ1VfyAm6pBmq7o3bXINYejrYmgiOVSJHnJGDFpoyvzk0R/l7aR+KhIFkQJesg0+YNxM1RAQmqO7o3t65Vq+aDOjA67z7icrT0GmRJaElGguktX2w5Erdon0xkarVHsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXFWFp0WVV4MaLKwCh2i5LbxTT+ekPvTVyjxL00enwk=;
 b=bTkQ6OiaeAQHxnlZE4cJdmsovUz3AISi6HpHreOdh3lZSL4WpqdC5ov0+54vAgCqVt++eVGkfx0GC4MP25kSr8DXJCTB1yIlhQfQfrsRhX4aUNwNq13QtglEUjKNyaJDFabu4iM2ZuiVSvm/hB8wifCdQd6O5a2k1JohaSwUPyRp17HqmPmfO3s1AokNAViE5jHvYiqHRyvbuIiw8yJG1Y0uR0ambh7ZR3NL19KArxDRl3hhpx5OXjTHYc1R7qo/TT+bbtfjzk4ZEKHXXaCJ5N3szdiX1Qd62eBf/hLmvC3BBIC/J29v2oAO1JIIVuThDp35nJ9B6VY5SROqKOomRg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
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
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: 
 AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAASSACAAATYAIAAD/WAgAAKNgCAAAbfgIAABnuAgAAQvgA=
Date: Fri, 4 Feb 2022 12:37:01 +0000
Message-ID: <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-4-andr2000@gmail.com>
 <7209889d-8f17-61cc-72a4-97f6dbc1d54d@suse.com>
 <2cf022f8-b000-11b7-c6b9-90a56bc6e2ea@epam.com>
 <04726915-f39f-9019-436e-4399533c9fc3@suse.com>
 <9ed3f4ac-0a2d-ed45-9872-7c3f356a469e@epam.com>
 <c3a99712-cf7c-37da-aac1-f2ee00e6d53b@suse.com>
 <Yf0KcVD8W05A4fbB@Air-de-Roger>
 <1ed0e342-16cd-2f16-c05c-186667a22762@suse.com>
In-Reply-To: <1ed0e342-16cd-2f16-c05c-186667a22762@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 454bb995-e176-4d38-745f-08d9e7db0b2c
x-ms-traffictypediagnostic: AS8PR03MB7842:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AS8PR03MB7842846D5AB8339742832E6CE7299@AS8PR03MB7842.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BbB5J9WBM2LLbv25T3w5WECHk3bXXVggxPYArsGYlb2LsPB4T5YSDK+fhQpwMPC0DjSpydD48RfP4tjJNPbUCUD8Pza81uu1eH+QmXsV3HVg1pVEu5d4Z4U8drUaGGB1+ySAlYfuaM2ms7gu/KAC0OZVCcH1Gajm8d5wZe6pBlUwhSu3zM9AzMXa2iMwVZbw171mBb3Y/1rzAHF7l+WJniVWPpk8tEN9E64HJpyQn2lwFHvLwdIOCPFpElYvYOqdKyeZ/oPYMMdlUPpwjm+0AeQ6QCbFEmR3dnnxSEKnAGmEw+PS4zlgfqCyaMcKABvtlXUAyF4h3cSRAO7ejyVxyMz/Iy76WYIJCE73WpEjElmQP3YD+jrpVDgHY7lzE0JdUuRfEQH1yGJeqb8FJaQBLj+OQNIvtA/6im2xJxHTi8TLo2WrIoEG/w8zsBhqmio7FcxALpbV/N3hZYBdhFDSRCFW8o7F3Cm5/HV4uGescmHc4a93DlSm6qs1NdhuSsjgTcU1bsX65tw+21XcP/5ZIEFxyO526du/le+K93rJJ04UsPjcOZCAVnhrxzbBQbtX81FBHwvBfulLrwAxN7JqMuo2fDOFgrIh6DumJvzmZR2/BrTt49IBd3OqTGQZiWFJ6iGsGsVQKe58zDgHKhwgF0i029YwG123FW0HYKcNPdvjB8U/GDpygVfJAv016NkJl2AifWZ0wTQDnb6VDTgWG8FiJzOHrijvvzAsVFXNiBseHFclvzy6qQjO36rhdM5e
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(64756008)(2616005)(6486002)(38070700005)(38100700002)(76116006)(66446008)(66556008)(8936002)(91956017)(8676002)(122000001)(7416002)(66476007)(2906002)(4326008)(31696002)(508600001)(71200400001)(83380400001)(53546011)(36756003)(86362001)(5660300002)(110136005)(186003)(316002)(26005)(54906003)(31686004)(6512007)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NnBQeSsvTkM1U08zbGNwRVJvbTVqNklGNTNTNTdML0Q3L0YyT1JzZXFpcGxS?=
 =?utf-8?B?SVhGZEliSGsxWUdmYmo4ektLd1RiQllpTExsVTVGSTh5Uyt3NGhvL2h1eG1H?=
 =?utf-8?B?OUx0YndCM25tMEZqc0VIYWhrRDRrdGxRdmhEK3pCdFA1QmpjR044bFg0cUN0?=
 =?utf-8?B?dENpRHllWHhYenhDUFRvNm5aWmV6ZnFGYkhTM2JVdlRFazc1NExZZnYvalFy?=
 =?utf-8?B?Vjh6V0FVSEM4MDREUlVrcEF5MFJmTjZIcW1FR2RKY3VBSEEvUzk5b2JQaUtu?=
 =?utf-8?B?T0tNdlVoY1hJdjEyT1RGdTdTR28wV05GMm5NVW1xWnMxUjZkR0pud1dSNzRF?=
 =?utf-8?B?S2U3cVVCNFoxc3Rld3doekh3WjdRQnNEZnhKK0ZHU3pMc1RZbzlSbDZuK2RK?=
 =?utf-8?B?eGQrTEZBTlBWRFZNM1BNQXJVZ2cxTVE1aTNrVWxBZVRadGoycXVMVk8rdTd1?=
 =?utf-8?B?Qk1Lc013aWd4eFVEN0V1SEtNNVlUWnVZNDdiQlRUY2RiRC8ydVBLNVNwd01F?=
 =?utf-8?B?V1U2UU9BTy9DaVdva0Q0V2JBakhjM3o4K0dVQmh5ZXJLNGxUeXJZRENWZms3?=
 =?utf-8?B?TFlRRE9yWFhBbm40WnRkcDFwNVg3UnlDVlczZE9VcnNqZS9JYng4UG1tTTFH?=
 =?utf-8?B?bjVYKzhqWHBSUU4yWnQvVDNrbWJra3VscTJVRktOM2JZb0RHZm9pWVdGdEhK?=
 =?utf-8?B?LzgrMTVxckpBYU02emNVVzI3dWRtb3dROVpESjBObklYQ0Q5UEdmaUtmVmlu?=
 =?utf-8?B?Z2trdGM4Sjk4MkNwNDliaCtheEVoWng5T2h5dnh3TE9Jc1N4L2dZRXJSUHJk?=
 =?utf-8?B?UkorMUU3NFl0QUN3MnVmQUN4Ukg3OEpIVU1lWUZrdlNyN2JKVlJPWlNuOFE5?=
 =?utf-8?B?Qy9ZbmozcDV5RlJia01RMmFWWUVLUWpNK3pCb0tRaVVXcTE5RGx6MUdRZjlp?=
 =?utf-8?B?ZzJ6T3pNeFN3WjNHWkc4ZHhNSHMrcnV3ZGdMNlVGUDBuNVhOZlgyczQ5QUM0?=
 =?utf-8?B?MjZVeEdYNUdCTk9BWVp6U2c0YWRGOUkwMm92NGh2RHlBaWF2VEMvbUg4TFA0?=
 =?utf-8?B?NzZFUnFCU0xNYXd1SU9pYjNJQ1Zwb1FLNjExMktRaExtVFZOaE5RM01qd2Jx?=
 =?utf-8?B?ZG1HU0Fqdk1Sa1dNeUJ6TWhhZUVWaG1lWWp3TWIySnEwQXZmd2twcHB6RUR4?=
 =?utf-8?B?NE0yc05DMStmSG5EV0lhV0dPK1A5NVBnbXJFWm5samV1Uk11QzdRUTNmeHdG?=
 =?utf-8?B?NzJVNDByOFZ4eVVVUmhZamhaL0NHeFhVUDlGUW52ekRuVEM3VWk3WUdLY0xT?=
 =?utf-8?B?d25yY1JtSFFieHZVNW8wV1VXeVM5dTRudmEwbWNJUURwWjRKdDNJd2dHejJZ?=
 =?utf-8?B?cmE0dWdPVW5SVkQyRC9UWHd0VlBqWkFXZHNCeGFvVnF6Wi8rWFd2NFp1RUEz?=
 =?utf-8?B?d1RSRU41NVV1dVkrMmphNzgzSjcwMkx1KzdCS0c0MUdLZ0lqc1BFVXNBUi9y?=
 =?utf-8?B?S2w2U2dzRlhGNjJ3SkpDbWFmTnJtMmcvOVRYVVRkcVcvNFg3VXF0SXV3SjRa?=
 =?utf-8?B?VDlSR2VPVlIwTU15anpYNEppQjIrSmNRTDY2cEhEWG5DV0gxdUVuVFFpaEcy?=
 =?utf-8?B?a3gxRnhKZEVOSUllNFBFeU5xaEdGTEs2WjlRZWV2TkRMR0xISnhaU1k2TUVa?=
 =?utf-8?B?QjdPNXl3dDdVZ2ovY3pJcU4reHZrT3gvSjFRVGRlOGpUUU1mTHU0UnVJVTdQ?=
 =?utf-8?B?QTBZcVVzTjA1emdKbXRQRjg2RC9jUGx6RUdWSERkdXhpMmtDSVBQMFFYVExC?=
 =?utf-8?B?RGhRNmlJS2RTMmZHN1hVUG52ZXZmMWIwNTc4Q2pUeXJmeGtMNXYwMjJrTGF0?=
 =?utf-8?B?V2o0L09iRjNlazJuRGZKZXBoaVVSUUk5SWhFZXZtajRvK3V4aE9qNnVQanBJ?=
 =?utf-8?B?UFp3UllkVVJIazlzS1RBL2VVeFRZem9YWFRVUWQ5M2ttK3MzWUsyUDRnaHNB?=
 =?utf-8?B?MEZ5M00weTRqdWQxbXEvQzBOT0V1TTF6MGJ1enlUSlZUZFQ4ekRUOER4dnJV?=
 =?utf-8?B?SGFzdE44SGUxbTlJL1d4Zkt4d0owNXpzeFJ1b0tSSE1lM2Zia2NqTzdRKzZs?=
 =?utf-8?B?WVZDYllKUmw2alFEbUdsenA4YW1mbmJERVo0MktNTVl2YTBVNTlnZHhDbDk4?=
 =?utf-8?B?Rzd2bWYxS0VoWjA4Y2hZSlZrODduSi9SbXprd0x4TlRrZmlobzJEczZmc2N6?=
 =?utf-8?B?VlVFWkJEYzdyNjNBNjExVTd5Wi9wQkRBYlBvTFBxS3JubHVpcnNseEwrTWZa?=
 =?utf-8?B?UjN1SzVSSHdPc2syeEhERDQvL0RIN00zMjlsemxsWkVwdmNLaTYrQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <83DE2BD35936AD46BBE564A49AC70F99@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 454bb995-e176-4d38-745f-08d9e7db0b2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 12:37:02.0327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VxDVUVwbs5Wbr9n94vSw5+EzX5zx7Im8v9MhTaPm56At0jvizIcbLB204Jh7AauAEDX6O6F5ELKb49ztIOsotT8NuZjxubPA1vnXlPDbtXUHQCo2fffgT8AP2qd36rIV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7842
X-Proofpoint-ORIG-GUID: iYmfnXQx0dh2Z5NomRcYVb1BydAaBoza
X-Proofpoint-GUID: iYmfnXQx0dh2Z5NomRcYVb1BydAaBoza
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_04,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 priorityscore=1501 mlxscore=0 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202040069

DQoNCk9uIDA0LjAyLjIyIDEzOjM3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDQuMDIuMjAy
MiAxMjoxMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+IE9uIEZyaSwgRmViIDA0LCAyMDIy
IGF0IDExOjQ5OjE4QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA0LjAyLjIw
MjIgMTE6MTIsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwNC4wMi4y
MiAxMToxNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAwNC4wMi4yMDIyIDA5OjU4LCBP
bGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAwNC4wMi4yMiAwOTo1Miwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+IE9uIDA0LjAyLjIwMjIgMDc6MzQsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+Pj4gQEAgLTI4NSw2ICsyODYsMTIgQEAgc3Rh
dGljIGludCBtb2RpZnlfYmFycyhjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdWludDE2X3Qg
Y21kLCBib29sIHJvbV9vbmx5KQ0KPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICBjb250aW51
ZTsNCj4+Pj4+Pj4+ICAgICAgICAgICAgIH0NCj4+Pj4+Pj4+ICAgICANCj4+Pj4+Pj4+ICsgICAg
ICAgIHNwaW5fbG9jaygmdG1wLT52cGNpX2xvY2spOw0KPj4+Pj4+Pj4gKyAgICAgICAgaWYgKCAh
dG1wLT52cGNpICkNCj4+Pj4+Pj4+ICsgICAgICAgIHsNCj4+Pj4+Pj4+ICsgICAgICAgICAgICBz
cGluX3VubG9jaygmdG1wLT52cGNpX2xvY2spOw0KPj4+Pj4+Pj4gKyAgICAgICAgICAgIGNvbnRp
bnVlOw0KPj4+Pj4+Pj4gKyAgICAgICAgfQ0KPj4+Pj4+Pj4gICAgICAgICAgICAgZm9yICggaSA9
IDA7IGkgPCBBUlJBWV9TSVpFKHRtcC0+dnBjaS0+aGVhZGVyLmJhcnMpOyBpKysgKQ0KPj4+Pj4+
Pj4gICAgICAgICAgICAgew0KPj4+Pj4+Pj4gICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB2
cGNpX2JhciAqYmFyID0gJnRtcC0+dnBjaS0+aGVhZGVyLmJhcnNbaV07DQo+Pj4+Pj4+PiBAQCAt
MzAzLDEyICszMTAsMTQgQEAgc3RhdGljIGludCBtb2RpZnlfYmFycyhjb25zdCBzdHJ1Y3QgcGNp
X2RldiAqcGRldiwgdWludDE2X3QgY21kLCBib29sIHJvbV9vbmx5KQ0KPj4+Pj4+Pj4gICAgICAg
ICAgICAgICAgIHJjID0gcmFuZ2VzZXRfcmVtb3ZlX3JhbmdlKG1lbSwgc3RhcnQsIGVuZCk7DQo+
Pj4+Pj4+PiAgICAgICAgICAgICAgICAgaWYgKCByYyApDQo+Pj4+Pj4+PiAgICAgICAgICAgICAg
ICAgew0KPj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICBzcGluX3VubG9jaygmdG1wLT52cGNpX2xv
Y2spOw0KPj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX0dfV0FSTklO
RyAiRmFpbGVkIHRvIHJlbW92ZSBbJWx4LCAlbHhdOiAlZFxuIiwNCj4+Pj4+Pj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0YXJ0LCBlbmQsIHJjKTsNCj4+Pj4+Pj4+ICAgICAgICAgICAg
ICAgICAgICAgcmFuZ2VzZXRfZGVzdHJveShtZW0pOw0KPj4+Pj4+Pj4gICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gcmM7DQo+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgfQ0KPj4+Pj4+Pj4gICAg
ICAgICAgICAgfQ0KPj4+Pj4+Pj4gKyAgICAgICAgc3Bpbl91bmxvY2soJnRtcC0+dnBjaV9sb2Nr
KTsNCj4+Pj4+Pj4+ICAgICAgICAgfQ0KPj4+Pj4+PiBBdCB0aGUgZmlyc3QgZ2xhbmNlIHRoaXMg
c2ltcGx5IGxvb2tzIGxpa2UgYW5vdGhlciB1bmp1c3RpZmllZCAoaW4gdGhlDQo+Pj4+Pj4+IGRl
c2NyaXB0aW9uKSBjaGFuZ2UsIGFzIHlvdSdyZSBub3QgY29udmVydGluZyBhbnl0aGluZyBoZXJl
IGJ1dCB5b3UNCj4+Pj4+Pj4gYWN0dWFsbHkgYWRkIGxvY2tpbmcgKGFuZCBJIHJlYWxpemUgdGhp
cyB3YXMgdGhlcmUgYmVmb3JlLCBzbyBJJ20gc29ycnkNCj4+Pj4+Pj4gZm9yIG5vdCBwb2ludGlu
ZyB0aGlzIG91dCBlYXJsaWVyKS4NCj4+Pj4+PiBXZWxsLCBJIHRob3VnaHQgdGhhdCB0aGUgZGVz
Y3JpcHRpb24gYWxyZWFkeSBoYXMgIi4uLnRoZSBsb2NrIGNhbiBiZQ0KPj4+Pj4+IHVzZWQgKGFu
ZCBpbiBhIGZldyBjYXNlcyBpcyB1c2VkIHJpZ2h0IGF3YXkpIHRvIGNoZWNrIHdoZXRoZXIgdnBj
aQ0KPj4+Pj4+IGlzIHByZXNlbnQiIGFuZCB0aGlzIGlzIGVub3VnaCBmb3Igc3VjaCB1c2VzIGFz
IGhlcmUuDQo+Pj4+Pj4+ICAgICBCdXQgdGhlbiBJIHdvbmRlciB3aGV0aGVyIHlvdQ0KPj4+Pj4+
PiBhY3R1YWxseSB0ZXN0ZWQgdGhpcywgc2luY2UgSSBjYW4ndCBoZWxwIGdldHRpbmcgdGhlIGlt
cHJlc3Npb24gdGhhdA0KPj4+Pj4+PiB5b3UncmUgaW50cm9kdWNpbmcgYSBsaXZlLWxvY2s6IFRo
ZSBmdW5jdGlvbiBpcyBjYWxsZWQgZnJvbSBjbWRfd3JpdGUoKQ0KPj4+Pj4+PiBhbmQgcm9tX3dy
aXRlKCksIHdoaWNoIGluIHR1cm4gYXJlIGNhbGxlZCBvdXQgb2YgdnBjaV93cml0ZSgpLiBZZXQg
dGhhdA0KPj4+Pj4+PiBmdW5jdGlvbiBhbHJlYWR5IGhvbGRzIHRoZSBsb2NrLCBhbmQgdGhlIGxv
Y2sgaXMgbm90IChjdXJyZW50bHkpDQo+Pj4+Pj4+IHJlY3Vyc2l2ZS4gKEZvciB0aGUgM3JkIGNh
bGxlciBvZiB0aGUgZnVuY3Rpb24gLSBpbml0X2JhcnMoKSAtIG90b2gNCj4+Pj4+Pj4gdGhlIGxv
Y2tpbmcgbG9va3MgdG8gYmUgZW50aXJlbHkgdW5uZWNlc3NhcnkuKQ0KPj4+Pj4+IFdlbGwsIHlv
dSBhcmUgY29ycmVjdDogaWYgdG1wICE9IHBkZXYgdGhlbiBpdCBpcyBjb3JyZWN0IHRvIGFjcXVp
cmUNCj4+Pj4+PiB0aGUgbG9jay4gQnV0IGlmIHRtcCA9PSBwZGV2IGFuZCByb21fb25seSA9PSB0
cnVlDQo+Pj4+Pj4gdGhlbiB3ZSdsbCBkZWFkbG9jay4NCj4+Pj4+Pg0KPj4+Pj4+IEl0IHNlZW1z
IHdlIG5lZWQgdG8gaGF2ZSB0aGUgbG9ja2luZyBjb25kaXRpb25hbCwgZS5nLiBvbmx5IGxvY2sN
Cj4+Pj4+PiBpZiB0bXAgIT0gcGRldg0KPj4+Pj4gV2hpY2ggd2lsbCBhZGRyZXNzIHRoZSBsaXZl
LWxvY2ssIGJ1dCBpbnRyb2R1Y2UgQUJCQSBkZWFkbG9jayBwb3RlbnRpYWwNCj4+Pj4+IGJldHdl
ZW4gdGhlIHR3byBsb2Nrcy4NCj4+Pj4gSSBhbSBub3Qgc3VyZSBJIGNhbiBzdWdnZXN0IGEgYmV0
dGVyIHNvbHV0aW9uIGhlcmUNCj4+Pj4gQFJvZ2VyLCBASmFuLCBjb3VsZCB5b3UgcGxlYXNlIGhl
bHAgaGVyZT8NCj4+PiBXZWxsLCBmaXJzdCBvZiBhbGwgSSdkIGxpa2UgdG8gbWVudGlvbiB0aGF0
IHdoaWxlIGl0IG1heSBoYXZlIGJlZW4gb2theSB0bw0KPj4+IG5vdCBob2xkIHBjaWRldnNfbG9j
ayBoZXJlIGZvciBEb20wLCBpdCBzdXJlbHkgbmVlZHMgYWNxdWlyaW5nIHdoZW4gZGVhbGluZw0K
Pj4+IHdpdGggRG9tVS1zJyBsaXN0cyBvZiBQQ0kgZGV2aWNlcy4gVGhlIHJlcXVpcmVtZW50IHJl
YWxseSBhcHBsaWVzIHRvIHRoZQ0KPj4+IG90aGVyIHVzZSBvZiBmb3JfZWFjaF9wZGV2KCkgYXMg
d2VsbCAoaW4gdnBjaV9kdW1wX21zaSgpKSwgZXhjZXB0IHRoYXQNCj4+PiB0aGVyZSBpdCBwcm9i
YWJseSB3YW50cyB0byBiZSBhIHRyeS1sb2NrLg0KPj4+DQo+Pj4gTmV4dCBJJ2QgbGlrZSB0byBw
b2ludCBvdXQgdGhhdCBoZXJlIHdlIGhhdmUgdGhlIHN0aWxsIHBlbmRpbmcgaXNzdWUgb2YNCj4+
PiBob3cgdG8gZGVhbCB3aXRoIGhpZGRlbiBkZXZpY2VzLCB3aGljaCBEb20wIGNhbiBhY2Nlc3Mu
IFNlZSBteSBSRkMgcGF0Y2gNCj4+PiAidlBDSTogYWNjb3VudCBmb3IgaGlkZGVuIGRldmljZXMg
aW4gbW9kaWZ5X2JhcnMoKSIuIFdoYXRldmVyIHRoZSBzb2x1dGlvbg0KPj4+IGhlcmUsIEkgdGhp
bmsgaXQgd2FudHMgdG8gYXQgbGVhc3QgYWNjb3VudCBmb3IgdGhlIGV4dHJhIG5lZWQgdGhlcmUu
DQo+PiBZZXMsIHNvcnJ5LCBJIHNob3VsZCB0YWtlIGNhcmUgb2YgdGhhdC4NCj4+DQo+Pj4gTm93
IGl0IGlzIHF1aXRlIGNsZWFyIHRoYXQgcGNpZGV2c19sb2NrIGlzbid0IGdvaW5nIHRvIGhlbHAg
d2l0aCBhdm9pZGluZw0KPj4+IHRoZSBkZWFkbG9jaywgYXMgaXQncyBpbW8gbm90IGFuIG9wdGlv
biBhdCBhbGwgdG8gYWNxdWlyZSB0aGF0IGxvY2sNCj4+PiBldmVyeXdoZXJlIGVsc2UgeW91IGFj
Y2VzcyAtPnZwY2kgKG9yIGVsc2UgdGhlIHZwY2kgbG9jayBpdHNlbGYgd291bGQgYmUNCj4+PiBw
b2ludGxlc3MpLiBCdXQgYSBwZXItZG9tYWluIGF1eGlsaWFyeSByL3cgbG9jayBtYXkgaGVscDog
T3RoZXIgcGF0aHMNCj4+PiB3b3VsZCBhY3F1aXJlIGl0IGluIHJlYWQgbW9kZSwgYW5kIGhlcmUg
eW91J2QgYWNxdWlyZSBpdCBpbiB3cml0ZSBtb2RlIChpbg0KPj4+IHRoZSBmb3JtZXIgY2FzZSBh
cm91bmQgdGhlIHZwY2kgbG9jaywgd2hpbGUgaW4gdGhlIGxhdHRlciBjYXNlIHRoZXJlIG1heQ0K
Pj4+IHRoZW4gbm90IGJlIGFueSBuZWVkIHRvIGFjcXVpcmUgdGhlIGluZGl2aWR1YWwgdnBjaSBs
b2NrcyBhdCBhbGwpLiBGVEFPRDoNCj4+PiBJIGhhdmVuJ3QgZnVsbHkgdGhvdWdodCB0aHJvdWdo
IGFsbCBpbXBsaWNhdGlvbnMgKGFuZCBoZW5jZSB3aGV0aGVyIHRoaXMgaXMNCj4+PiB2aWFibGUg
aW4gdGhlIGZpcnN0IHBsYWNlKTsgSSBleHBlY3QgeW91IHdpbGwsIGRvY3VtZW50aW5nIHdoYXQg
eW91J3ZlDQo+Pj4gZm91bmQgaW4gdGhlIHJlc3VsdGluZyBwYXRjaCBkZXNjcmlwdGlvbi4gT2Yg
Y291cnNlIHRoZSBkb3VibGUgbG9jaw0KPj4+IGFjcXVpcmUvcmVsZWFzZSB3b3VsZCB0aGVuIGxp
a2VseSB3YW50IGhpZGluZyBpbiBoZWxwZXIgZnVuY3Rpb25zLg0KPj4gSSd2ZSBiZWVuIGFsc28g
dGhpbmtpbmcgYWJvdXQgdGhpcywgYW5kIHdoZXRoZXIgaXQncyByZWFsbHkgd29ydGggdG8NCj4+
IGhhdmUgYSBwZXItZGV2aWNlIGxvY2sgcmF0aGVyIHRoYW4gYSBwZXItZG9tYWluIG9uZSB0aGF0
IHByb3RlY3RzIGFsbA0KPj4gdnBjaSByZWdpb25zIG9mIHRoZSBkZXZpY2VzIGFzc2lnbmVkIHRv
IHRoZSBkb21haW4uDQo+Pg0KPj4gVGhlIE9TIGlzIGxpa2VseSB0byBzZXJpYWxpemUgYWNjZXNz
ZXMgdG8gdGhlIFBDSSBjb25maWcgc3BhY2UgYW55d2F5LA0KPj4gYW5kIHRoZSBvbmx5IHBsYWNl
IEkgY291bGQgc2VlIGEgYmVuZWZpdCBvZiBoYXZpbmcgcGVyLWRldmljZSBsb2NrcyBpcw0KPj4g
aW4gdGhlIGhhbmRsaW5nIG9mIE1TSS1YIHRhYmxlcywgYXMgdGhlIGhhbmRsaW5nIG9mIHRoZSBt
YXNrIGJpdCBpcw0KPj4gbGlrZWx5IHZlcnkgcGVyZm9ybWFuY2Ugc2Vuc2l0aXZlLCBzbyBhZGRp
bmcgYSBwZXItZG9tYWluIGxvY2sgdGhlcmUNCj4+IGNvdWxkIGJlIGEgYm90dGxlbmVjay4NCj4g
SG1tLCB3aXRoIG1ldGhvZCAxIGFjY2Vzc2VzIHNlcmlhbGl6aW5nIGdsb2JhbGx5IGlzIGJhc2lj
YWxseQ0KPiB1bmF2b2lkYWJsZSwgYnV0IHdpdGggTU1DRkcgSSBzZWUgbm8gcmVhc29uIHdoeSBP
U2VzIG1heSBub3QgKG1vdmUNCj4gdG8pIHBlcm1pdCh0aW5nKSBwYXJhbGxlbCBhY2Nlc3Nlcywg
d2l0aCBzZXJpYWxpemF0aW9uIHBlcmhhcHMgZG9uZQ0KPiBvbmx5IGF0IGRldmljZSBsZXZlbC4g
U2VlIG91ciBvd24gcGNpX2NvbmZpZ19sb2NrLCB3aGljaCBhcHBsaWVzIHRvDQo+IG9ubHkgbWV0
aG9kIDEgYWNjZXNzZXM7IHdlIGRvbid0IGxvb2sgdG8gYmUgc2VyaWFsaXppbmcgTU1DRkcNCj4g
YWNjZXNzZXMgYXQgYWxsLg0KPg0KPj4gV2UgY291bGQgYWx0ZXJuYXRpdmVseSBkbyBhIHBlci1k
b21haW4gcndsb2NrIGZvciB2cGNpIGFuZCBzcGVjaWFsIGNhc2UNCj4+IHRoZSBNU0ktWCBhcmVh
IHRvIGFsc28gaGF2ZSBhIHBlci1kZXZpY2Ugc3BlY2lmaWMgbG9jay4gQXQgd2hpY2ggcG9pbnQN
Cj4+IGl0IGJlY29tZXMgZmFpcmx5IHNpbWlsYXIgdG8gd2hhdCB5b3UgcHJvcG9zZS4NCkBKYW4s
IEBSb2dlcg0KDQoxLiBkLT52cGNpX2xvY2sgLSByd2xvY2sgPC0gdGhpcyBwcm90ZWN0cyB2cGNp
DQoyLiBwZGV2LT52cGNpLT5tc2l4X3RibF9sb2NrIC0gcndsb2NrIDwtIHRoaXMgcHJvdGVjdHMg
TVNJLVggdGFibGVzDQpvciBzaG91bGQgaXQgYmV0dGVyIGJlIHBkZXYtPm1zaXhfdGJsX2xvY2sg
YXMgTVNJLVggdGFibGVzIGRvbid0DQpyZWFsbHkgZGVwZW5kIG9uIHZQQ0k/DQoNCkRvZXMgdGhp
cyBzb3VuZCBsaWtlIHNvbWV0aGluZyB0aGF0IGNvdWxkIGZseT8NCkl0IHRha2VzIHF1aXRlIGEg
d2hpbGUgdG8gaW1wbGVtZW50IGFuZCB0ZXN0LCBzbyBJIHdvdWxkIGxpa2UgdG8gdW5kZXJzdGFu
ZA0KdGhhdCBvbiB0aGUgZ3JvdW5kIHlldCBiZWZvcmUgcHV0dGluZyBlZmZvcnRzIGluIGl0Lg0K
PiBJbmRlZWQuDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91IGluIGFkdmFuY2UsDQpPbGVrc2FuZHI=

