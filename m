Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD414A3E5E
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 08:54:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262769.455133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nERVH-00044A-V3; Mon, 31 Jan 2022 07:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262769.455133; Mon, 31 Jan 2022 07:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nERVH-00041V-Rb; Mon, 31 Jan 2022 07:53:35 +0000
Received: by outflank-mailman (input) for mailman id 262769;
 Mon, 31 Jan 2022 07:53:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9o41=SP=epam.com=prvs=4030d24c28=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nERVG-00041P-En
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 07:53:34 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1e4279c-826a-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 08:53:32 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20V7qwlm009432;
 Mon, 31 Jan 2022 07:53:28 GMT
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dxbec81w7-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 07:53:28 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5043.eurprd03.prod.outlook.com (2603:10a6:208:108::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 07:53:23 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 07:53:22 +0000
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
X-Inumbo-ID: e1e4279c-826a-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hdun8nDUzegLA2OUdeY8rls9oCPA8Hqhj8BflERXdHoMeRC7LTxw2H1nsiSo00VuKRqGTPBobmf9Qkm7wXRUxYwdowwSoAMEFeJKlpp7vuaxGE6tpNurc32RDL33C5qiwDBhPxxVtS32d5I0bKaj2ejIyjXtAptZ0N7/Y8umg8qjQEIxGWB0UJm9da5Ve/gmffZV3lOVa5AAcdaa9XDP0m/9HdwCPwWHaIeHwDkXSL1J93Rys1pXrE7st24bv/FyavA06D7E0JmkgIaWFtYyJtrElIi1B1LASfJpSPBlcHCjhdPhC6yR6TTirBdtblqTjmvQSkobkrohRUwKc4Mmog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhxVzE8KkGk9M0wFK88e7I+4j/HhaaKAxKNGIiWYAh4=;
 b=a+ISw305vPGnmP0l75Vcgl93qRrTO2YMJSwIwTgbtu1mWJfs04ULRm51PSaLVa1SJeicAfqndCBpL26Lf76hVMcyVBwTok1uZp4TqE5yBgGYrSqFCz3LOPCfKXrLPW4geEO+P4+OywWZsqdKXsleSCabIRSD/VCNMaTAhH96I9Dbr2TItkGPX8wp4FlrqQYbnNJa3mrQXZ5uoS/EUpvIEtm5eCXkvmu6y4ilEBVtxv4MkCrVKvm2HON1HnjzpM9Ju4eitjZs3YdpB4oFAIeSbWqY5yTYgr0jgbIEMRd0foz7WtTwj3qOxeGLAiXOu163269r+DYfBLi1c6XonX/bAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhxVzE8KkGk9M0wFK88e7I+4j/HhaaKAxKNGIiWYAh4=;
 b=NB3FlvBNhZQ0LwoJpgZt9LrEuIvfCwyfJYah94cjiTVbFl6mTAR70cl1vNtOyJM3JEPHIxWss+YQnQDY29ccGh0pO0muh9kp/WoKaEYi6X34qXmnEEYtRDHeuwvXFj9NgCAmQoDiXjiT8W9H+14p1PQiyoh95qSr9+S5/0qNxNa+3tyVL5HGWj1L3bCx/dPSd6mXOI5PdjS5Q3rWucEvTJYEsIV8d+j+b18utJgX4ZduaGRS5pJAJ+wkLwHT9bcM/pgwMy+e5OmKmPvDhy4cDeA1rx3H2plR49x9Xs83KqcSoGVO63wFssAgaL4VVV17vV4pCFoe7hxcDBDtcpMuYA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 04/14] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v5 04/14] vpci: cancel pending map/unmap on vpci removal
Thread-Index: AQHX4ewFMUIx3Ap2dEiG4Ts6A1fyCax9K2QA
Date: Mon, 31 Jan 2022 07:53:22 +0000
Message-ID: <e745e440-d83b-89a5-3ebb-b37ae1d50713@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-5-andr2000@gmail.com>
In-Reply-To: <20211125110251.2877218-5-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5549ecd-306f-4be8-842c-08d9e48ec15a
x-ms-traffictypediagnostic: AM0PR03MB5043:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5043C74CB854D7B6290C591EE7259@AM0PR03MB5043.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sGiNJNNcamXDtXiBofMsfDT30zcLeDTato1Dj0tI4gQsy0YePM77aPWtcixAps00khuWevy5Gg55Gtm4EzzUIpFcARqPxK/3L2hqLRZEVml1XQkYBYlTEGpkuHrgdvUdwOmbCTg8ZjU7ZRFajws+KaFUTVKqw2UqgBKmSfC3L4SgkN3XEzAgy9YxKIhw0du2Q3qZjsn6Sdzg+PwiEVLT9nj+VzeaOEFpLIjYSsIAJsOi8/VnUtBBR2Q/AqgJL3lIrk1YDMiRZ8FgHfbbEQfdAq9CD5jB4VkILK3XzVBluH6T+GZXgxb+30s0ftDaw8Z6Udc/bD2NRmVQsvhJS9ItgJ/JqCdE5/jlZxGGxQeSg9fBIlHJNMzCl3pZltc/SUKfoIJjqyWvOZ0l5ZnYUhLPemq9Mp1qeNxXjrmWeuRsEqbPfkZ1FR22o0GWpzRo66Oilw6/AdkaJCCNu+b0ls1H0yjsy9MGw4A656xdpXA+FITb+BxIdU9PpKH7yi+XsHe23HFheyLvJ4sQ8xgI/AgeL03CqLUFLbXqb1qr9k5Fvj2IZpwGYVeaeYFBIEXXkd4L50BbgQPHp649qmq7hM2gMGkWselo9hXxKWrngv2w4tLy9U9m51nFznJeNFTvi4oJE8/uw51acYVdz3OJg3hRkEoFdmTlxwSas+y3cQ9yAO6PEoZGTyJcJC8SoCmKrfUF/PLlL5qXI6+7nI3kdiCDujuqMbRr6ksLwWQEowXgSuBONy2LyL7q3o3WKyIrRUjM
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(2616005)(107886003)(186003)(86362001)(83380400001)(71200400001)(5660300002)(7416002)(76116006)(36756003)(66446008)(64756008)(66946007)(66476007)(66556008)(31696002)(4326008)(91956017)(38070700005)(122000001)(31686004)(8936002)(8676002)(2906002)(508600001)(6506007)(6512007)(6486002)(53546011)(38100700002)(54906003)(110136005)(316002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dFFHa3VsLytNOW5mTTE5U0hrV2MrcjRVdVBLUmZRQWMzRmY4WjQzWGNrd0lp?=
 =?utf-8?B?NC9sbEtPVDRNNGJiejlKNFRxWTlLVkRydU8yVWw2cmJiYkdXeG9KQVhmTXhE?=
 =?utf-8?B?Q2FsNmdldm5jcFpMc3lmSmNYTXVLUkRXVFRGdXdycWR6V0d1djd3WFkzWDdV?=
 =?utf-8?B?cGFVam1iNExkT2dEUFluV0JnU3NLOGZrOGRac3dqTkdSVDVYVU1WWFc2a3M0?=
 =?utf-8?B?VGhvVXo3TWlJZCtWbzdSQkFjbHdkK3p0VGZ1NUZvNzdxVGw4YVU0L2d0ZVVn?=
 =?utf-8?B?Z3RIelJldE13SHlkN2M5YUlPZ1VaN2RZSmM0VzNmRWRrRjViM2tYVzkzeU1t?=
 =?utf-8?B?Q3hFak9SNHU2Q0xFZExISGs0YTRkalFLT1hqb1VPMHpKL2pQOXRTazJrUDd5?=
 =?utf-8?B?bXkwdjFhWk50NlpnRlpTME5aLzQyV2xNWTdaOG05SzREMHpOdWZhdzUvcDda?=
 =?utf-8?B?VzRHaW5aNEJFaWR4VTRjdHJpNDBvTng1cUphZ1E2a1NKRzg5NExrS0tlaXRa?=
 =?utf-8?B?Q21DMlBQWVBwWWR3MmdFeGtEZDF3aFgxVVJvN1dkM244UHliekFyc2dqRkE0?=
 =?utf-8?B?TGJHeWpHNm9PYmIvdm8wbStTWWZJcDJhb2RUTWhlU1l5VjhpN0xhMS9YV0N4?=
 =?utf-8?B?YXhPdGRXTjdpbnJySVRTZmJyZ25NUnBEUmFoeWd2MG8xTkdES0drUFNBQ2JW?=
 =?utf-8?B?Unk4d0c0ZEkzZjlYMFNjVVB4bUo1aDRXT1R4Qy9HYU9lUFVtN2lQV0RqSzZT?=
 =?utf-8?B?WVJVK1JnN25Remw4WDl1YWhBMzhQeElFRFg1MUpWWTZIekFQR2NXSGs5MnNY?=
 =?utf-8?B?ejRtZFh5ZWZhNGxBVzE4WlM3REl0Q3dURWFVNXFuL0x2WWRCNm1uZzRSUEla?=
 =?utf-8?B?eitJb3d6dm81ZVloNVU2eEV3VDJwS0l6bW5JOTlOZExSSi9TUGpCK1Y0QS9G?=
 =?utf-8?B?enFhTWIzWXZqQm9CbisraUVxQkFQTXdIc0ZTdS9qSDBFdmk1T3B6S1RMcXFX?=
 =?utf-8?B?ME9YMFBVY0dKaVFoZUxGQzllOHlYMThmemNRQjBYTklOajJQeldjU3laaGpP?=
 =?utf-8?B?a3doUkROeDRKQTAwV1dIakNnWXhERzhzWERwSFBJaVJ4QWFSRFptWFd5NWNo?=
 =?utf-8?B?a0dpNDFqMlBQVERubkFEbG5aOGwyRndqKzZxb0VRZnRRUm9XYVMwaDBNZXpI?=
 =?utf-8?B?KzZIczVZWnNOdG5hYWNFaUNpaHN6S2FBbFljZ3cra3Q0NHB4Z2JmMDRla2FY?=
 =?utf-8?B?MlpRSkV4dVNPUU9NUWtxUlJPbTJ6UGpwT0c0eXE2eW9ucjJlOXQzNlh0QlRQ?=
 =?utf-8?B?Q0pvbGRmM3VHS0tYbVpXL0pIUXRrd3V2eVNQdU02ZDhVTEdpZ0FaVXVpMlp3?=
 =?utf-8?B?MzhreFRLZ05GZjJmdVlscjRSOXJQYlZJcjVvNENhaThDSkNjcmg3czRWYVZU?=
 =?utf-8?B?dEs2eWpuZFJ5U3VSbTBTSzFiMTdBWnlVWG96V0lRYUJOQ3oyMGcyZTNjSVp3?=
 =?utf-8?B?QVprSEJiSHg0NXJ5WDJxb1BLT25wWXQ4QWdLMitNRC9EeDdOcnY0V3o5cjNI?=
 =?utf-8?B?SWhWSzFLUWlpK3dmY1h6Q2N5bjJha1BKMnV5V01kY1BKTG9oMFVtZmgwTVBN?=
 =?utf-8?B?MnNwV1V1ZEJCOHRUZTF6NTIraS9ubW5wZ2RBYWV4L2QzM1prNGZVRFdONEVk?=
 =?utf-8?B?eDQ2YWZwZVlwbHc5TTJ2VEJENG52SXF4NXpCWERJb0Z2YzN5TnRCUHVIK3RY?=
 =?utf-8?B?WU85QnZBSGlmYUY4ck5WQ1J4UWJJenpBb3ZVYjJSQzJkUldZY1haVFMzMDhi?=
 =?utf-8?B?NkEwdVhEN0k4SjJENGxNdXZib2dZMVFOTUhkSHRXVGpOZGVnQTRNVlZtNVRt?=
 =?utf-8?B?L1RVNVp4RnFxc2YwSHlnb0toQWpMNGJnV2NXK3Rtd1NnU1psNTVzeXROVFRL?=
 =?utf-8?B?WTlMYUE3WWkvNkkydUY0SGNrd0NnTXphZzRacjJyNm56S3J6ejVLR3h3Y0c4?=
 =?utf-8?B?OTMxaU5YcGNtSmdiYWFpNUFVV3l3amJKRnVKcVIwbDhiakZDN25iWWs1aDAx?=
 =?utf-8?B?cVpmRi9PSXhFaXdpazliN1hoM3U0dmlpaEZKekY2MUhEaGNGM0RWbnU1VmZk?=
 =?utf-8?B?S0tndEVxVlFLVDZEMURsZ0o3aVFCMVpiSGE3UWVuOHhJOTFFVEdQMGJ6VmYz?=
 =?utf-8?B?Zk1wWi8xbER3RW1aTXRtTkVtMmNsTFZsamhvbWlYNWgwODMvanJ4RXBCVUdn?=
 =?utf-8?B?WEZ5aWVTbVZTcldjZE1kTXhFUnYray8zK3YzNzBOUkhET1BaNGlZeW41Ykdq?=
 =?utf-8?B?OWNKMmtwL01GdUZmK2xCZnZZaWNZZzRYZVJEaHluRUQ1V3Q0NnNLZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91F5E2E18821964CA5FCFB4FAE18D133@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5549ecd-306f-4be8-842c-08d9e48ec15a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 07:53:22.8809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CCrQp3dgp+wkjIUNcB2uhikxf1Ut32/TQsRc8jXs+eq40MS+cnILyKuwTq2T+y62oBJXFzE00r8tCuGyNhppvDDRGIdeMAb8yCKgLjSp7ydRfolK4HXHeCbQALlW+2AM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5043
X-Proofpoint-GUID: S0kO2mxCE72evYgCmhiUzwAXUFLgx1K8
X-Proofpoint-ORIG-GUID: S0kO2mxCE72evYgCmhiUzwAXUFLgx1K8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_02,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310053

SSBhbSBnb2luZyB0byBwb3N0cG9uZSB0aGlzIHBhdGNoIGFzIGl0IGRvZXMgbmVlZCBtYWpvciBy
ZS10aGlua2luZw0Kb24gdGhlIGFwcHJvYWNoIHRvIHRha2UuIFRoaXMgaXMgcG9zc2libGUgYXMg
aXQgZml4ZXMgYSByZWFsbHkgcmFyZQ0KdXNlLWNhc2Ugc2VlbiBkdXJpbmcgZGV2ZWxvcG1lbnQg
cGhhc2UsIHNvIHNob3VsZG4ndCBodXJ0IHRoZSBydW4tdGltZQ0KDQpUaGFuayB5b3UsDQpPbGVr
c2FuZHINCg0KT24gMjUuMTEuMjEgMTM6MDIsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3Rl
Og0KPiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVu
a29AZXBhbS5jb20+DQo+DQo+IFdoZW4gYSB2UENJIGlzIHJlbW92ZWQgZm9yIGEgUENJIGRldmlj
ZSBpdCBpcyBwb3NzaWJsZSB0aGF0IHdlIGhhdmUNCj4gc2NoZWR1bGVkIGEgZGVsYXllZCB3b3Jr
IGZvciBtYXAvdW5tYXAgb3BlcmF0aW9ucyBmb3IgdGhhdCBkZXZpY2UuDQo+IEZvciBleGFtcGxl
LCB0aGUgZm9sbG93aW5nIHNjZW5hcmlvIGNhbiBpbGx1c3RyYXRlIHRoZSBwcm9ibGVtOg0KPg0K
PiBwY2lfcGh5c2Rldl9vcA0KPiAgICAgcGNpX2FkZF9kZXZpY2UNCj4gICAgICAgICBpbml0X2Jh
cnMgLT4gbW9kaWZ5X2JhcnMgLT4gZGVmZXJfbWFwIC0+IHJhaXNlX3NvZnRpcnEoU0NIRURVTEVf
U09GVElSUSkNCj4gICAgIGlvbW11X2FkZF9kZXZpY2UgPC0gRkFJTFMNCj4gICAgIHZwY2lfcmVt
b3ZlX2RldmljZSAtPiB4ZnJlZShwZGV2LT52cGNpKQ0KPg0KPiBsZWF2ZV9oeXBlcnZpc29yX3Rv
X2d1ZXN0DQo+ICAgICB2cGNpX3Byb2Nlc3NfcGVuZGluZzogdi0+dnBjaS5tZW0gIT0gTlVMTDsg
di0+dnBjaS5wZGV2LT52cGNpID09IE5VTEwNCj4NCj4gRm9yIHRoZSBoYXJkd2FyZSBkb21haW4g
d2UgY29udGludWUgZXhlY3V0aW9uIGFzIHRoZSB3b3JzZSB0aGF0DQo+IGNvdWxkIGhhcHBlbiBp
cyB0aGF0IE1NSU8gbWFwcGluZ3MgYXJlIGxlZnQgaW4gcGxhY2Ugd2hlbiB0aGUNCj4gZGV2aWNl
IGhhcyBiZWVuIGRlYXNzaWduZWQuDQo+DQo+IEZvciB1bnByaXZpbGVnZWQgZG9tYWlucyB0aGF0
IGdldCBhIGZhaWx1cmUgaW4gdGhlIG1pZGRsZSBvZiBhIHZQQ0kNCj4ge3VufW1hcCBvcGVyYXRp
b24gd2UgbmVlZCB0byBkZXN0cm95IHRoZW0sIGFzIHdlIGRvbid0IGtub3cgaW4gd2hpY2gNCj4g
c3RhdGUgdGhlIHAybSBpcy4gVGhpcyBjYW4gb25seSBoYXBwZW4gaW4gdnBjaV9wcm9jZXNzX3Bl
bmRpbmcgZm9yDQo+IERvbVVzIGFzIHRoZXkgd29uJ3QgYmUgYWxsb3dlZCB0byBjYWxsIHBjaV9h
ZGRfZGV2aWNlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8
b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+DQo+IC0tLQ0KPiBDYzogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IC0tLQ0KPiBTaW5jZSB2NDoNCj4g
ICAtIGNyYXNoIGd1ZXN0IGRvbWFpbiBpZiBtYXAvdW5tYXAgb3BlcmF0aW9uIGRpZG4ndCBzdWNj
ZWVkDQo+ICAgLSByZS13b3JrIHZwY2kgY2FuY2VsIHdvcmsgdG8gY2FuY2VsIHdvcmsgb24gYWxs
IHZDUFVzDQo+ICAgLSB1c2UgbmV3IGxvY2tpbmcgc2NoZW1lIHdpdGggcGRldi0+dnBjaV9sb2Nr
DQo+IE5ldyBpbiB2NA0KPg0KPiBGaXhlczogODZkYmNmNmUzMGNiICgidnBjaTogY2FuY2VsIHBl
bmRpbmcgbWFwL3VubWFwIG9uIHZwY2kgcmVtb3ZhbCIpDQo+DQo+IC0tLQ0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29A
ZXBhbS5jb20+DQo+IC0tLQ0KPiAgIHhlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMgfCA0OSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0NCj4gICB4ZW4vZHJpdmVycy92cGNp
L3ZwY2kuYyAgIHwgIDIgKysNCj4gICB4ZW4vaW5jbHVkZS94ZW4vcGNpLmggICAgIHwgIDUgKysr
Kw0KPiAgIHhlbi9pbmNsdWRlL3hlbi92cGNpLmggICAgfCAgNiArKysrKw0KPiAgIDQgZmlsZXMg
Y2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1n
aXQgYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIu
Yw0KPiBpbmRleCBiZDIzYzAyNzRkNDguLmJhMzMzZmIyZjliMCAxMDA2NDQNCj4gLS0tIGEveGVu
L2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPiArKysgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5j
DQo+IEBAIC0xMzEsNyArMTMxLDEzIEBAIHN0YXRpYyB2b2lkIG1vZGlmeV9kZWNvZGluZyhjb25z
dCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdWludDE2X3QgY21kLA0KPiAgIA0KPiAgIGJvb2wgdnBj
aV9wcm9jZXNzX3BlbmRpbmcoc3RydWN0IHZjcHUgKnYpDQo+ICAgew0KPiAtICAgIGlmICggdi0+
dnBjaS5tZW0gKQ0KPiArICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdi0+dnBjaS5wZGV2Ow0K
PiArDQo+ICsgICAgaWYgKCAhcGRldiApDQo+ICsgICAgICAgIHJldHVybiBmYWxzZTsNCj4gKw0K
PiArICAgIHNwaW5fbG9jaygmcGRldi0+dnBjaV9sb2NrKTsNCj4gKyAgICBpZiAoICFwZGV2LT52
cGNpX2NhbmNlbF9wZW5kaW5nICYmIHYtPnZwY2kubWVtICkNCj4gICAgICAgew0KPiAgICAgICAg
ICAgc3RydWN0IG1hcF9kYXRhIGRhdGEgPSB7DQo+ICAgICAgICAgICAgICAgLmQgPSB2LT5kb21h
aW4sDQo+IEBAIC0xNDAsMzIgKzE0Niw1MyBAQCBib29sIHZwY2lfcHJvY2Vzc19wZW5kaW5nKHN0
cnVjdCB2Y3B1ICp2KQ0KPiAgICAgICAgICAgaW50IHJjID0gcmFuZ2VzZXRfY29uc3VtZV9yYW5n
ZXModi0+dnBjaS5tZW0sIG1hcF9yYW5nZSwgJmRhdGEpOw0KPiAgIA0KPiAgICAgICAgICAgaWYg
KCByYyA9PSAtRVJFU1RBUlQgKQ0KPiArICAgICAgICB7DQo+ICsgICAgICAgICAgICBzcGluX3Vu
bG9jaygmcGRldi0+dnBjaV9sb2NrKTsNCj4gICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsNCj4g
KyAgICAgICAgfQ0KPiAgIA0KPiAtICAgICAgICBzcGluX2xvY2soJnYtPnZwY2kucGRldi0+dnBj
aV9sb2NrKTsNCj4gLSAgICAgICAgaWYgKCB2LT52cGNpLnBkZXYtPnZwY2kgKQ0KPiArICAgICAg
ICBpZiAoIHBkZXYtPnZwY2kgKQ0KPiAgICAgICAgICAgICAgIC8qIERpc2FibGUgbWVtb3J5IGRl
Y29kaW5nIHVuY29uZGl0aW9uYWxseSBvbiBmYWlsdXJlLiAqLw0KPiAtICAgICAgICAgICAgbW9k
aWZ5X2RlY29kaW5nKHYtPnZwY2kucGRldiwNCj4gKyAgICAgICAgICAgIG1vZGlmeV9kZWNvZGlu
ZyhwZGV2LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByYyA/IHYtPnZwY2kuY21k
ICYgflBDSV9DT01NQU5EX01FTU9SWSA6IHYtPnZwY2kuY21kLA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAhcmMgJiYgdi0+dnBjaS5yb21fb25seSk7DQo+IC0gICAgICAgIHNwaW5f
dW5sb2NrKCZ2LT52cGNpLnBkZXYtPnZwY2lfbG9jayk7DQo+ICAgDQo+IC0gICAgICAgIHJhbmdl
c2V0X2Rlc3Ryb3kodi0+dnBjaS5tZW0pOw0KPiAtICAgICAgICB2LT52cGNpLm1lbSA9IE5VTEw7
DQo+ICAgICAgICAgICBpZiAoIHJjICkNCj4gKyAgICAgICAgew0KPiAgICAgICAgICAgICAgIC8q
DQo+ICAgICAgICAgICAgICAgICogRklYTUU6IGluIGNhc2Ugb2YgZmFpbHVyZSByZW1vdmUgdGhl
IGRldmljZSBmcm9tIHRoZSBkb21haW4uDQo+ICAgICAgICAgICAgICAgICogTm90ZSB0aGF0IHRo
ZXJlIG1pZ2h0IHN0aWxsIGJlIGxlZnRvdmVyIG1hcHBpbmdzLiBXaGlsZSB0aGlzIGlzDQo+IC0g
ICAgICAgICAgICAgKiBzYWZlIGZvciBEb20wLCBmb3IgRG9tVXMgdGhlIGRvbWFpbiB3aWxsIGxp
a2VseSBuZWVkIHRvIGJlDQo+IC0gICAgICAgICAgICAgKiBraWxsZWQgaW4gb3JkZXIgdG8gYXZv
aWQgbGVha2luZyBzdGFsZSBwMm0gbWFwcGluZ3Mgb24NCj4gLSAgICAgICAgICAgICAqIGZhaWx1
cmUuDQo+ICsgICAgICAgICAgICAgKiBzYWZlIGZvciBEb20wLCBmb3IgRG9tVXMgdGhlIGRvbWFp
biBuZWVkcyB0byBiZSBraWxsZWQgaW4gb3JkZXINCj4gKyAgICAgICAgICAgICAqIHRvIGF2b2lk
IGxlYWtpbmcgc3RhbGUgcDJtIG1hcHBpbmdzIG9uIGZhaWx1cmUuDQo+ICAgICAgICAgICAgICAg
ICovDQo+IC0gICAgICAgICAgICB2cGNpX3JlbW92ZV9kZXZpY2Uodi0+dnBjaS5wZGV2KTsNCj4g
KyAgICAgICAgICAgIGlmICggaXNfaGFyZHdhcmVfZG9tYWluKHYtPmRvbWFpbikgKQ0KPiArICAg
ICAgICAgICAgICAgIHZwY2lfcmVtb3ZlX2RldmljZV9sb2NrZWQocGRldik7DQo+ICsgICAgICAg
ICAgICBlbHNlDQo+ICsgICAgICAgICAgICAgICAgZG9tYWluX2NyYXNoKHYtPmRvbWFpbik7DQo+
ICsgICAgICAgIH0NCj4gICAgICAgfQ0KPiArICAgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNpX2xv
Y2spOw0KPiAgIA0KPiAgICAgICByZXR1cm4gZmFsc2U7DQo+ICAgfQ0KPiAgIA0KPiArdm9pZCB2
cGNpX2NhbmNlbF9wZW5kaW5nX2xvY2tlZChzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4gK3sNCj4g
KyAgICBzdHJ1Y3QgdmNwdSAqdjsNCj4gKw0KPiArICAgIEFTU0VSVChzcGluX2lzX2xvY2tlZCgm
cGRldi0+dnBjaV9sb2NrKSk7DQo+ICsNCj4gKyAgICAvKiBDYW5jZWwgYW55IHBlbmRpbmcgd29y
ayBub3cgb24gYWxsIHZDUFVzLiAqLw0KPiArICAgIGZvcl9lYWNoX3ZjcHUoIHBkZXYtPmRvbWFp
biwgdiApDQo+ICsgICAgew0KPiArICAgICAgICBpZiAoIHYtPnZwY2kubWVtICYmICh2LT52cGNp
LnBkZXYgPT0gcGRldikgKQ0KPiArICAgICAgICB7DQo+ICsgICAgICAgICAgICByYW5nZXNldF9k
ZXN0cm95KHYtPnZwY2kubWVtKTsNCj4gKyAgICAgICAgICAgIHYtPnZwY2kubWVtID0gTlVMTDsN
Cj4gKyAgICAgICAgfQ0KPiArICAgIH0NCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBpbnQgX19pbml0
IGFwcGx5X21hcChzdHJ1Y3QgZG9tYWluICpkLCBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHJhbmdlc2V0ICptZW0sIHVp
bnQxNl90IGNtZCkNCj4gICB7DQo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL3ZwY2ku
YyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+IGluZGV4IGNlYWFjNDUxNmZmOC4uMzcxMDNl
MjA3NjM1IDEwMDY0NA0KPiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPiArKysgYi94
ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPiBAQCAtNTQsNyArNTQsOSBAQCB2b2lkIHZwY2lfcmVt
b3ZlX2RldmljZV9sb2NrZWQoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+ICAgew0KPiAgICAgICBB
U1NFUlQoc3Bpbl9pc19sb2NrZWQoJnBkZXYtPnZwY2lfbG9jaykpOw0KPiAgIA0KPiArICAgIHBk
ZXYtPnZwY2lfY2FuY2VsX3BlbmRpbmcgPSB0cnVlOw0KPiAgICAgICB2cGNpX3JlbW92ZV9kZXZp
Y2VfaGFuZGxlcnNfbG9ja2VkKHBkZXYpOw0KPiArICAgIHZwY2lfY2FuY2VsX3BlbmRpbmdfbG9j
a2VkKHBkZXYpOw0KPiAgICAgICB4ZnJlZShwZGV2LT52cGNpLT5tc2l4KTsNCj4gICAgICAgeGZy
ZWUocGRldi0+dnBjaS0+bXNpKTsNCj4gICAgICAgeGZyZWUocGRldi0+dnBjaSk7DQo+IGRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vcGNpLmggYi94ZW4vaW5jbHVkZS94ZW4vcGNpLmgNCj4g
aW5kZXggM2Y2MGQ2YzZjNmRkLi41MmQzMDJhYzVmMzUgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9wY2kuaA0KPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vcGNpLmgNCj4gQEAgLTEzNSw2
ICsxMzUsMTEgQEAgc3RydWN0IHBjaV9kZXYgew0KPiAgIA0KPiAgICAgICAvKiBEYXRhIGZvciB2
UENJLiAqLw0KPiAgICAgICBzcGlubG9ja190IHZwY2lfbG9jazsNCj4gKyAgICAvKg0KPiArICAg
ICAqIFNldCBpZiBQQ0kgZGV2aWNlIGlzIGJlaW5nIHJlbW92ZWQgbm93IGFuZCB3ZSBuZWVkIHRv
IGNhbmNlbCBhbnkNCj4gKyAgICAgKiBwZW5kaW5nIG1hcC91bm1hcCBvcGVyYXRpb25zLg0KPiAr
ICAgICAqLw0KPiArICAgIGJvb2wgdnBjaV9jYW5jZWxfcGVuZGluZzsNCj4gICAgICAgc3RydWN0
IHZwY2kgKnZwY2k7DQo+ICAgfTsNCj4gICANCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hl
bi92cGNpLmggYi94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQo+IGluZGV4IDhiMjJiZGVmMTFkMC4u
Y2ZmZjg3ZTU4MDFlIDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQo+ICsr
KyBiL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgNCj4gQEAgLTU3LDYgKzU3LDcgQEAgdWludDMyX3Qg
dnBjaV9od19yZWFkMzIoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCBy
ZWcsDQo+ICAgICogc2hvdWxkIG5vdCBydW4uDQo+ICAgICovDQo+ICAgYm9vbCBfX211c3RfY2hl
Y2sgdnBjaV9wcm9jZXNzX3BlbmRpbmcoc3RydWN0IHZjcHUgKnYpOw0KPiArdm9pZCB2cGNpX2Nh
bmNlbF9wZW5kaW5nX2xvY2tlZChzdHJ1Y3QgcGNpX2RldiAqcGRldik7DQo+ICAgDQo+ICAgc3Ry
dWN0IHZwY2kgew0KPiAgICAgICAvKiBMaXN0IG9mIHZQQ0kgaGFuZGxlcnMgZm9yIGEgZGV2aWNl
LiAqLw0KPiBAQCAtMjUzLDYgKzI1NCwxMSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgX19tdXN0X2No
ZWNrIHZwY2lfcHJvY2Vzc19wZW5kaW5nKHN0cnVjdCB2Y3B1ICp2KQ0KPiAgICAgICBBU1NFUlRf
VU5SRUFDSEFCTEUoKTsNCj4gICAgICAgcmV0dXJuIGZhbHNlOw0KPiAgIH0NCj4gKw0KPiArc3Rh
dGljIGlubGluZSB2b2lkIHZwY2lfY2FuY2VsX3BlbmRpbmdfbG9ja2VkKHN0cnVjdCBwY2lfZGV2
ICpwZGV2KQ0KPiArew0KPiArICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KPiArfQ0KPiAgICNl
bmRpZg0KPiAgIA0KPiAgICNlbmRpZg0K

