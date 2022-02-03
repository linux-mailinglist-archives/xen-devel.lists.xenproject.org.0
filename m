Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFA44A8410
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 13:49:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264693.457884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFbXu-0007fg-UO; Thu, 03 Feb 2022 12:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264693.457884; Thu, 03 Feb 2022 12:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFbXu-0007cy-QQ; Thu, 03 Feb 2022 12:49:06 +0000
Received: by outflank-mailman (input) for mailman id 264693;
 Thu, 03 Feb 2022 12:49:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ArrP=SS=epam.com=prvs=403311c35b=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFbXt-0007cs-Jp
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 12:49:05 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa87b4f4-84ef-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 13:49:04 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 213CcdcP015031;
 Thu, 3 Feb 2022 12:49:00 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e0f7v0127-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 12:48:59 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7591.eurprd03.prod.outlook.com (2603:10a6:20b:41a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 12:48:56 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 12:48:55 +0000
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
X-Inumbo-ID: aa87b4f4-84ef-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAjXGd+bXzn2Qs4RxPA39mM9AczXk4fBLBCCFzDGRLSQhAkWSdYJ00f0zdDR8YgGot+3S37jPbSJrvSAzOyTZOcLvsiLZ2sp/bMvZJt4puhBNn1g9IAq/EPKV9OH7bxd7/+kQpQMaifPV4tFeOt5EsxLiWnczEDA7tk5gS8ffRaMmPL2O6Ps/Tkpoa1vo3dMiIHNuyXkdGlrX03Y2x4F1WqwNTmodeNLgunOy8RtIWGJITkV+rhWQL6ss8mIb1dMhTVucGpt7j0NJtSlFn+rZmVAg3VP8QAFAIY6DIch69MBzSppW9SZUeOVzXfbo/Pc/M6BBrlIYyJnc0FMKIrKNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mkvfkhkUEtBIkeEMGL9DIm0b6r7kWg1A5PuG0YtxrQ=;
 b=Ny44nBjcFC8V1bwtKTwFOcsyp83LJoEZ8ytO03ix2Gby26+Wlf4r98dw1WNKwsIpUwkQ9hhKfUx9hhcxeMhNwLOvwY3q8RTMsG2K/0okM/0BLyfLhqmEuRMdzujid+wsMgGDQfrY+S6UB/NMSuagX8GA+ornruGkiAtIEYxN6ON0D/xhleaACOmdPKBH4udk8zuq/FR54s4mG13JvgV/UGhq2v/9EfckYmAuj4tAjzwZ4/epjUwscYzs9rxaOk9xBibhDUv3cestta97GP2WM4nykCnkN0L5CMuCDUC+7qr5rUoxpZe+7bhQm9W/w8Y2fKJfZCp1/2g+YrU5OYNu0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mkvfkhkUEtBIkeEMGL9DIm0b6r7kWg1A5PuG0YtxrQ=;
 b=ZmLqoujrpxnHPDuvi4kou1eOi+1/CAnboOHgCUAm3OxhmPVxsYdJIkcSboS4+3IIdCXsxngWaZpeYfxtlmbmaPY6ASfV88aqpCkRK0HSBOJ/ovI0gr0+fnenwYrSr8DU/JlMBpTFsyW4zftsqGH6TxpToeRp+DUmJGk6qdCBfhpaE0rEGmb8RQROQodFhjjsT5DlgncwqlRc1akjSffswg2fnCl7AnaM9JEl+e9efNNAsJeGACukViqe4pKCP4LiOnJLFT/6sbfEhx6I29bdaSVdLyACr6sh5/vzz26Al7OKdmMSTkjTW36uinz6QFH6HKd4SJjt5Qg8qdgpcOGoYg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>, Rahul Singh <rahul.singh@arm.com>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHX4ewHyWAyD811HEGp8pIjUuVWNawUby8AgAFMuICAbHV4AIAAAlkAgAABPoA=
Date: Thu, 3 Feb 2022 12:48:55 +0000
Message-ID: <c9e7b16f-db9e-e86b-a5b1-ca87d5fb6609@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com>
 <34FC3FE6-EBA8-4A5C-A1F3-1E9F98C0337F@arm.com>
 <a6ee236b-5a00-8116-c744-6c94fcf46ae1@epam.com>
 <571d7660-c091-ac41-5e3c-441b4c5a1679@epam.com>
 <8ac4e23d-afcd-d965-fab0-b437baef8172@suse.com>
In-Reply-To: <8ac4e23d-afcd-d965-fab0-b437baef8172@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: deee9969-18f9-44dc-20d6-08d9e7138a47
x-ms-traffictypediagnostic: AM9PR03MB7591:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB7591DD5A3BC9CB1E88780BAEE7289@AM9PR03MB7591.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MbpEV4J8pu5DWew/PpTyV3l1bPsyQ1GNdMA3uK5jLt7EDhALhWleR1/1bLp5cD9MR74EwLEankZjPMo1ZoJU+bmsF3Sptdh9lxCFz+sg2JZWzX8HeOmsOOWuhLchmsQpuaMwrr8mTZ/Nj+xWLI9zsEnvLIX91+bZzPPu39Jd7SVJ+nYvJ5wkHKlXU+aEul6r+EpZmyR7DvBj8qZiYcY/O+DYJGrTPM8OHXKtFFGkzgR4oKJOg6b0n+Qnv9TwhPINdviaq3oiUWk2xb0sHAGvFgrYgtLZOHLQkxT3IYd+wWY6G/2iUejfNG+xtZBQc1YNT6buCNexGLIwFBTsSN1wSX4wBrwUQaeYyfNgosHPpre1I9DsRosCk3LDLSPtbX7H5H6CCsh4DMgkmcJYDsaF78YYXMuaf/Emx8Rt0SUlHS+CnkvlqbID9AOPoqfbHMN9qFgGRr70fyRTzCx9suXGsOaYDgY70JN3nSD4gIf00bpHzBDCTyN1+j7iEov+siSTeo/58Uv3lov78BF26o3hJu0Bx/MW7KaFh7FqBH0c85NsBqc7Mzj+Uw8dXddW0fzaYm723fDyF/+0R8dWWPBBQ3IlboJBeAgaOf8GsRd8BlNB//To3nR1F4FrGlt9uHkKABf4vqMb6/em1oFzBFW9Gejt1fWuIUq0rSO5/XPQ6OVVu4xJ6vo9ZFHRJHP7E80xrGnQZOu05xK7JmKEApd2MubPdvAIamZCU+oihpeMW8I/YSzojdE/+7Xk+env2O3/
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(66476007)(91956017)(76116006)(5660300002)(64756008)(38070700005)(66946007)(122000001)(8936002)(66446008)(31696002)(2906002)(7416002)(86362001)(8676002)(4326008)(107886003)(31686004)(2616005)(26005)(71200400001)(53546011)(6916009)(83380400001)(186003)(508600001)(316002)(6512007)(6506007)(54906003)(38100700002)(36756003)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UVRDRDBVLzc0U0pWVUtFL3VOYUFqT3diVFZjdlQ2a2tJb3lNTThacjBMMUUz?=
 =?utf-8?B?V0cxZkZjMnJHMlRxWnViYkFpcEwvZlpqcFMzaGVQOWFqWmxZdGR5SjBuRnVY?=
 =?utf-8?B?djNXWS9WeFJ5WUFIS0taa1pJWkdCZytlK0t1MERQNUxZc0dWZUtTd2RQK1Ny?=
 =?utf-8?B?VTIwWWVaN1dSSXVzN3NkQ2NJaU1RRDk5U21JdnRUTU1qWkF5bEFzdnZ6cjZH?=
 =?utf-8?B?NHFjdzNieHBZcjk2c21xT1VpOU4vays4VDB6cEZhcXR4WWY4dGRmTEZpWmJN?=
 =?utf-8?B?OGlmRDNaWmttc1FZRUkyMHhuemlkbDhocWRVY3huU29sdEVJeEM0UWRpK2U4?=
 =?utf-8?B?U2swdkU4RzhNS0p3YVlZMTdpVDZDMTUrWDJoZFZSWEhibjBIZ3VaVWxLZXJU?=
 =?utf-8?B?ekp2RjlpNnVqMlhHU0tqQ0w0RVErMUhWeXFVNXJoR2JFblBobmR3WWxUMU9v?=
 =?utf-8?B?bTRUUTVINWU3RFVoM0oyTXZXSUwwZHlTbkYrZkVUdUdWbmwzbC82TjhMWXdT?=
 =?utf-8?B?eWYwNmw5WHYvSFhMUk4xMnlhUUt5YVNaeHIwTGZkdVlVMFhVbUJmRzNxd0t2?=
 =?utf-8?B?WUkydHJnanpmODNTUEkrOHg2UWZNYVdXSTBVY1h5WldXczVzOGpJZDRXM0xo?=
 =?utf-8?B?STZWMUUrOHhhK05yK09XWUdBVXRoN0lQWWhCb2VqL2diZER5VHVwRk1aMWhm?=
 =?utf-8?B?L2RvT2NRVXp5YjZyMzl0aXNvL3Uyei9ZR1haSkZld09rVkFDVm9MU3ZPc2Qw?=
 =?utf-8?B?VCtCa2lNd3d6ZGJWRGNTR05ZekdhTVVlQ0Vkdkxka2xZSzdJU0VoV2JaZSs5?=
 =?utf-8?B?N3NwSUduR2E1bWJRL0Y4R1hiMk1iNnBjTjI0Z1drL1M2OFYybmROM1Y3TGc5?=
 =?utf-8?B?SEh0MHBnRzZ2eHhGSU9oa1hETTZ1aWh0OWkrdStvdWFiZFZiY2tjQ2JTcWFL?=
 =?utf-8?B?eFBncnZwOTRoMUhXMWlaYW1rdWtEclA5UzR3aFhTOGdiMzV2YVJSelFpeFBr?=
 =?utf-8?B?dVkzblBZM0RLRjJsczJLU1c1WHJGTFo5czQ3K1ByWUZKblZjbFRXRnhIVFkz?=
 =?utf-8?B?OWVTUmhJM09JM0VNTGM1ZkJYbzRLSlNSbnNUVUNCTUJ3b2QxcGlIbWoxbVk3?=
 =?utf-8?B?RXNDbUw1UUFLMHlNUzg0WjZZcXZJZXhvK2pZa05RU3dpQ041Z0hGd081d2Ru?=
 =?utf-8?B?dDBrTWlRcmdBakVIL1RlaUROOW5DVEZGYlYwVzVtK3dqMHRvU2kva24rZjFW?=
 =?utf-8?B?ZzIzYVdqZkpYZ2g2aFN5aXhscUlydnBpMXpsNC8rUXJxcmI3MVErRDAyVmth?=
 =?utf-8?B?UmxoblpIR21MMmVGMUlnaW9zOGo4R1l5TkdoRFltTHBnZHdoaksxblpReDcw?=
 =?utf-8?B?dkxDZ203L2FVaFc0bUxVQjNrTys3QS9hS04zdGFpeGV2ZHRkaDhGY0VEUFFu?=
 =?utf-8?B?Y0VHZG5RVjV3em5NZnIzRXpYOXh1aGp1eHFBNmRIcnB0c2RaSWJVN3dLM0RC?=
 =?utf-8?B?RjhPOHZybVBkR3dIaTllbkVXemVseGZrNEtwei9zalhDU3BnUzdta0tFTzc3?=
 =?utf-8?B?YUFIbHhmQUc2VUZZWGozMWZmWHB1K1Y1cGw4bnhHTm5VbjRjd3BEVUtoMlVt?=
 =?utf-8?B?OERHTVdLcS9ka1ZKa0N0N1R0WkVVRFB4YTdLOXN6M0JUb3NJUCtjdSt2QmR5?=
 =?utf-8?B?WnV2L3I5SFIyTzBDc0pkUmJOZXozb2NvWUc3MGk3YitKbVlHM0VBWjUzSmNu?=
 =?utf-8?B?emJyOE1WNitMekJsdnVWU05haHRxVE5IdmZxZnM5cjJ2NzVucmRXMjlYM1lo?=
 =?utf-8?B?NlplbE5tN2Y3Q3ExSmtzTTZFbXQzNHBjZk04ME5zVzFIa0V0VlBpV0tEcHZO?=
 =?utf-8?B?TndKcHZEQm9razFrbnRmZnZmeGZJUlAzNGI4QWxMM0ZMSTFPeVo3am5TRWov?=
 =?utf-8?B?cjFLWFd4cmhuZ3pqMm5sOGQ5dGRxRkZFMlU5SFJScUxoR0JIUjFiVmdFVmZI?=
 =?utf-8?B?OFhINGZxbWNneDMrc1FmcUVBa1NQV0ZYUzB1ck1OTjVjRDRxYVBIeVQ2bVdG?=
 =?utf-8?B?bHNuVnRWMXg0Y2IwNk5KT21FSWdaeWdRUXJaK2Fjd3lTU1BrSk9FdHU0enVr?=
 =?utf-8?B?aVV4TG5qVElGT1hnam5wMnY3QmlZUnpvbXgrTjZBUm8vRkdpWi81YnlydlNY?=
 =?utf-8?B?WWlsdVpNZVZlWERBN0N3cE94dGJKcUdzb3VqVlVSeVFuam1nZ0Y3M3lRZ0Vr?=
 =?utf-8?B?bUhuaGdSeUJpK2NsMjMxQ2tEc2FhcnZFUnpUcjVXblh4NnFQK010dDhSc3Vt?=
 =?utf-8?B?ZjFJQzZiMDRHTkVYSE9pTFk3dTZDMy94dTQ2emoraWR1K0NkS25jQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BCA9F942797A14FBF2EB01F1F63F964@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deee9969-18f9-44dc-20d6-08d9e7138a47
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 12:48:55.8854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xAaAlV1hNnwqFuUnAtnFvtVf37xQnv1GvutZpJYjwItAosqi7MgDfSv+IJNdXeQ4IAlnqaVeBcl7fkdgHUBuvXbGGxaotFMKN3VWs8zUSkSTUIRgmv8e3wx8TwmlYPuE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7591
X-Proofpoint-GUID: S5BhkL1HiM9_VWRJze03sGhhZSMJ_WNY
X-Proofpoint-ORIG-GUID: S5BhkL1HiM9_VWRJze03sGhhZSMJ_WNY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_03,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=3 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=154 mlxscore=3
 malwarescore=0 spamscore=3 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030080

SGksIEphbiENCg0KT24gMDMuMDIuMjIgMTQ6NDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAw
My4wMi4yMDIyIDEzOjM2LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IEhpLCBC
ZXJ0cmFuZCENCj4+DQo+PiBPbiAyNi4xMS4yMSAxNDoxOSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gd3JvdGU6DQo+Pj4gSGksIEJlcnRyYW5kIQ0KPj4+DQo+Pj4gT24gMjUuMTEuMjEgMTg6Mjgs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+IEhpIE9sZWtzYW5kciwNCj4+Pj4NCj4+Pj4+
IE9uIDI1IE5vdiAyMDIxLCBhdCAxMTowMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPGFuZHIy
MDAwQGdtYWlsLmNvbT4gd3JvdGU6DQo+Pj4+Pg0KPj4+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pj4NCj4+Pj4+
IEFkZCByZWxldmFudCB2cGNpIHJlZ2lzdGVyIGhhbmRsZXJzIHdoZW4gYXNzaWduaW5nIFBDSSBk
ZXZpY2UgdG8gYSBkb21haW4NCj4+Pj4+IGFuZCByZW1vdmUgdGhvc2Ugd2hlbiBkZS1hc3NpZ25p
bmcuIFRoaXMgYWxsb3dzIGhhdmluZyBkaWZmZXJlbnQNCj4+Pj4+IGhhbmRsZXJzIGZvciBkaWZm
ZXJlbnQgZG9tYWlucywgZS5nLiBod2RvbSBhbmQgb3RoZXIgZ3Vlc3RzLg0KPj4+Pj4NCj4+Pj4+
IEVtdWxhdGUgZ3Vlc3QgQkFSIHJlZ2lzdGVyIHZhbHVlczogdGhpcyBhbGxvd3MgY3JlYXRpbmcg
YSBndWVzdCB2aWV3DQo+Pj4+PiBvZiB0aGUgcmVnaXN0ZXJzIGFuZCBlbXVsYXRlcyBzaXplIGFu
ZCBwcm9wZXJ0aWVzIHByb2JlIGFzIGl0IGlzIGRvbmUNCj4+Pj4+IGR1cmluZyBQQ0kgZGV2aWNl
IGVudW1lcmF0aW9uIGJ5IHRoZSBndWVzdC4NCj4+Pj4+DQo+Pj4+PiBST00gQkFSIGlzIG9ubHkg
aGFuZGxlZCBmb3IgdGhlIGhhcmR3YXJlIGRvbWFpbiBhbmQgZm9yIGd1ZXN0IGRvbWFpbnMNCj4+
Pj4+IHRoZXJlIGlzIGEgc3R1YjogYXQgdGhlIG1vbWVudCBQQ0kgZXhwYW5zaW9uIFJPTSBoYW5k
bGluZyBpcyBzdXBwb3J0ZWQNCj4+Pj4+IGZvciB4ODYgb25seSBhbmQgaXQgbWlnaHQgbm90IGJl
IHVzZWQgYnkgb3RoZXIgYXJjaGl0ZWN0dXJlcyB3aXRob3V0DQo+Pj4+PiBlbXVsYXRpbmcgeDg2
LiBPdGhlciB1c2UtY2FzZXMgbWF5IGluY2x1ZGUgdXNpbmcgdGhhdCBleHBhbnNpb24gUk9NIGJl
Zm9yZQ0KPj4+Pj4gWGVuIGJvb3RzLCBoZW5jZSBubyBlbXVsYXRpb24gaXMgbmVlZGVkIGluIFhl
biBpdHNlbGYuIE9yIHdoZW4gYSBndWVzdA0KPj4+Pj4gd2FudHMgdG8gdXNlIHRoZSBST00gY29k
ZSB3aGljaCBzZWVtcyB0byBiZSByYXJlLg0KPj4+PiBJbiB0aGUgZ2VuZXJpYyBjb2RlLCBiYXJz
IGZvciBpb3BvcnRzIGFyZSBhY3R1YWxseSBza2lwcGVkIChjaGVjayBjb2RlIGJlZm9yZQ0KPj4+
PiBpbiBoZWFkZXIuYywgaW4gY2FzZSBvZiBpb3BvcnRzIHRoZXJlIGlzIGEgY29udGludWUpIGFu
ZCBubyBoYW5kbGVyIGlzIHJlZ2lzdGVyZWQgZm9yIHRoZW0uDQo+Pj4+IFRoZSBjb25zZXF1ZW5j
ZSB3aWxsIGJlIHRoYXQgYSBndWVzdCB3aWxsIGFjY2VzcyBoYXJkd2FyZSB3aGVuIHJlYWRpbmcg
dGhvc2UgQkFScy4NCj4+PiBZZXMsIHRoaXMgc2VlbXMgdG8gYmUgYSB2YWxpZCBwb2ludA0KPj4g
U28sIHdpdGggdGhlIGFwcHJvYWNoIHdlIGhhdmUgZGV2ZWxvcGVkIHRoZXNlIGRheXMgd2Ugd2ls
bCBpZ25vcmUgYWxsIHdyaXRlcw0KPj4gYW5kIHJldHVybiB+MCBmb3IgcmVhZHMgZm9yIGFsbCB1
bmhhbmRsZWQgb3BzLCBlLmcuIHRob3NlIHdoaWNoIGRvIG5vdCBoYXZlIGV4cGxpY2l0DQo+PiBy
ZWdpc3RlciBoYW5kbGVycyBlbXBsb3llZC4gVGh1cywgdGhpcyBjYXNlIHdpbGwgZmFsbCBpbnRv
IHVuaGFuZGxlZCBjbGF1c2UuDQo+IEV4Y2VwdCB0aGF0IEkgZ3Vlc3MgQkFScyBhcmUgc3BlY2lh
bCBpbiB0aGF0IHJlYWRzIG1heSBub3QgcmV0dXJuIH4wLA0KPiBvciBlbHNlIHRoZSBsb3cgYml0
cyBjYXJyeSBhIG1lYW5pbmcgd2UgZG9uJ3Qgd2FudCB0byBjb252ZXkuIFVudXNlZA0KPiBCQVJz
IG5lZWQgdG8gYmUgaGFyZC13aXJlZCB0byAwLCBJIHRoaW5rLg0KU28sIHlvdSBtZWFuIHdlIHNo
b3VsZCBoYXZlIDIgc2V0cyBvZiBCQVIgaGFuZGxlcnMgZm9yIGd1ZXN0czoNCjEuIG5vcm1hbCBl
bXVsYXRpb24gKHRoZXNlIGFyZSBpbXBsZW1lbnRlZCBpbiB0aGlzIHBhdGNoKQ0KMi4gYWxsIG90
aGVyIEJBUnM6IHJlYWQgMC9pZ25vcmUgd3JpdGUgZm9yIGFsbCBvdGhlciBCQVJzLCBpbmNsdWRp
bmcgUk9NLCBJTyBldGMuDQoNCklzIHRoaXMgd2hhdCB5b3UgbWVhbj8NCj4gSmFuDQo+DQpUaGFu
ayB5b3UsDQpPbGVrc2FuZHI=

