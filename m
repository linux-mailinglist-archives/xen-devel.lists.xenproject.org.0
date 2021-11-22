Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 226FB458A97
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 09:35:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228646.395703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp4ml-0000UG-8A; Mon, 22 Nov 2021 08:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228646.395703; Mon, 22 Nov 2021 08:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp4ml-0000SD-4B; Mon, 22 Nov 2021 08:34:47 +0000
Received: by outflank-mailman (input) for mailman id 228646;
 Mon, 22 Nov 2021 08:34:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJrQ=QJ=epam.com=prvs=1960b635ba=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mp4mj-0000S4-T5
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 08:34:46 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ac517bf-4b6f-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 09:34:44 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AM6vsHW018680;
 Mon, 22 Nov 2021 08:34:41 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cg5w8rebd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 08:34:40 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM6PR03MB3864.eurprd03.prod.outlook.com (2603:10a6:20b:1c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Mon, 22 Nov
 2021 08:34:38 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::b121:f602:44b6:d445]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::b121:f602:44b6:d445%3]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 08:34:38 +0000
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
X-Inumbo-ID: 0ac517bf-4b6f-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaZwTeqBOTBpCpijIa2w2zQGkM6Fu0KLmLX/CgbDIjxCQxEcbd8m4KBcY35OmNEz0nqNg1nba58jUAE6wHuk2hfw95nbp7qOiqTMqgsmSjgwgfJccVwsY2Nz5tGldffMzN8mijdROi7Y+JBrY+P3+Hf2KG52LG2feZ2uxLZLyDVOF3JjcMsvQy1BObTkahMPIst083XIEenX457aB+1JOA45kDZAnhC3OSN2JVm0BUWPX6KUVjL+yfA8yO1paQ0dty/H1VWu6f1Ret76ShaIbh1oMNWhfNx3SlGVnJvhmOYzO5AkYtN9UduoUsoy5fSmzwb44TntLXkVKCAfj/cUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Vjpian0JO/vpODL6mxdgBW38L8PRByaTYz+7fwh+qU=;
 b=bSwFPTmTjskRWCdKxyhbecd+vKTXJqjJ8i/jWZdrUgd5ivyuFwhVR1E8XdtAWTe6jhIAzLH2rIXNjuILNsVEQgGVVxQRXznSO8v3yNwSmSWuP/JfNdXiJ08HRed+4qHuTQ91/V9kPseILPelH9MyDtDpb3NxdjQ0iBonqs7oViQecojBylu1rJW4ogXB/5qZzuk/+5noFlM/e0H6J3nV7l2PiUl7kAs/YX5yz2c5uZhXBoFq9+3ycuDWL8McccBgyuCj4b39PBftr4fmqvufgpru4WzXmnGqgocZxT1ELi0amDXLz4l8bTibSUcThhI6iwqQbXlvOHON/cjDd2ZFaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Vjpian0JO/vpODL6mxdgBW38L8PRByaTYz+7fwh+qU=;
 b=d0raAB2pwBkj4mVq+9SC1TuM8uCvBlLbchYLmqLdTJ0yO1GVExyrtwEyRjQwv5K4+D6kKPPjxd0TeatjgWDqgpcmUgOQt5riI6vP56y6agwcZqPZuSnV6bUuy+M0kEP4vetYrCRTqshHd8YOKYh8X0wpuMjxuD8Fbje2tdVyVy5DeeFSns/MYEUJ7R62a6/JiNkpAHisT4OVe24PwUfRAQcKsPuXQ7uFh10YV/iQBFoHi1Dn5Yd+NaQLFn3NqFE/oorC6p2W93XxALR8Ubjifx76ESFnuv+fubX/PmE/FxjfwwgdRO/wA3nEgIHvi7cLAAS3cX3cquzbNsJHnuN9kA==
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
	<xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 00/11] PCI devices passthrough on Arm, part 3
Thread-Topic: [PATCH v4 00/11] PCI devices passthrough on Arm, part 3
Thread-Index: AQHX0hJHqVSXqEokpUi6WhDjT3q/RqwK9kcAgAAHm4CABFI8gIAAA08A
Date: Mon, 22 Nov 2021 08:34:38 +0000
Message-ID: <aa3b538b-86ea-020f-8069-8751fd581db2@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <f659a29e-f006-ddc5-53b4-236eb261e1ea@suse.com>
 <YZezXShKi1ofH5Aq@Air-de-Roger>
 <11c3903b-ac7d-47fe-159c-a960fc9998d8@suse.com>
In-Reply-To: <11c3903b-ac7d-47fe-159c-a960fc9998d8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de201bc6-2639-480a-bbd6-08d9ad92ec0d
x-ms-traffictypediagnostic: AM6PR03MB3864:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB3864A3DE1573AC400F11E0D5E79F9@AM6PR03MB3864.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hN3ndYTupKyMSCgg3u1h0TFZWv26fD37rnvS7u1hxKBBeYDUala7Eu4438JodDf8AQUgAiLhR8gGmdfUC9J/k5pv2sQHb5oEgh+TAg58pjm5BreD4bKysu97gJevG3gYBVxkM9xjm0OWODDBW08mOuR3W5+/NKYnbcN2fL5x+ANRq9qouic2S2/8ecKHPJa3cNWeM4SDIctmxLvwnSTqETonUiPoRA5O5xcINednAEwv92qAOTc4kLhTb9uhObgZHF7fL5EIpJ2K7fJg2ew9MoDyDtQD0NSntjGI5YBVRRS89VFIGGOT064z7TSt2+36+mglRGdD5je6BYzm4KCTovZvFIis6T3pi6cumUy4QesHibowN1QcAr4cGMeRgGVo1z2h8/BCnF6PESPOFw6+BI/mrp+jHnfap7EeFEuwwyOqoxI0stVtDznGcMZRtT8e04DwUz39JWxdrdeRH2UpFkm0+o4pet+VOO/GA3tYA2waESGuVRRjMxQedSq7MLEXL6c60AaMROBycq/mm1cWEE6XN3rcE3+s7mVOxhfk9J5kOXmtxM3Ci8o9dMqnC/eDPP/1PfIIs0hOjrjRZcHZyw7imDqEcVZA0jIi3x3gL5NoWfdHZUkGCFoFXc2S+83RvABNbeoBAcBZXylysHyFo3X714IDszDnwkFsePsLTpfvJfuAAjMk2kOZrRGvLFbqaZRUpO+hIFjATyhmSouyCokQqVFFXRWkIvln+SlG9mWu+JqaO080/Z3rETOEepolCmgUVrVT6ZAIlXYyP84k4bcyzZuETDJZliKw7D4XFJCPaPODmpUbwbMHUj63YL0o19SkdUF/msPl4gxi9s3RYQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31686004)(6486002)(4326008)(110136005)(66476007)(83380400001)(26005)(38100700002)(36756003)(186003)(107886003)(38070700005)(66556008)(53546011)(966005)(66446008)(6506007)(6512007)(508600001)(2906002)(64756008)(71200400001)(7416002)(316002)(8676002)(5660300002)(2616005)(86362001)(66946007)(8936002)(31696002)(54906003)(76116006)(55236004)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UXpwc0YzeE1GaGRXQXA0NjBPZElsZWN1WGM4MHlReGROZGZuaWNBcXBRUG54?=
 =?utf-8?B?MVdTMVowV0VuKzRNdFZSRnFXZkF2Q3BkNEZXdG8rcU9UNktBTkhOd29jdFhV?=
 =?utf-8?B?L0E1VlZCckZjRDNYa2lqWGFnQWlPZ0NuSnM3THZSSWYyN21reVRlRDA2cTFW?=
 =?utf-8?B?d3REUkdCck5YTHlEMVVjNUdWTFQwUWlBYnJGM05DOS82bldzZGJsUi9IcC85?=
 =?utf-8?B?TzRUMURZYTJCRDNpZlN2Nms3YUFGZnJieDZENzJ3MllIUjRoZkVYbSswT0dp?=
 =?utf-8?B?a2Z1ZW5PbHVhSGQ1VWhUUzljM0lYTnB6ZzlUay9RZElwYlJHWVdsTEZrZ3I5?=
 =?utf-8?B?L3ZIejc0TmtXWGIrV1U1T3d4SVNHdzQyZmFFSFczQ2JaK3JSdUpHOUtRNVZt?=
 =?utf-8?B?ckFPRnVsY0diK1ZLcGh1dlp0NGw0K2ZvR0g5azRSc1dlM3cxWDRHalVWcWRM?=
 =?utf-8?B?R2kwdGhhQWR4aGpIVUV3MHBZUE1BY2xwbE1xYVhTMkRtL1J6K3B3SlBQb0xV?=
 =?utf-8?B?THRBT2tac2poVVJzYWVoMDhvYnczVHlLZm1UZDJGdUYwQm9LMEc1ajJSWHBa?=
 =?utf-8?B?VUh1QWNZTmZNQzMyT2tuZms3NGdLYUhtbDI1K3FGQVVDNnIyNm9la0w4VEFT?=
 =?utf-8?B?OVpPSnJkRmk2bHdQcGtCa1ZlTTBmamUzd3phNDRoMlk3RXFhZjBCaWprNjR4?=
 =?utf-8?B?WTF5cXpOK2FlWE13RWdZcjFWOXpBNXl1MFpHMVZHaTRXb2JaNm1iNHZyQzBG?=
 =?utf-8?B?aDFHVS9zRE0zb0FtNGNBYktKTldBQXJ6MjFPdW1Lc0ZUSGdTVkduRGFaZ1M3?=
 =?utf-8?B?dTZHTEdud0ZjbVFYT2xmbzFWbzhKeXd6YUx3SzkzbVMvNW90Ly9jcWlQVzNF?=
 =?utf-8?B?V1Y0UURxaGZvM21JN2xQNnc0OWlhbFVRcXkzQzBkenZhYWg5dUtwTkkrL3BU?=
 =?utf-8?B?RkowcjVUQ1NQZHRqN25OTW9PcVBrSld1YUw0WGdwY28ycGM3cm8wOEswR04r?=
 =?utf-8?B?UHVGSWFlZmdqNHJFMW5JMkJ6YnZrV0k5dEkzWm1OWlRqTEdreStHN1d4cjhz?=
 =?utf-8?B?eFc1UXhDM2xkaXZXU05lMzQ2ZXJrUGJHamxxc1NhelVLRE1Xek9TVERMSGZi?=
 =?utf-8?B?TnNBb0JXSm9qa0NaVCs0QjFiZEFWazVycFZrUjlPek1iaSt2aDlqcjNUTSts?=
 =?utf-8?B?N2VyY3czM3VKY0lGa1ZHU3l6MjJ0ZGdJWWkwZktDNFdFcGRBNWs0K1BrMDdG?=
 =?utf-8?B?Nmh0cXNPdkZYVHQ0NldQdzRqSUZXTWh1RXVDdk1LNjVGOW81VEhKWVc5MnZj?=
 =?utf-8?B?cVE0ZlZtdUFtWCtMTjgxYjQ2RFZEVTBFaEVjcWQ2U25BcWc4dkIrRnJRem9G?=
 =?utf-8?B?Um5wdTMrNjZFTFdCMm4yQ2kya0w2Vmx6YW1FdWM1M2VTR3pGVzNaZ0t2Zkk2?=
 =?utf-8?B?ZTQxN3dBQ0VFWm9sdFlYMnRnV0MrUDg4cEFJYjhmc0UvR01sZWhjMDJrT1dX?=
 =?utf-8?B?SmxiUnV0dWlHSXhlSTVpbWxwVHFtWE9zNkI2cjdGeWgzWGNUR1NGTDhlUjlv?=
 =?utf-8?B?YzVQbUM3bFFLVnl6ZHdLbGRaYnA0bEcrZzlDZkVnOFhUVTllZlFQbmlDTkF2?=
 =?utf-8?B?cVBQNVV1a1dPTzBFdkdEMXBMYStoMG0yQWZudmJXdWFXZUxDZmU4Tms5cENi?=
 =?utf-8?B?QzFSOFFnSWFDT1gvOVVLYVF2TzZ0Q3U2aTRwQjFDaEZLbzEyTmM2L0M2Y1NX?=
 =?utf-8?B?elQzcFRjaEtpb1JBMTYxelZPZklST0hMOU96VmtYWDBjenFEc1pBU3pmRFBQ?=
 =?utf-8?B?bUM2aEQrWm9SK0Y4clA0Uk9SRE1QVDBxSlZMOUNDMWhkVlMxWWFkSDZ0NlE5?=
 =?utf-8?B?bUI1VGVLSHVLN3oyQk56QmQyNFVQTm10Ums4NmZGTVJzTm9HclpnZjlyTlZj?=
 =?utf-8?B?WUVNZWx5OXg2cGJPNHBNN2RueS9PNXBienptR3NGb0p0YWhVRXBuSWFaMDJU?=
 =?utf-8?B?eUIzRG9wcmphU3BldTRYTi9aVDMzL2FCMWlpVklaeEREMVdnSTFJS1pyRWVR?=
 =?utf-8?B?Y2NnaDZRdExRWUJOUjBnU3FHU2dLT3NNaklESCtZY2I1Z3o3aEl0eTc3Vncv?=
 =?utf-8?B?R0J5SjAwQXBTMEVBaTlTcmpTNE5zdndZT0Rud25tdEdBSGRxMGtXZHZMNXNN?=
 =?utf-8?B?SWlTTFM3RStvemQ5WW9BZnRRNWRHN0c4dStvUVdzakk2VWpGdWtOc21paExM?=
 =?utf-8?B?dG1HSE9Ba2dtL2QrbGR1aDV6ZTFyWEtTVjNya0FCLzdKaW1PZFpUb29YQVYr?=
 =?utf-8?B?ektsUzdMNFN3MXJ2bGxhZ0hNbWNWWDBMNWdSNHJKMGdoREFJcEVrdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3ADD3F707E9E884E8F22AF9F1D85B47C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de201bc6-2639-480a-bbd6-08d9ad92ec0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2021 08:34:38.5624
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ttk1dIP7WWzWoybKuHZ0mSl5OsfQuss1f0qp+K5t88v9E/QJfl6tNyxCJNdrvOm+YnSeUJo0V7X3F3aLMWKBhZeQvRrHQ896XZENtMGbJNCp7Cd2q6dLmV5tHwRovw8j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3864
X-Proofpoint-ORIG-GUID: wG4z7pCWYrF_2sC4SsF8XvArAFyXdNn7
X-Proofpoint-GUID: wG4z7pCWYrF_2sC4SsF8XvArAFyXdNn7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_04,2021-11-22_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 mlxlogscore=754 mlxscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111220043

DQoNCk9uIDIyLjExLjIxIDEwOjIyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTkuMTEuMjAy
MSAxNToyMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+IE9uIEZyaSwgTm92IDE5LCAyMDIx
IGF0IDAyOjU2OjEyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA1LjExLjIw
MjEgMDc6NTYsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBGcm9tOiBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+
Pj4+DQo+Pj4+IEhpLCBhbGwhDQo+Pj4+DQo+Pj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGlzIGZvY3Vz
aW5nIG9uIHZQQ0kgYW5kIGFkZHMgc3VwcG9ydCBmb3Igbm9uLWlkZW50aXR5DQo+Pj4+IFBDSSBC
QVIgbWFwcGluZ3Mgd2hpY2ggaXMgcmVxdWlyZWQgd2hpbGUgcGFzc2luZyB0aHJvdWdoIGEgUENJ
IGRldmljZSB0bw0KPj4+PiBhIGd1ZXN0LiBUaGUgaGlnaGxpZ2h0cyBhcmU6DQo+Pj4+DQo+Pj4+
IC0gQWRkIHJlbGV2YW50IHZwY2kgcmVnaXN0ZXIgaGFuZGxlcnMgd2hlbiBhc3NpZ25pbmcgUENJ
IGRldmljZSB0byBhIGRvbWFpbg0KPj4+PiAgICBhbmQgcmVtb3ZlIHRob3NlIHdoZW4gZGUtYXNz
aWduaW5nLiBUaGlzIGFsbG93cyBoYXZpbmcgZGlmZmVyZW50DQo+Pj4+ICAgIGhhbmRsZXJzIGZv
ciBkaWZmZXJlbnQgZG9tYWlucywgZS5nLiBod2RvbSBhbmQgb3RoZXIgZ3Vlc3RzLg0KPj4+Pg0K
Pj4+PiAtIEVtdWxhdGUgZ3Vlc3QgQkFSIHJlZ2lzdGVyIHZhbHVlcyBiYXNlZCBvbiBwaHlzaWNh
bCBCQVIgdmFsdWVzLg0KPj4+PiAgICBUaGlzIGFsbG93cyBjcmVhdGluZyBhIGd1ZXN0IHZpZXcg
b2YgdGhlIHJlZ2lzdGVycyBhbmQgZW11bGF0ZXMNCj4+Pj4gICAgc2l6ZSBhbmQgcHJvcGVydGll
cyBwcm9iZSBhcyBpdCBpcyBkb25lIGR1cmluZyBQQ0kgZGV2aWNlIGVudW1lcmF0aW9uIGJ5DQo+
Pj4+ICAgIHRoZSBndWVzdC4NCj4+Pj4NCj4+Pj4gLSBJbnN0ZWFkIG9mIGhhbmRsaW5nIGEgc2lu
Z2xlIHJhbmdlIHNldCwgdGhhdCBjb250YWlucyBhbGwgdGhlIG1lbW9yeQ0KPj4+PiAgICByZWdp
b25zIG9mIGFsbCB0aGUgQkFScyBhbmQgUk9NLCBoYXZlIHRoZW0gcGVyIEJBUi4NCj4+Pj4NCj4+
Pj4gLSBUYWtlIGludG8gYWNjb3VudCBndWVzdCdzIEJBUiB2aWV3IGFuZCBwcm9ncmFtIGl0cyBw
Mm0gYWNjb3JkaW5nbHk6DQo+Pj4+ICAgIGdmbiBpcyBndWVzdCdzIHZpZXcgb2YgdGhlIEJBUiBh
bmQgbWZuIGlzIHRoZSBwaHlzaWNhbCBCQVIgdmFsdWUgYXMgc2V0DQo+Pj4+ICAgIHVwIGJ5IHRo
ZSBob3N0IGJyaWRnZSBpbiB0aGUgaGFyZHdhcmUgZG9tYWluLg0KPj4+PiAgICBUaGlzIHdheSBo
YXJkd2FyZSBkb2FtaW4gc2VlcyBwaHlzaWNhbCBCQVIgdmFsdWVzIGFuZCBndWVzdCBzZWVzDQo+
Pj4+ICAgIGVtdWxhdGVkIG9uZXMuDQo+Pj4+DQo+Pj4+IFRoZSBzZXJpZXMgYWxzbyBhZGRzIHN1
cHBvcnQgZm9yIHZpcnR1YWwgUENJIGJ1cyB0b3BvbG9neSBmb3IgZ3Vlc3RzOg0KPj4+PiAgIC0g
V2UgZW11bGF0ZSBhIHNpbmdsZSBob3N0IGJyaWRnZSBmb3IgdGhlIGd1ZXN0LCBzbyBzZWdtZW50
IGlzIGFsd2F5cyAwLg0KPj4+PiAgIC0gVGhlIGltcGxlbWVudGF0aW9uIGlzIGxpbWl0ZWQgdG8g
MzIgZGV2aWNlcyB3aGljaCBhcmUgYWxsb3dlZCBvbg0KPj4+PiAgICAgYSBzaW5nbGUgUENJIGJ1
cy4NCj4+Pj4gICAtIFRoZSB2aXJ0dWFsIGJ1cyBudW1iZXIgaXMgc2V0IHRvIDAsIHNvIHZpcnR1
YWwgZGV2aWNlcyBhcmUgc2Vlbg0KPj4+PiAgICAgYXMgZW1iZWRkZWQgZW5kcG9pbnRzIGJlaGlu
ZCB0aGUgcm9vdCBjb21wbGV4Lg0KPj4+Pg0KPj4+PiBUaGUgc2VyaWVzIHdhcyBhbHNvIHRlc3Rl
ZCBvbjoNCj4+Pj4gICAtIHg4NiBQVkggRG9tMCBhbmQgZG9lc24ndCBicmVhayBpdC4NCj4+Pj4g
ICAtIHg4NiBIVk0gd2l0aCBQQ0kgcGFzc3Rocm91Z2ggdG8gRG9tVSBhbmQgZG9lc24ndCBicmVh
ayBpdC4NCj4+Pj4NCj4+Pj4gVGhhbmsgeW91LA0KPj4+PiBPbGVrc2FuZHINCj4+Pj4NCj4+Pj4g
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28gKDExKToNCj4+Pj4gICAgdnBjaTogZml4IGZ1bmN0aW9u
IGF0dHJpYnV0ZXMgZm9yIHZwY2lfcHJvY2Vzc19wZW5kaW5nDQo+Pj4+ICAgIHZwY2k6IGNhbmNl
bCBwZW5kaW5nIG1hcC91bm1hcCBvbiB2cGNpIHJlbW92YWwNCj4+Pj4gICAgdnBjaTogbWFrZSB2
cGNpIHJlZ2lzdGVycyByZW1vdmFsIGEgZGVkaWNhdGVkIGZ1bmN0aW9uDQo+Pj4+ICAgIHZwY2k6
IGFkZCBob29rcyBmb3IgUENJIGRldmljZSBhc3NpZ24vZGUtYXNzaWduDQo+Pj4+ICAgIHZwY2kv
aGVhZGVyOiBpbXBsZW1lbnQgZ3Vlc3QgQkFSIHJlZ2lzdGVyIGhhbmRsZXJzDQo+Pj4+ICAgIHZw
Y2kvaGVhZGVyOiBoYW5kbGUgcDJtIHJhbmdlIHNldHMgcGVyIEJBUg0KPj4+PiAgICB2cGNpL2hl
YWRlcjogcHJvZ3JhbSBwMm0gd2l0aCBndWVzdCBCQVIgdmlldw0KPj4+PiAgICB2cGNpL2hlYWRl
cjogZW11bGF0ZSBQQ0lfQ09NTUFORCByZWdpc3RlciBmb3IgZ3Vlc3RzDQo+Pj4+ICAgIHZwY2kv
aGVhZGVyOiByZXNldCB0aGUgY29tbWFuZCByZWdpc3RlciB3aGVuIGFkZGluZyBkZXZpY2VzDQo+
Pj4+ICAgIHZwY2k6IGFkZCBpbml0aWFsIHN1cHBvcnQgZm9yIHZpcnR1YWwgUENJIGJ1cyB0b3Bv
bG9neQ0KPj4+PiAgICB4ZW4vYXJtOiB0cmFuc2xhdGUgdmlydHVhbCBQQ0kgYnVzIHRvcG9sb2d5
IGZvciBndWVzdHMNCj4+PiBJZiBJJ20gbm90IG1pc3Rha2VuIGJ5IHRoZSBlbmQgb2YgdGhpcyBz
ZXJpZXMgYSBndWVzdCBjYW4gYWNjZXNzIGENCj4+PiBkZXZpY2UgaGFuZGVkIHRvIGl0LiBJIGNv
dWxkbid0IGZpbmQgYW55dGhpbmcgZGVhbGluZyB3aXRoIHRoZQ0KPj4+IHVzZXMgb2YgdnBjaV97
cmVhZCx3cml0ZX1faHcoKSBhbmQgdnBjaV9od197cmVhZCx3cml0ZX0qKCkgdG8gY292ZXINCj4+
PiBjb25maWcgcmVnaXN0ZXJzIG5vdCBjb3ZlcmVkIGJ5IHJlZ2lzdGVyZWQgaGFuZGxlcnMuIElN
TyB0aGlzIHNob3VsZA0KPj4+IGhhcHBlbiBiZWZvcmUgcGF0Y2ggNTogQmVmb3JlIGFueSBoYW5k
bGVycyBnZXQgcmVnaXN0ZXJlZCB0aGUgdmlldyBhDQo+Pj4gZ3Vlc3Qgd291bGQgaGF2ZSB3b3Vs
ZCBiZSBhbGwgb25lcyBubyBtYXR0ZXIgd2hpY2ggcmVnaXN0ZXIgaXQNCj4+PiBhY2Nlc3Nlcy4g
SGFuZGxlciByZWdpc3RyYXRpb24gd291bGQgdGhlbiAicHVuY2ggaG9sZXMiIGludG8gdGhpcw0K
Pj4+ICJjdXJ0YWluIiwgYXMgb3Bwb3NlZCB0byBEb20wLCB3aGVyZSBoYW5kbGVyIHJlZ2lzdHJh
dGlvbiBoaWRlcw0KPj4+IHByZXZpb3VzbHkgdmlzaWJsZSByYXcgaGFyZHdhcmUgcmVnaXN0ZXJz
Lg0KPj4gRldJVywgSSd2ZSBhbHNvIHJhaXNlZCB0aGUgc2FtZSBjb25jZXJuIGluIGEgZGlmZmVy
ZW50IHRocmVhZDoNCj4+DQo+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcveGVuLWRldmVsL1lZRDdWbURHS0pSa2lkNGFAQWlyLWRlLVJvZ2VyL19f
OyEhR0ZfMjlkYmNRSVVCUEEhbjM3WWlnOXBBQXlobzdmQjlrQy1xMFQtZ2pDX3V0cHpqdFF4TnY4
dWRNWDBkWEs1NFBXY0h3QnF0bXpIWFNjNWxUa3pLdTRYZlEkIFtsb3JlWy5da2VybmVsWy5db3Jn
XQ0KPj4NCj4+IEl0IHNlZW1zIGxpa2UgdGhpcyBpcyBmdXR1cmUgd29yaywgYnV0IHVubGVzcyBz
dWNoIGEgbW9kZWwgaXMNCj4+IGltcGxlbWVudGVkIHZQQ0kgY2Fubm90IGJlIHVzZWQgZm9yIGd1
ZXN0IHBhc3N0aHJvdWdoLg0KPj4NCj4+IEknbSBmaW5lIHdpdGggZG9pbmcgaXQgaW4gYSBzZXBh
cmF0ZSBzZXJpZXMsIGJ1dCBuZWVkcyB0byBiZSBrZXB0IGluDQo+PiBtaW5kLg0KPiBOb3QganVz
dCB0aGlzIC0gaXQgYWxzbyBuZWVkcyB0byBiZSByZWNvcmRlZCBpbiB0aGlzIGNvdmVyIGxldHRl
ciBhbmQNCj4gaW1vIGFsc28gaW4gYSBjb21tZW50IGluIHRoZSBzb3VyY2VzIHNvbWV3aGVyZS4g
T3IgZWxzZSB0aGUgcXVlc3Rpb24NCj4gd2lsbCAodmFsaWRseSkgYmUgcmFpc2VkIGFnYWluIGFu
ZCBhZ2Fpbi4NCkkgYW0gZmluZSBhZGRpbmcgc3VjaCBhIGNvbW1lbnQsIGJ1dCBhbSBub3Qgc3Vy
ZSB3aGVyZSB0byBwdXQgaXQuDQpXaGF0IHdvdWxkIGJlIHlvdXIgYmVzdCBiZXQgaWYgeW91IHdl
cmUgdG8gbG9vayBmb3IgdGhpcyBpbmZvcm1hdGlvbj8NCkkgdGhpbmsgd2UgY2FuIHB1dCB0aGF0
IGluIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jIGF0IHRoZSB0b3AsIHJpZ2h0DQphZnRlciB0aGUg
bGljZW5zZSBpbiB0aGUgc2FtZSBjb21tZW50IGJsb2NrLg0KPg0KPiBKYW4NCj4NClRoYW5rIHlv
dSwNCk9sZWtzYW5kcg==

