Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDF3475845
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 12:58:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247340.426486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxSuN-0008SN-D0; Wed, 15 Dec 2021 11:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247340.426486; Wed, 15 Dec 2021 11:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxSuN-0008Q4-91; Wed, 15 Dec 2021 11:57:19 +0000
Received: by outflank-mailman (input) for mailman id 247340;
 Wed, 15 Dec 2021 11:57:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9HFQ=RA=epam.com=prvs=2983c13036=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mxSuL-0008Pw-DH
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 11:57:17 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24120160-5d9e-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 12:57:14 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BFBmlJ4030002;
 Wed, 15 Dec 2021 11:57:04 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cyftdg11p-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 11:57:03 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5796.eurprd03.prod.outlook.com (2603:10a6:208:156::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 15 Dec
 2021 11:57:00 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55%6]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 11:56:59 +0000
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
X-Inumbo-ID: 24120160-5d9e-11ec-85d3-df6b77346a89
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ri6uvVlTC0sjj3qQJoAaVqtClM4Oc3xir77Rc2mj3M7983yZ9agw1WlRCvesTI/i8a+nOIqOupfyrK09aZbc4YTPaReGxfhD+5+mpR6mdfSvQP8RTMNLIRLqQeaHIDFN7msQ73Cog9SvUOOxmMqgaEJWcfpRIWnmOltHxJ4etUs7V6Wm9KIVvAksWAKTmJnld8e0ZelPmUwL3154sJwITfd6Wr+x4kaTFU54CcRUUbK8A31O4JhA+d8cFUkYcIaKOhCWJZFwkLGDT5HphLqChvRBc2R3Bb4uo6/ahadUp1y+YiXFR+Ch0ALGqIFqcEWepGG4CqxkAsNIVCobmsmyxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0bkVSVrmM/z5GDoxBP3lueyrdo2quxay8ie0YZLG6o=;
 b=CNFFpS3JyulEsvjJvtuq0MzlwnaL9hgL543Y7iubsFXBM9+wL9oxompl4hX1OvF91mXvlGziGQIssCosqnbjSPZPfx8E6RsDwpS5neG9GPoNrgBCN2NthowtUVKZoHiOsagvVjcyeurIQNtIw9nhjgeD5HD3tVkBegH9VLyzkrfzOPV4VnEd7Mhmh9pC0ZPU4scQcVjdIF0sU1EF+8wX32OxAzE7y6YGCuERPhCtPIY8dZY8b+S8f1Z1a1hJru5JmlMddDXxTAKDjorhv/tK7VSZ/Q2fnGALaH4ovj1LOHkpuhFf2GwYHjYNbH26STn5kq9M2EQmLF99AXE2NW8j5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0bkVSVrmM/z5GDoxBP3lueyrdo2quxay8ie0YZLG6o=;
 b=mJDzcHqaB1eXSDErzucJV5hbFzCHj2/0Lrx09J1Rf6Pckg0ZhumLBVExy+ZlytGx9Nupj73KXbWq7kjfydyEEzpft7Qdg0IqGB2amOWb4QuyLJ1zffBsFH6JUqCLDPFiEZP/BhubJqA9Ru/LSKsz0X4tvtHt1MPfpB9PdoX7C04iACwP8lMLGkhsxhghX4PspI9UQUQuhz71SWRJiYi3udI4Rcnxz17T7vN9uz5Pn0k2ieL7xmbnFzEYH1gt2XMvHFDIsrKeDvFhPOT2335kgcGoCyLbAVP3/8zkcKJeDVWYD1QWbrLUaF0Op40X84x9F6LJAc74QL0MSS+jXpo/aw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Wei Liu <wl@xen.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 00/14] PCI devices passthrough on Arm, part 3
Thread-Topic: [PATCH v5 00/14] PCI devices passthrough on Arm, part 3
Thread-Index: AQHX4ewD/fiBagJockWfLYQGw/ZN1KwzkeKA
Date: Wed, 15 Dec 2021 11:56:59 +0000
Message-ID: <3a9f16d5-f076-92e2-f1b9-33a3c1a3371b@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
In-Reply-To: <20211125110251.2877218-1-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b751625-5a25-431c-9b04-08d9bfc20054
x-ms-traffictypediagnostic: AM0PR03MB5796:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB579625D5131BAC98558E8841E7769@AM0PR03MB5796.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 R9IiXMz/0GaV4FHYvBj+Ta8+bQfjpICH/sq7tT/Y/gXN0DBwJFiXVl5T7mRF5IRSoJ/JRbdXkgdM3pDUvjMkIJZOJQruoEwaISdzuN4r4uJ6pdI+hz6XacoRWGNbPg5rQHP03xGzDhr3xqLKMQ8JCWkyXtNgHlqh2m+SFPzx/ZT+5zupX0d2SwVvuc2sTNWLcf7ih63DZcgwz0kRqke32XOpZ8Ykviyc2Nnb37iEeieaJLcHhz3s1heugnBaw7ej1qlV3qCYhahv10iR6vur+fMVFA0XrBYo0JG9BbQOHw1h5X90jdZgWlS2hlRWjmM/Rtk/UAY8OxOTx1fHxaLN+oCWn2+cejHd4D2Ja2NA8As7NPDnMWMvi3yT6yFKOZqzAA9zO33FXZBXl1OAl8HEvohTcbF9Ui9/T8ZsFaTu+oq4Umu+56znMJ8wiN3kyMSlMkI6S/fVOnKwqy7mNOA2O/E8b9oNAOCCZRjWyqQSA/GRmCbJ8TTfVJEbQ3ztVz/ig46OIYYlNlez+IrG0aOlHAJ7IIbHvY/coxq6FC1BNNvoPb+d/Tr6njF0XHW+XHpZqC2RA12Mq5NlXRqn5O970H6L00miy8XuERf0M2AZLsdjixxuwET7yZFl/+eHLziTX9BI8AOdvj50bxDyKS1dHi+KIw+vrEhgAAId1Sl4uzJVUYr1M2YLyH3eH3HmE/UMLscD2CdD3m7nJFJpCgwyLI/a0NdSYCaffsOel7Hv5cLlgSdaFb9yLA6KT9HpraJ0KYMhTs6R2R0FV3Cm2sx75fvhJjTvALjM9Xvfm7tBXpRvUs4cRbGVW7w2k/lONWHBJNqQ2ufr5e6mQbMW6uO0Qg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(66476007)(53546011)(66446008)(83380400001)(38100700002)(122000001)(5660300002)(86362001)(966005)(66946007)(110136005)(64756008)(107886003)(6486002)(6506007)(7416002)(31696002)(2906002)(6512007)(66556008)(71200400001)(91956017)(508600001)(36756003)(76116006)(8936002)(26005)(4326008)(186003)(316002)(8676002)(31686004)(38070700005)(54906003)(55236004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WUZZQzQ1dEdtMVZSb2xUc0s5U3A3NUp0WkJHZnJ0R0tMeGdGNk1iNExwaGJt?=
 =?utf-8?B?d2NRMXM0bzk0d3hHaXplSFJJNHptcng2ZlBJaFBPaEhaTUZNNGVmUmNUem85?=
 =?utf-8?B?aEEzVTRENjVtRjRpaVp1YVVqS2xyckVKOHViZTVSMGU2N01LTlRzVGgzRERn?=
 =?utf-8?B?TEZ6SEhYMUh4blJFcnpBWVloQ2dER01zSlpuK2U3ZTROdDNVZ3RCcFVlRUQ0?=
 =?utf-8?B?R1B6T0ZiaE1EbklxTkhXREhMeW9yTkh1MG1jRmgrUHhUTGp5NnBvV2hoVFE5?=
 =?utf-8?B?MW85K2x5c0FKZVY5Q2c4aFErRHZIbk9TS3NRVUxiYk1KRHkvbG1FcHRsYzhj?=
 =?utf-8?B?ZmxIdThweTBWMTZjU2dCV2s1amhsSHQ3RHJjd253UE5PbGRGSXgvTmR1T3R4?=
 =?utf-8?B?TnBGV3FvOXlwT0V1QnMyWTFHL3laWnhHOHR3aVVqaSt5R0V2eXlnMGIzOXM2?=
 =?utf-8?B?VXhyOC84Vm9FRXlUV3AwY2JUZDhKRVY0a3hEUTdrUERGdVJmRk1yQXVVMzNM?=
 =?utf-8?B?TktEYXJ1WmpqdmJ6dlBIUTVPaTdua2dZU0ZGRmFxaWhtSVJFTlEyYW4rSSsx?=
 =?utf-8?B?MEdkazBsQkdJakp0N2E3UHZWVzdlM2NxbUwyTzBVci9YNndUQmFnazNsQWVv?=
 =?utf-8?B?cG1jcExJTThLM0x0SURRZnN0V250UUVEd0FuYWFSeWY4REFiT2hoc1d6eWdY?=
 =?utf-8?B?T1I4R2hONit5Z1lxS0s2R0toaXdQM2x6T1JYbDRrMUREaFF4S09PVndENkow?=
 =?utf-8?B?SDg5aFJTZTAyc3FVQlNySW1pWEJBYnl0NE9rOWFTZ2h2ZjRERXA5U05iby9r?=
 =?utf-8?B?UWlEQ243WURmZ1JGZ3JPd0lqZWZKdlBSN3h1OTJpUlNVNm5XMCtxbU5GZ2pV?=
 =?utf-8?B?TTVWQjdhYy9vY3VOYzgwUUdZR0RDOVpkc3FiSVFiN1p0UVIxcVpkUk1ERDV4?=
 =?utf-8?B?aWZlUmlwQkdBU0tyMGt4R1ZiUG8xS1J4c2JSZzZtRys4czV5ODdpdXBHdk5l?=
 =?utf-8?B?Vm1Xd0pTL3FvRWRYYmt5ZTc0YktONXlna2xEZVdCaUI2dHlkQW11SHgvSldD?=
 =?utf-8?B?WFhJUmhYM0JwSGZESXJEWU9GQnVZZXZvMWJTVFhoemx0RVhKcEpreGQ4L2sv?=
 =?utf-8?B?ckg0VFlpNlhadi9yUXJraThLVFV3dlpmeDJnRjhCeUpmb0xrUDZPUjVnV1F6?=
 =?utf-8?B?dHBkOEJTQlBhVnVIYlJscENJSmd5UHRKcWxnd0Y4VndzakVGWm9pMHdyYitI?=
 =?utf-8?B?UzZFM3ZGMGgrZVREWEdFL3JZVExzTzY2TVc4K0pvVStxaFNYQTM1a1c4WC9D?=
 =?utf-8?B?SmxtQzVxVE5OWTJCeTVuQzJ6YmkrT2RCMW1jRFhPTnMyTythamVnN0JvdWtB?=
 =?utf-8?B?amh3S3FQUC9CWEdpd2grL3hsR0hneWkrSGhXWFR3SVdCc0NKSjltckVrMVBL?=
 =?utf-8?B?TkovZ3VwR2h6anYrdjM1Z29XK2ZHM1NaUmIvSlVZakM4TCtuY29rbHlkOWt0?=
 =?utf-8?B?TjdsM0tzbnVRRWF4eDVOb2NRd3ZCcUNReCsrU0MvS2N4TGxKMFgrQzV3RTJB?=
 =?utf-8?B?QXhValBFcm9pR3ZkOWVwTzZ1Y0crNFBlbU9BZTlZWDVkZE9jT3daTkFRdVNF?=
 =?utf-8?B?TjVtcmV6U3hNTk95QmxFR25HWXVYMHpSQ1lreTU2RStQTVcwbk9oNExUMVk4?=
 =?utf-8?B?L1dSMGJBSFFsT1I0RElpSmQrbXZ1aUhtc1hnQ3BEZmx1Y0gvblhRc25xU3JQ?=
 =?utf-8?B?K01YOTI4bGg1SFpGQWh5RXBYSWgyWWJ3Ym5vTU1WM3ZyRFJqY3pFazVlU3Rm?=
 =?utf-8?B?dzliZ1NUdmNLK3hEVTFuMnpzaDJIQlRUYmQ3K0lzUVZybWpveGJxU0I4YllI?=
 =?utf-8?B?MzFyeWViYU1rbDdJWE1wRjUzbUFMRHhScjZ3T09kb3J4THlRRXd5Q3owMTlH?=
 =?utf-8?B?cTllei8vOFhsMWxYMjdWM2h0VVQyaDJwdDkyRmNONFZZTVRiS09TR042UW5r?=
 =?utf-8?B?YTFyR21mc0NYenZNY2hma0JRbGl4VUFZTnY0aFNCbkVBVDVPV1VKbFBFRmlL?=
 =?utf-8?B?MUt2cjJFQ1lSejVtM1htdXF5cjFyOTZNWURSbGhZWm9zWmdkUUtZdm84aERl?=
 =?utf-8?B?QzRQV0VFRG5FNEI0VW9LYmtNQTlnM3EvdnFjRFliclAxSGFaaU05cUtuZ1dM?=
 =?utf-8?B?NEtNYjNldjlJNXlCdHF0RWVYS01ITDBRS2JkZVFuSGNtaHVBRDNRUWs3d2E2?=
 =?utf-8?B?U21PV2wvNVlRNW1QTHdXMHZ2ME9Za3lVS1lHY1JDV3B2ckM4WnZCU3dWbFJx?=
 =?utf-8?B?VUN6empmQjFuMnVzekg4djZlSkJnd3NmcTNQUURHNURxOUMxTDhFUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7DD8B8CC1E70F94C88C204F88ECF2761@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b751625-5a25-431c-9b04-08d9bfc20054
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 11:56:59.8803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ykol727qKtpMv3hc3a3stATwkS/bhZYMp0vq5YCKXJHQ9eiDFKMkj+wTG/lvGnghlyHB9Q4fir1KiZ74XPf0YRhrJhZ4+hABsl8zwFy5zW+Edz9M9o9MkUgyIhiF5Ac7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5796
X-Proofpoint-GUID: PgXLkbkbKBzEh7daz_lUo4csGjO6nzF0
X-Proofpoint-ORIG-GUID: PgXLkbkbKBzEh7daz_lUo4csGjO6nzF0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_08,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150066

RGVhciByZXN0IG1haW50YWluZXJzIQ0KDQpDb3VsZCB5b3UgcGxlYXNlIHJldmlldyB0aGlzIHNl
cmllcyB3aGljaCBzZWVtcyB0byBnZXQgc3R1Y2s/DQoNClRoYW5rIHlvdSBpbiBhZHZhbmNlLA0K
T2xla3NhbmRyDQoNCk9uIDI1LjExLjIxIDEzOjAyLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3
cm90ZToNCj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNo
Y2hlbmtvQGVwYW0uY29tPg0KPg0KPiBIaSwgYWxsIQ0KPg0KPiAxLiBUaGlzIHBhdGNoIHNlcmll
cyBpcyBmb2N1c2luZyBvbiB2UENJIGFuZCBhZGRzIHN1cHBvcnQgZm9yIG5vbi1pZGVudGl0eQ0K
PiBQQ0kgQkFSIG1hcHBpbmdzIHdoaWNoIGlzIHJlcXVpcmVkIHdoaWxlIHBhc3NpbmcgdGhyb3Vn
aCBhIFBDSSBkZXZpY2UgdG8NCj4gYSBndWVzdC4gVGhlIGhpZ2hsaWdodHMgYXJlOg0KPg0KPiAt
IEFkZCByZWxldmFudCB2cGNpIHJlZ2lzdGVyIGhhbmRsZXJzIHdoZW4gYXNzaWduaW5nIFBDSSBk
ZXZpY2UgdG8gYSBkb21haW4NCj4gICAgYW5kIHJlbW92ZSB0aG9zZSB3aGVuIGRlLWFzc2lnbmlu
Zy4gVGhpcyBhbGxvd3MgaGF2aW5nIGRpZmZlcmVudA0KPiAgICBoYW5kbGVycyBmb3IgZGlmZmVy
ZW50IGRvbWFpbnMsIGUuZy4gaHdkb20gYW5kIG90aGVyIGd1ZXN0cy4NCj4NCj4gLSBFbXVsYXRl
IGd1ZXN0IEJBUiByZWdpc3RlciB2YWx1ZXMgYmFzZWQgb24gcGh5c2ljYWwgQkFSIHZhbHVlcy4N
Cj4gICAgVGhpcyBhbGxvd3MgY3JlYXRpbmcgYSBndWVzdCB2aWV3IG9mIHRoZSByZWdpc3RlcnMg
YW5kIGVtdWxhdGVzDQo+ICAgIHNpemUgYW5kIHByb3BlcnRpZXMgcHJvYmUgYXMgaXQgaXMgZG9u
ZSBkdXJpbmcgUENJIGRldmljZSBlbnVtZXJhdGlvbiBieQ0KPiAgICB0aGUgZ3Vlc3QuDQo+DQo+
IC0gSW5zdGVhZCBvZiBoYW5kbGluZyBhIHNpbmdsZSByYW5nZSBzZXQsIHRoYXQgY29udGFpbnMg
YWxsIHRoZSBtZW1vcnkNCj4gICAgcmVnaW9ucyBvZiBhbGwgdGhlIEJBUnMgYW5kIFJPTSwgaGF2
ZSB0aGVtIHBlciBCQVIuDQo+DQo+IC0gVGFrZSBpbnRvIGFjY291bnQgZ3Vlc3QncyBCQVIgdmll
dyBhbmQgcHJvZ3JhbSBpdHMgcDJtIGFjY29yZGluZ2x5Og0KPiAgICBnZm4gaXMgZ3Vlc3QncyB2
aWV3IG9mIHRoZSBCQVIgYW5kIG1mbiBpcyB0aGUgcGh5c2ljYWwgQkFSIHZhbHVlIGFzIHNldA0K
PiAgICB1cCBieSB0aGUgaG9zdCBicmlkZ2UgaW4gdGhlIGhhcmR3YXJlIGRvbWFpbi4NCj4gICAg
VGhpcyB3YXkgaGFyZHdhcmUgZG9hbWluIHNlZXMgcGh5c2ljYWwgQkFSIHZhbHVlcyBhbmQgZ3Vl
c3Qgc2Vlcw0KPiAgICBlbXVsYXRlZCBvbmVzLg0KPg0KPiAyLiBUaGUgc2VyaWVzIGFsc28gYWRk
cyBzdXBwb3J0IGZvciB2aXJ0dWFsIFBDSSBidXMgdG9wb2xvZ3kgZm9yIGd1ZXN0czoNCj4gICAt
IFdlIGVtdWxhdGUgYSBzaW5nbGUgaG9zdCBicmlkZ2UgZm9yIHRoZSBndWVzdCwgc28gc2VnbWVu
dCBpcyBhbHdheXMgMC4NCj4gICAtIFRoZSBpbXBsZW1lbnRhdGlvbiBpcyBsaW1pdGVkIHRvIDMy
IGRldmljZXMgd2hpY2ggYXJlIGFsbG93ZWQgb24NCj4gICAgIGEgc2luZ2xlIFBDSSBidXMuDQo+
ICAgLSBUaGUgdmlydHVhbCBidXMgbnVtYmVyIGlzIHNldCB0byAwLCBzbyB2aXJ0dWFsIGRldmlj
ZXMgYXJlIHNlZW4NCj4gICAgIGFzIGVtYmVkZGVkIGVuZHBvaW50cyBiZWhpbmQgdGhlIHJvb3Qg
Y29tcGxleC4NCj4NCj4gMy4gVGhlIHNlcmllcyBoYXMgY29tcGxldGUgcmUtd29yayBvZiB0aGUg
bG9ja2luZyBzY2hlbWUgdXNlZC9hYnNlbnQgYmVmb3JlIHdpdGgNCj4gdGhlIGhlbHAgb2YgdGhl
IHdvcmsgc3RhcnRlZCBieSBSb2dlciBbMV06DQo+IFtQQVRDSCB2NSAwMy8xM10gdnBjaTogbW92
ZSBsb2NrIG91dHNpZGUgb2Ygc3RydWN0IHZwY2kNCj4NCj4gVGhpcyB3YXkgdGhlIGxvY2sgY2Fu
IGJlIHVzZWQgdG8gY2hlY2sgd2hldGhlciB2cGNpIGlzIHByZXNlbnQsIGFuZA0KPiByZW1vdmFs
IGNhbiBiZSBwZXJmb3JtZWQgd2hpbGUgaG9sZGluZyB0aGUgbG9jaywgaW4gb3JkZXIgdG8gbWFr
ZQ0KPiBzdXJlIHRoZXJlIGFyZSBubyBhY2Nlc3NlcyB0byB0aGUgY29udGVudHMgb2YgdGhlIHZw
Y2kgc3RydWN0Lg0KPiBQcmV2aW91c2x5IHJlbW92YWwgY291bGQgcmFjZSB3aXRoIHZwY2lfcmVh
ZCBmb3IgZXhhbXBsZSwgc2luY2UgdGhlDQo+IGxvY2sgd2FzIGRyb3BwZWQgcHJpb3IgdG8gZnJl
ZWluZyBwZGV2LT52cGNpLg0KPiBUaGlzIGFsc28gc29sdmVzIHN5bmNocm9uaXphdGlvbiBpc3N1
ZXMgYmV0d2VlbiBhbGwgdlBDSSBjb2RlIGVudGl0aWVzDQo+IHdoaWNoIGNvdWxkIHJ1biBpbiBw
YXJhbGxlbC4NCj4NCj4gNC4gVGhlcmUgaXMgYW4gb3V0c3RhbmRpbmcgVE9ETyBsZWZ0IHVuaW1w
bGVtZW50ZWQgYnkgdGhpcyBzZXJpZXM6DQo+IGZvciB1bnByaXZpbGVnZWQgZ3Vlc3RzIHZwY2lf
e3JlYWR8d3JpdGV9IG5lZWQgdG8gYmUgcmUtd29ya2VkDQo+IHRvIG5vdCBwYXNzdGhyb3VnaCBh
Y2Nlc3NlcyB0byB0aGUgcmVnaXN0ZXJzIG5vdCBleHBsaWNpdGx5IGhhbmRsZWQNCj4gYnkgdGhl
IGNvcnJlc3BvbmRpbmcgdlBDSSBoYW5kbGVyczogd2l0aG91dCBmaXhpbmcgdGhhdCBwYXNzdGhy
b3VnaA0KPiB0byBndWVzdHMgaXMgY29tcGxldGVseSB1bnNhZmUgYXMgWGVuIGFsbG93cyB0aGVt
IGZ1bGwgYWNjZXNzIHRvDQo+IHRoZSByZWdpc3RlcnMuDQo+DQo+IFhlbiBuZWVkcyB0byBiZSBz
dXJlIHRoYXQgZXZlcnkgcmVnaXN0ZXIgYSBndWVzdCBhY2Nlc3NlcyBpcyBub3QNCj4gZ29pbmcg
dG8gY2F1c2UgdGhlIHN5c3RlbSB0byBtYWxmdW5jdGlvbiwgc28gWGVuIG5lZWRzIHRvIGtlZXAg
YQ0KPiBsaXN0IG9mIHRoZSByZWdpc3RlcnMgaXQgaXMgc2FmZSBmb3IgYSBndWVzdCB0byBhY2Nl
c3MuDQo+DQo+IEZvciBleGFtcGxlLCB3ZSBzaG91bGQgb25seSBleHBvc2UgdGhlIFBDSSBjYXBh
YmlsaXRpZXMgdGhhdCB3ZSBrbm93DQo+IGFyZSBzYWZlIGZvciBhIGd1ZXN0IHRvIHVzZSwgaS5l
LjogTVNJIGFuZCBNU0ktWCBpbml0aWFsbHkuDQo+IFRoZSByZXN0IG9mIHRoZSBjYXBhYmlsaXRp
ZXMgc2hvdWxkIGJlIGJsb2NrZWQgZnJvbSBndWVzdCBhY2Nlc3MsDQo+IHVubGVzcyB3ZSBhdWRp
dCB0aGVtIGFuZCBkZWNsYXJlIHNhZmUgZm9yIGEgZ3Vlc3QgdG8gYWNjZXNzLg0KPg0KPiBBcyBh
IHJlZmVyZW5jZSB3ZSBtaWdodCB3YW50IHRvIGxvb2sgYXQgdGhlIGFwcHJvYWNoIGN1cnJlbnRs
eSB1c2VkDQo+IGJ5IFFFTVUgaW4gb3JkZXIgdG8gZG8gUENJIHBhc3N0aHJvdWdoLiBBIHZlcnkg
bGltaXRlZCBzZXQgb2YgUENJDQo+IGNhcGFiaWxpdGllcyBrbm93biB0byBiZSBzYWZlIGZvciB1
bnRydXN0ZWQgYWNjZXNzIGFyZSBleHBvc2VkIHRvIHRoZQ0KPiBndWVzdCBhbmQgcmVnaXN0ZXJz
IG5lZWQgdG8gYmUgZXhwbGljaXRseSBoYW5kbGVkIG9yIGVsc2UgYWNjZXNzIGlzDQo+IHJlamVj
dGVkLiBYZW4gbmVlZHMgYSBmYWlybHkgc2ltaWxhciBtb2RlbCBpbiB2UENJIG9yIGVsc2Ugbm9u
ZSBvZg0KPiB0aGlzIHdpbGwgYmUgc2FmZSBmb3IgdW5wcml2aWxlZ2VkIGFjY2Vzcy4NCj4NCj4g
NS4gVGhlIHNlcmllcyB3YXMgYWxzbyB0ZXN0ZWQgb246DQo+ICAgLSB4ODYgUFZIIERvbTAgYW5k
IGRvZXNuJ3QgYnJlYWsgaXQuDQo+ICAgLSB4ODYgSFZNIHdpdGggUENJIHBhc3N0aHJvdWdoIHRv
IERvbVUgYW5kIGRvZXNuJ3QgYnJlYWsgaXQuDQo+DQo+IFRoYW5rIHlvdSwNCj4gT2xla3NhbmRy
DQo+DQo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAxODA3MTcwOTQ4
MzAuNTQ4MDYtMi1yb2dlci5wYXVAY2l0cml4LmNvbS8NCj4NCj4gT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gKDEzKToNCj4gICAgcmFuZ2VzZXQ6IGFkZCBSQU5HRVNFVEZfbm9fcHJpbnQgZmxhZw0K
PiAgICB2cGNpOiBmaXggZnVuY3Rpb24gYXR0cmlidXRlcyBmb3IgdnBjaV9wcm9jZXNzX3BlbmRp
bmcNCj4gICAgdnBjaTogY2FuY2VsIHBlbmRpbmcgbWFwL3VubWFwIG9uIHZwY2kgcmVtb3ZhbA0K
PiAgICB2cGNpOiBhZGQgaG9va3MgZm9yIFBDSSBkZXZpY2UgYXNzaWduL2RlLWFzc2lnbg0KPiAg
ICB2cGNpL2hlYWRlcjogaW1wbGVtZW50IGd1ZXN0IEJBUiByZWdpc3RlciBoYW5kbGVycw0KPiAg
ICB2cGNpL2hlYWRlcjogaGFuZGxlIHAybSByYW5nZSBzZXRzIHBlciBCQVINCj4gICAgdnBjaS9o
ZWFkZXI6IHByb2dyYW0gcDJtIHdpdGggZ3Vlc3QgQkFSIHZpZXcNCj4gICAgdnBjaS9oZWFkZXI6
IGVtdWxhdGUgUENJX0NPTU1BTkQgcmVnaXN0ZXIgZm9yIGd1ZXN0cw0KPiAgICB2cGNpL2hlYWRl
cjogcmVzZXQgdGhlIGNvbW1hbmQgcmVnaXN0ZXIgd2hlbiBhZGRpbmcgZGV2aWNlcw0KPiAgICB2
cGNpOiBhZGQgaW5pdGlhbCBzdXBwb3J0IGZvciB2aXJ0dWFsIFBDSSBidXMgdG9wb2xvZ3kNCj4g
ICAgeGVuL2FybTogdHJhbnNsYXRlIHZpcnR1YWwgUENJIGJ1cyB0b3BvbG9neSBmb3IgZ3Vlc3Rz
DQo+ICAgIHhlbi9hcm06IGFjY291bnQgSU8gaGFuZGxlcnMgZm9yIGVtdWxhdGVkIFBDSSBNU0kt
WA0KPiAgICB2cGNpOiBhZGQgVE9ETyBmb3IgdGhlIHJlZ2lzdGVycyBub3QgZXhwbGljaXRseSBo
YW5kbGVkDQo+DQo+IFJvZ2VyIFBhdSBNb25uZSAoMSk6DQo+ICAgIHZwY2k6IG1vdmUgbG9jayBv
dXRzaWRlIG9mIHN0cnVjdCB2cGNpDQo+DQo+ICAgdG9vbHMvdGVzdHMvdnBjaS9lbXVsLmggICAg
ICAgfCAgIDUgKy0NCj4gICB0b29scy90ZXN0cy92cGNpL21haW4uYyAgICAgICB8ICAgNCArLQ0K
PiAgIHhlbi9hcmNoL2FybS92cGNpLmMgICAgICAgICAgIHwgIDMzICsrKy0NCj4gICB4ZW4vYXJj
aC94ODYvaHZtL3Ztc2kuYyAgICAgICB8ICAgOCArLQ0KPiAgIHhlbi9jb21tb24vcmFuZ2VzZXQu
YyAgICAgICAgIHwgICA1ICstDQo+ICAgeGVuL2RyaXZlcnMvS2NvbmZpZyAgICAgICAgICAgfCAg
IDQgKw0KPiAgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIHwgIDExICsrDQo+ICAgeGVu
L2RyaXZlcnMvdnBjaS9oZWFkZXIuYyAgICAgfCAzNTIgKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLQ0KPiAgIHhlbi9kcml2ZXJzL3ZwY2kvbXNpLmMgICAgICAgIHwgIDExICstDQo+
ICAgeGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMgICAgICAgfCAgIDggKy0NCj4gICB4ZW4vZHJpdmVy
cy92cGNpL3ZwY2kuYyAgICAgICB8IDI1MiArKysrKysrKysrKysrKysrKysrKystLS0NCj4gICB4
ZW4vaW5jbHVkZS94ZW4vcGNpLmggICAgICAgICB8ICAgNiArDQo+ICAgeGVuL2luY2x1ZGUveGVu
L3Jhbmdlc2V0LmggICAgfCAgIDcgKy0NCj4gICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCAgICAg
ICB8ICAgOCArDQo+ICAgeGVuL2luY2x1ZGUveGVuL3ZwY2kuaCAgICAgICAgfCAgNDcgKysrKy0N
Cj4gICAxNSBmaWxlcyBjaGFuZ2VkLCA2NDQgaW5zZXJ0aW9ucygrKSwgMTE3IGRlbGV0aW9ucygt
KQ0KPg0K

