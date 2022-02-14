Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3624B44ED
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 09:53:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271229.465584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJX6t-0005o7-AM; Mon, 14 Feb 2022 08:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271229.465584; Mon, 14 Feb 2022 08:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJX6t-0005lH-68; Mon, 14 Feb 2022 08:53:27 +0000
Received: by outflank-mailman (input) for mailman id 271229;
 Mon, 14 Feb 2022 08:53:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsDI=S5=epam.com=prvs=4044e07e7c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nJX6r-0005lB-HR
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 08:53:25 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 908e40a4-8d73-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 09:53:24 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21E8DtdU014749;
 Mon, 14 Feb 2022 08:53:17 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e7kctg483-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 08:53:17 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR03MB6528.eurprd03.prod.outlook.com (2603:10a6:800:19f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 08:53:13 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 08:53:13 +0000
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
X-Inumbo-ID: 908e40a4-8d73-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWcDTqykrxxtcwp8YB3JWwRFed3NuKUgU4tL1YBkTb2dg/62Xg6qgOLNuEQtLMEa1XCUdm1yn8lrk62txwATKn1oDtw2qDqpyeECGnDunlhB1SneJ6BOsldMBaKuO9YhkfePqOZFxmNDQAGWK/qXnmXl7gW0LtWpGP9bB5HdAjPK1onKs+vYgVxfBaN0INlwGfb9Vf6DBtIWCrpRnLwes1zVlaOgE9gS24xH2KLdF1883LPMcOdQ5zwkFW50OGgTBbuzYYWbqIbqz7piIJd/zgLwqMb8GMzwDYID0zPKZr4D9FR1s9i5PlvO4WrN+a9pHy3+EzIHwDK2Cj4rUWdKfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BefIVjQcvlVTtlENzRPpwAwVSdTuSTWB3PHFzHO4qak=;
 b=OExCZxxHIj+LDfByvjkI+rmmAOUcd1R9jNZw/0hdkDbhX/MX2/Nu4vRY6247qGnb3JUS5He8M+2m2Y/GJCC0y2UOFDW/LYljEpkT/Yfsz9xB/1nauTScMsnqJcO9VrFy2ZfMZ34dvtX5RnchYWXaprON7nA47wTzrHr7pwTyBHoHqwde3BRZDMFXPZOJ1GsTIbGidtlnBqZ94YzLrxMNqFcCJDJYsbrvDlf4vQIGs79hoIzWnarK+6uFrD6hjwKW+/t28uW77VPJPobabcR7OMB1G4I7Fs1TuXRYktAtZQ9zmliZsBAJ/XBrWutwkd08QZztq6mRVfhQ2SvoditrPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BefIVjQcvlVTtlENzRPpwAwVSdTuSTWB3PHFzHO4qak=;
 b=F4HIURfoZ/N7VCHrly0mBAr5S6iMD2JS1GqtEW/bLRBjq9jLqZXGxefm9zxXJBe9OfXRqbV73+B5GgPANRwOmuI1nk9a5SQBPV0ZocS3maVbVMpZz+aNR3OB33XVX7h/ZM7/kBgPkaWXkdRGGb2w65eijaejp6r7nS9NR7ytHz4zwWCp7f+Sd7DrB3nYsX8UU1KbRfdC/RGTZdOSKcy3UYmC7NASrKo0gOJEhkBYuZqam63d/V1mA/TMCQSjJAHmy0A0UrYrveWtCcYtyQPe4gje0s4dDDTqYmOrMv6ziVCUkjH3XFLbAKAOEMvQKEYG3v4N4Z6WRz5jHq3ai1Pf4A==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Thread-Topic: [PATCH] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: 
 AQHYHboQT3cBWYI1/EGunE7hOwop6ayM95MAgAD+qQCAAEaDAIAACWWAgAA6ygCABB0SgIAAJXCAgAABswA=
Date: Mon, 14 Feb 2022 08:53:13 +0000
Message-ID: <a5fc3216-123c-ab4e-49d0-f104fb49686d@epam.com>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
 <c4666570-666e-6680-5ec2-adf1da51ad06@epam.com>
 <YgZLEMW9US9QjjYG@Air-de-Roger>
 <1dbd0f54-affb-1e67-215c-6e6c8fb8535b@epam.com>
 <YgaEQrqIEPc258Fy@Air-de-Roger>
 <6905d6ab-e435-fb65-2e93-446644b69b82@epam.com>
 <YgoXC8vJvsz4lwBM@Air-de-Roger>
In-Reply-To: <YgoXC8vJvsz4lwBM@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e0c9cb9-29fd-4ab9-a05b-08d9ef976f13
x-ms-traffictypediagnostic: VI1PR03MB6528:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR03MB65280883011EAB4C2C11C5A5E7339@VI1PR03MB6528.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Ao2B1hP/ROLxHhxMIx05lan14eV7o01qmGxYMUcjgGbzbodBMySCPVla2QhAIQJjOiufz5c7YIeIJimc5RctN41eDHTZnVxAxwPAyKPWIhs3S+SvcR3pnpenVQJO3AVmUjm2oYB1YK4p8PtarJE9KCTYBVVAV3eBOUKyqwIWvDfQc3MZc5F83l0b7oHdXLOXWQmsFvMal4aErlWPiXpYCUZCAlMZmVhCiJnIYWWaHms7cnYm/aNOl/bI+iFdFzJGcVHFBDCIBiX7vzL9lnUsrhQwdGlIQtq3ktP4zekS3meoSRohxNH5pZwwnB70nSFsciUu5eRsg0d6lBMpIvSIJLIxZQo0wv132sQfcf11x+J4ialGdrMnvqlrq41Ywoi8ouKtomevAr/DxV+8sA/47LTOTJS849SGEQizYp/l13sAUwVxoIu7lqkVLraYjejnWFI1L50IbN+C4LfbcSZ1v1ubpgCUrsUpR3OGpmrDF1HC1UdPOWKVTwDuDGm0ewwyFLzTd1Povg3oD1s0LakqxCk9KbF+kl9YMYWHhOXeeTUtXbtfncgZXFFchUf6PHgnXkJUDHFGXLS7u5ToD4f9Lcdcb6RxWVIz0JNmb6MngMG9e5vPXB87AlHEX9fFPbjnDMVRAIW2ttI9AUORRNMG9tEJVroOh26A9RPo+q6lDXyYtNWErC4EB43z9+FzIEJ+Pd3EE1qjEETuzCNt3N/9iB/qThjvu+vlQOjgLjlF6UrPQaqo3yUvgnS3dQUzbz7+
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(64756008)(86362001)(38070700005)(31696002)(122000001)(38100700002)(8676002)(76116006)(66446008)(66556008)(66476007)(4326008)(66946007)(6916009)(54906003)(316002)(91956017)(8936002)(5660300002)(2906002)(2616005)(53546011)(107886003)(186003)(26005)(83380400001)(508600001)(6486002)(55236004)(71200400001)(31686004)(36756003)(6512007)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NDZyVnR0RWNZekR4RTIzV2pKbXl1NXFoTUVvQTFxbXVOU2NJNmozdE8yaFlE?=
 =?utf-8?B?SlZ2R2lYK0tybmtLMmtuR0RXMmVVTHBEU2ZmTkV0Zk42RndaSEZOOStsdUtS?=
 =?utf-8?B?b28wNzkzZ1hpb2J1VkRIWkZNZGlUS0NjallUUCtvQ1hjUjQwbzNyWEVMS0lS?=
 =?utf-8?B?cmwzd3RTcU0zQ3V3Sk9na2UyRFdQMnFiRnpDc1lFL2k1MkJnU3Z6SUtzQUFK?=
 =?utf-8?B?Vm9QdG9paDVSb256dy9IWnF2c0MvelFsODdDemtRRmdCMCtiM2VjU2JkQ2pC?=
 =?utf-8?B?bVNXTkZRWHljMXpDQUU3VkZvcVVYaEwwTUllRTNBbTJrQ3NLdTdqVm5teHJG?=
 =?utf-8?B?Wi9vN0JxbHpQTlFWR2pDbEVaQXFibWZEdWNjbVV2cEpBTVp2MmYvZXNmUEln?=
 =?utf-8?B?cFRaUmNORUh5SjlDMUt0VUNsbGJ6M1pVQ0xBVEtDcjA3MkZHNGJ3d2lhVGpW?=
 =?utf-8?B?QmpKd01pMVFLOUJKNGE3ZTA1VGo1TVZBd1QyRjUvd1BlaG5nWjhtbzRCdHlM?=
 =?utf-8?B?UTQ3K0lNamN2TUdWMTBjN213WDZTVEtUZmNPbUxtdWoyLy9FNWl3SmpjNjVL?=
 =?utf-8?B?eXVvenU3UXVjOVAvTVVVN1pxOXJMRFYwMVpENnhvbHRoQ0p5MWRFNHQwVGV5?=
 =?utf-8?B?N0NocUVZY2ZTM1lGd1JwRmV4R0VBMEpxUkM1alo5RnRTenR1YUNIbXl3MWNF?=
 =?utf-8?B?MUU5bzhQU0MvT3hFSG5mcnZvYzlQRHA1UFlUSEFwb2xTd0VmamZQSTdHcUsr?=
 =?utf-8?B?dHM2c3VFYWlIWkk0WGJpNlJvS2QwVTlqNGRMTGtGYVdEUThyaHBpN1BPUjRw?=
 =?utf-8?B?Y1hYRVdoQ3FvV1lFK3dMeDQ1NGI3WkxNc0E5MlJpWHJESmx4d2JKV1BwejVn?=
 =?utf-8?B?bVlJU1loTUNoUVptMDN5emxWbXBmbUhFZGFBYVlxdGJ5dTNUYS90OVpVUWRK?=
 =?utf-8?B?V1p6TGZFTlVxSVVQSUZ3ZkNEaWszU3NkM3d4NFh2YnZDaWRmSU5sVHk0cDdt?=
 =?utf-8?B?R3JaQWU5V2VUZDhsVXUwVDVzcjY4SzNWQmFoWXdFblVHSUJOa2xRSVlWWFVa?=
 =?utf-8?B?N0NleWRURWc3S0ZSaHd1OVhwdWFqeTdXQXRsWUIrdzgvL0MxUWxFR0ZiRHAy?=
 =?utf-8?B?UmR0VHRJT3lrTjVyS2lZbFVtbi9hM3drWnByYXNRVEIwY2sxNmNRTm9nNVk1?=
 =?utf-8?B?NmI3Z1hTL2pad3h4bEx0T3hhZTVJay80WEZKNzg4b2thOGNvejlHb1pWVy82?=
 =?utf-8?B?QVl6bzVFUlg0cStaa1VzTkZEaHNhcFBBVTF0M3dFVERCYlM0dDdZcWt3bGVG?=
 =?utf-8?B?c0RKOVBaQW9JVTVpbjIvMXFQRUdrQ3NKRmdQT2wxakNEYWpVNnNPSTUveFJz?=
 =?utf-8?B?ZFNzVWFuYVd6eUFqdEN0T082MWJMNzZKa2E1RmFsbERRWDIxaE1pQ3BSc3Q0?=
 =?utf-8?B?amhvS25SdTlSenVFMjFsQUdWMkUzV0pmcDZlazdLQ1AxZ1kxT3E0bVlhc1I1?=
 =?utf-8?B?S2tvQUpTSG9xblRFNEJXem9oakhHS2doKyt2Q0cxY05NTi9KYkdOWWJPZGk1?=
 =?utf-8?B?UzRNWkpiUjBFUXR2dzRsd1RoeG5vamVyM0V3MjB3ZmtycGJZTmV4MWNzZVhG?=
 =?utf-8?B?YUk2aXRxRElOaU5nRWI1ZU1rUVBIRExDUHBla1RXdjBVek5BVnVjTGhQRXl3?=
 =?utf-8?B?UEUvWS9lazFOU0ZSTTNpVEZDK1NTQWdBWUE2dHVwdm1IVkwyREFDNUsrVHBm?=
 =?utf-8?B?ZTVWV2VhNUdYZHU3U1FNT0hmbVlCV3pka2lwcnJWWVM0UnRma3JWcGd5RE9B?=
 =?utf-8?B?ak9PODFpKzNFT0VRZkxlZEpLVHZSVVdnMzE2MUxKWHZQNUNXak00SVBWdEJa?=
 =?utf-8?B?L2xVR1U3QXhPaHZFN1Q1ckdqMk1VUkxOVVdGU25nQkJzQkVJSktkQzVRY0Rs?=
 =?utf-8?B?QTFXMFVqSEdkQzFTZGx4Rnh5dnNDVng1aXoxZ3hqUGdXV0Y4a3FtNTBJNHp5?=
 =?utf-8?B?aHMvalpYczkzYSthcDdlOXJia2ZUSjlpMTYwTVYvcnNWTnMyQzhoaW1sNDlK?=
 =?utf-8?B?VlhTMFNGRU05dzBSOWlvNW5udGk4eDlwVlVnLzBPZUVidzcranRoSVRkVTRS?=
 =?utf-8?B?ekQzYmNWaktMQUM0M0puSkRwMEoxWjk5R0RkZjUzekw5aThIb3FySFM1S3pP?=
 =?utf-8?B?elU2U1RhRk5jTkRxejFrNE53V2JEeVZ2VkkyeWVmaGo3cHUrV1dhN284U0NW?=
 =?utf-8?B?c2dnZEk2UldTOVdRdTVQbzJ2aHZseWpDTjNrZEE2ZGxMRHBnVUNoZ0RIcGhF?=
 =?utf-8?B?Zzh6Y0NoaTRGd2lLVGMwMHk0bnVDV1dneDZDbmN3M24raTFHMXUwZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <96D793DBFEDA8746BD1123B81510C54B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e0c9cb9-29fd-4ab9-a05b-08d9ef976f13
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 08:53:13.1355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IR8gd5raoVTXKUwQI7ZbsccOr72jZCMH6AZauL90JGWThxTbu61R4GNMMxx/yubS8iV18LMI8wPDgfzQIB3U9V5QgCxCvlauZDGyuA+amI58TpYSpWqLY3Aq/BT58Ji7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6528
X-Proofpoint-GUID: JuBgX6d7SnQrd0HdiUMG0Bb_hMxqYaSp
X-Proofpoint-ORIG-GUID: JuBgX6d7SnQrd0HdiUMG0Bb_hMxqYaSp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_01,2022-02-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140054

DQoNCk9uIDE0LjAyLjIyIDEwOjQ3LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24s
IEZlYiAxNCwgMjAyMiBhdCAwNjozMzowN0FNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAxMS4wMi4yMiAxNzo0NCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4+PiBPbiBGcmksIEZlYiAxMSwgMjAyMiBhdCAxMjoxMzozOFBNICswMDAwLCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gT24gMTEuMDIuMjIgMTM6NDAsIFJvZ2VyIFBh
dSBNb25uw6kgd3JvdGU6DQo+Pj4+PiBPbiBGcmksIEZlYiAxMSwgMjAyMiBhdCAwNzoyNzozOUFN
ICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBIaSwgUm9nZXIh
DQo+Pj4+Pj4NCj4+Pj4+PiBPbiAxMC4wMi4yMiAxODoxNiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4+Pj4+Pj4gT24gV2VkLCBGZWIgMDksIDIwMjIgYXQgMDM6MzY6MjdQTSArMDIwMCwgT2xl
a3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+Pj4+Pg0K
Pj4+Pj4+Pj4gSW50cm9kdWNlIGEgcGVyLWRvbWFpbiByZWFkL3dyaXRlIGxvY2sgdG8gY2hlY2sg
d2hldGhlciB2cGNpIGlzIHByZXNlbnQsDQo+Pj4+Pj4+PiBzbyB3ZSBhcmUgc3VyZSB0aGVyZSBh
cmUgbm8gYWNjZXNzZXMgdG8gdGhlIGNvbnRlbnRzIG9mIHRoZSB2cGNpIHN0cnVjdA0KPj4+Pj4+
Pj4gaWYgbm90LiBUaGlzIGxvY2sgY2FuIGJlIHVzZWQgKGFuZCBpbiBhIGZldyBjYXNlcyBpcyB1
c2VkIHJpZ2h0IGF3YXkpDQo+Pj4+Pj4+PiBzbyB0aGF0IHZwY2kgcmVtb3ZhbCBjYW4gYmUgcGVy
Zm9ybWVkIHdoaWxlIGhvbGRpbmcgdGhlIGxvY2sgaW4gd3JpdGUNCj4+Pj4+Pj4+IG1vZGUuIFBy
ZXZpb3VzbHkgc3VjaCByZW1vdmFsIGNvdWxkIHJhY2Ugd2l0aCB2cGNpX3JlYWQgZm9yIGV4YW1w
bGUuDQo+Pj4+Pj4+IFNhZGx5IHRoZXJlJ3Mgc3RpbGwgYSByYWNlIGluIHRoZSB1c2FnZSBvZiBw
Y2lfZ2V0X3BkZXZfYnlfZG9tYWluIHdydA0KPj4+Pj4+PiBwY2lfcmVtb3ZlX2RldmljZSwgYW5k
IGxpa2VseSB3aGVuIHZQQ0kgZ2V0cyBhbHNvIHVzZWQgaW4NCj4+Pj4+Pj4ge2RlfWFzc2lnbl9k
ZXZpY2UgSSB0aGluay4NCj4+Pj4+PiBZZXMsIHRoaXMgaXMgaW5kZWVkIGFuIGlzc3VlLCBidXQg
SSB3YXMgbm90IHRyeWluZyB0byBzb2x2ZSBpdCBpbg0KPj4+Pj4+IGNvbnRleHQgb2YgdlBDSSBs
b2NraW5nIHlldC4gSSB0aGluayB3ZSBzaG91bGQgZGlzY3VzcyBob3cgZG8NCj4+Pj4+PiB3ZSBh
cHByb2FjaCBwZGV2IGxvY2tpbmcsIHNvIEkgY2FuIGNyZWF0ZSBhIHBhdGNoIGZvciB0aGF0Lg0K
Pj4+Pj4+IHRoYXQgYmVpbmcgc2FpZCwgSSB3b3VsZCBsaWtlIG5vdCB0byBzb2x2ZSBwZGV2IGlu
wqAgdGhpcyBwYXRjaCB5ZXQNCj4+Pj4+Pg0KPj4+Pj4+IC4uLkkgZG8gdW5kZXJzdGFuZCB3ZSBk
byB3YW50IHRvIGF2b2lkIHRoYXQsIGJ1dCBhdCB0aGUgbW9tZW50DQo+Pj4+Pj4gYSBzaW5nbGUg
cmVsaWFibGUgd2F5IGZvciBtYWtpbmcgc3VyZSBwZGV2IGlzIGFsaXZlIHNlZW1zIHRvDQo+Pj4+
Pj4gYmUgcGNpZGV2c19sb2NrLi4uLg0KPj4+Pj4gSSB0aGluayB3ZSB3aWxsIG5lZWQgdG8gbWFr
ZSBwY2lkZXZzX2xvY2sgYSByd2xvY2sgYW5kIHRha2UgaXQgaW4gcmVhZA0KPj4+Pj4gbW9kZSBm
b3IgcGNpX2dldF9wZGV2X2J5X2RvbWFpbi4NCj4+Pj4+DQo+Pj4+PiBXZSBkaWRuJ3QgaGF2ZSB0
aGlzIHNjZW5hcmlvIGJlZm9yZSB3aGVyZSBQQ0kgZW11bGF0aW9uIGlzIGRvbmUgaW4gdGhlDQo+
Pj4+PiBoeXBlcnZpc29yLCBhbmQgaGVuY2UgdGhlIGxvY2tpbmcgYXJvdW5kIHRob3NlIGRhdGEg
c3RydWN0dXJlcyBoYXMgbm90DQo+Pj4+PiBiZWVuIGRlc2lnbmVkIGZvciB0aG9zZSB1c2UtY2Fz
ZXMuDQo+Pj4+IFllcywgSSBkbyB1bmRlcnN0YW5kIHRoYXQuDQo+Pj4+IEkgaG9wZSBwY2lkZXZz
IGxvY2sgbW92ZSB0byByd2xvY2sgY2FuIGJlIGRvbmUgYXMgYSBzZXBhcmF0ZQ0KPj4+PiBwYXRj
aC4gV2hpbGUgdGhpcyBpcyBub3QgZG9uZSwgZG8geW91IHRoaW5rIHdlIGNhbiBwcm9jZWVkIHdp
dGgNCj4+Pj4gdlBDSSBzZXJpZXMgYW5kIHBjaWRldnMgbG9ja2luZyByZS13b3JrIGJlaW5nIGRv
bmUgYWZ0ZXI/DQo+Pj4gSWRlYWxseSB3ZSB3b3VsZCBsaWtlIHRvIHNvcnQgb3V0IHRoZSBsb2Nr
aW5nIG9uY2UgYW5kIGZvciBhbGwuIEkNCj4+PiB3b3VsZCBsaWtlIHRvIGJlIHN1cmUgdGhhdCB3
aGF0IHdlIGludHJvZHVjZSBub3cgZG9lc24ndCB0dXJuIG91dCB0bw0KPj4+IGludGVyYWN0IGJh
ZGx5IHdoZW4gd2UgZGVjaWRlIHRvIGxvb2sgYXQgdGhlIHBjaWRldnMgbG9ja2luZyBpc3N1ZS4N
Cj4+IE9rLCBzbyBJJ2xsIHN0YXJ0IGNvbnZlcnRpbmcgcGNpZGV2cyBpbnRvIHJ3bG9jayB0aGVu
DQo+IFNvcnJ5LCBtYXliZSBJIGRpZG4ndCBleHByZXNzIG15c2VsZiBjb3JyZWN0bHksIHNpbmNl
IHRoZSBjdXJyZW50DQo+IHNlcmllcyBkb2Vzbid0IGxlYWQgdG8gYSBmdW5jdGlvbmFsIGltcGxl
bWVudGF0aW9uIG9mIHZQQ0kgZm9yIGRvbVVzIEkNCj4gd291bGQgYmUgZmluZSB3aXRoIHBvc3Rw
b25pbmcgdGhlIGxvY2tpbmcgd29yaywgYXMgbG9uZyBhcyB0aGUNCj4gY3VycmVudGx5IGludHJv
ZHVjZWQgY29kZSBkb2Vzbid0IG1ha2UgaXQgYW55IHdvcnNlIG9yIGV4dGVuZCB0aGUNCj4gbG9j
a2luZyBzY2hlbWUgaW50byBuZXcgcGF0aHMsIGJ1dCBtYXliZSB0aGF0J3Mgbm90IHZlcnkgaGVs
cGZ1bC4NCkluZGVlZCwgSSBtaXN1bmRlcnN0b29kIHlvdSBwcm9iYWJseS4gR3JlYXQsIHNvIHdl
IGNhbiBjb250aW51ZQ0Kd29ya2luZyBvbiB0aGUgdlBDSSBzZXJpZXMgd2hpY2ggd2hlbiBhY2Nl
cHRlZCB3aWxsIHVuYmxvY2sNCk1TSS9NU0ktWCB3b3JrIHdoaWNoIGRlcGVuZHMgb24gdlBDSS4g
VGhlbiwgaW4gcGFyYWxsZWwgd2l0aCBNU0lzLA0Kd2UgY2FuIHN0YXJ0IHJlLXdvcmtpbmcgcGNp
ZGV2cyBsb2NraW5nLg0KPg0KPiBUaGFua3MsIFJvZ2VyLg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

