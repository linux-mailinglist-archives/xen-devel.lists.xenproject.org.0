Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6624AD57F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 11:30:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268009.461778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNkb-0003XY-DY; Tue, 08 Feb 2022 10:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268009.461778; Tue, 08 Feb 2022 10:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNkb-0003VI-9S; Tue, 08 Feb 2022 10:29:33 +0000
Received: by outflank-mailman (input) for mailman id 268009;
 Tue, 08 Feb 2022 10:29:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHNka-0003VC-7a
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 10:29:32 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff83572d-88c9-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 11:29:30 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2188wLw6000773;
 Tue, 8 Feb 2022 10:29:26 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e3nfprd9r-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 10:29:25 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5090.eurprd03.prod.outlook.com (2603:10a6:208:100::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 10:29:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 10:29:22 +0000
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
X-Inumbo-ID: ff83572d-88c9-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWGhPZKDbW4nGr31q0TJlm/vbbQ0f6OOuTcHRKjIcFhukRJrNWybtqu/AdlQVd6PxuCQ+2vqNG++R/FiGqU3PdKCoSmLRuAA8AQs5cKhDIDC2YF+wjZGSMqQgdVewZOJUCzPNVMyF78WY+puc4imthAt6n1gBgaoEPCmiFA+7lEtHu1rzfCv1prdJ694yLNJ6pHhxI/BZAAmenZxNPIO5L24X+6cG/4RI2WIYpKOSnHKwIi+T+wlq+9bpboavUm2ftptBaLN/vdlKto4PCnp1FW1EGSVGyKKSQ76cxzSu9xVPMMxfdJXyqciqu4Ys7lrSUWjSQT+Wi/J1Kix5vlKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCntf5lb0JiVEnujz62eG+2dGqOYsNa1FDMRVcPVVpg=;
 b=Aq5YP/aAPa9sSvNxJZRYeeUDXLKjs0KAsixOBYagk5F4unfBlCDObSgA0mSC8sN411m+r43601Slv9fbSj3u3rinj7tvjR4kp9JDLiBue+vVaE0tuzcq+xZIWAPolKfR3KadDo0BB5VAz30e8kn9yAp5k47cnJAnxjbYEIf4IgmxVgrLicmNJORlhA9H5/AJbnLrUuQM30ZSybId/NI69c/9kKTV8ltdL3fsEbwgUFEeE3JqLO2dc2ldZKvf1sWLJ4lo3aueGJcGb4B/Sbvt4LpY/CLZq0W6CoAB3G0Ac6KHxMkmJPtPbL66+oWXmwoXPz/UjlZ9ofZSdEtfb7VlXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCntf5lb0JiVEnujz62eG+2dGqOYsNa1FDMRVcPVVpg=;
 b=MoamOkA52BjjzWQ0WwkqRvPV1dY3pzKlKn/NwRYGhDEarvfwM4bgVH50Y5bruRdzwwn+aZEdNvnrvitwUpyOpmY/p96oW40xBGruR15n9dZ37RVf/L3OZlTzRPIFpaVmz7sCg6N4aLexpKN5WkNZaQS+ilmwJfYX5c5vn7byo2LV2o3oC8aN++2FqpMYp9bgXbGTzb+/ut5nbUAcxnIbm0jx9GUBf26WcWPO0RJJcok6do+SU9iSC8I9brqt7MzE1w1PEqwEqmJU28iejzZ+ANKNfoto0+sakP2uGddX7BWPIitch66SpByCxGcIu/E4vayPkLqrqP7Uu74vGGQWbA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
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
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 06/13] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v6 06/13] vpci/header: implement guest BAR register
 handlers
Thread-Index: 
 AQHYGZFd6D+qnME8W0+wTH+v8YZ8DayJaJYAgAABnACAAASVAIAAApGAgAAFPICAAAPBgA==
Date: Tue, 8 Feb 2022 10:29:22 +0000
Message-ID: <a92fb9da-438c-dd59-e7b1-d288a8efa05f@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-7-andr2000@gmail.com> <YgI3HpFffudiEmNN@Air-de-Roger>
 <498ca523-2642-e35f-b316-0a089f98ca91@epam.com>
 <5bc96dba-e9b8-de2e-f6aa-ae6c604897e8@suse.com>
 <6ac5d7ce-96dd-66e1-c8d1-eff7b0a1349e@epam.com>
 <41552c52-5e2e-5108-ab37-d1fb5d9b5edb@suse.com>
In-Reply-To: <41552c52-5e2e-5108-ab37-d1fb5d9b5edb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f3ca224-c58b-4c9c-45f9-08d9eaeddf79
x-ms-traffictypediagnostic: AM0PR03MB5090:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5090F7990359CAE555C1498BE72D9@AM0PR03MB5090.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vV0RQ+2L6fLJqUykDc70en4e/pvTkVZiLspKmAqUw4JMao1ETkDHdk2zVrlK+wA2qbMduCFGHf0NX1F9oc/MtYp44TaDXCqual46JEw1iXZ9rLTk7yQtjDi7ddXv54/F93p5pwgnedcevBq88yeVVGvT7PL7cm/ZZEmfN4/F2l1ksH/JYjdd520n9sFuRg40x6RGP/yRNDXn0uJg3/Bqft6emywGaqy4AxDSSo3fVFEi+OC/e/Z1ZJy/2zme70uAI4tVBhjN13FdVK/mdDfp7gv12/epLeXq96zWw8PWlasgjiY8cR4xSiVOZ3vSeCQxgL9YmBsYtyRnlOP+6bnS/CzrijSe2jDLa/dDpMf5tiHHzVd7/lkOal+rpjlZCSdLVz7q+RgbQZckr44cx8sJgR9LIPA04ftH5MlKC4qqQSRSUA3+R9ZrIsUz+smvWnHaI/djVC9/Q2L78cCuOa9Zv2jTiA0CFlyAZeLxk59Drgvy7eWEHRLBBO3tC6u4Xkf7MAexvQ/ZpVL8JTc6oBfylNQCfZ+KxHU72EdeJAEjczczMZxKudfm427COeY+L3Tkn4lqCt1Acjnj8vWI3cbMn+vT678J36Gw5hkreL4M3iR1I+iTWKRiO26IPtDyxd2EVlzmEzr5mc0Az8pnVl4f+jva4BLbbu6rMYTOt+0AfnXx+nV/zWSM1cMpheQPHzfTAgmCE+fGMf1c7sJ9zOJsZjV9IhQEC9Y6/oVB82lvWYWa6V+mAi63kRBjhoZ8cxl/
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(4326008)(508600001)(66446008)(53546011)(122000001)(38070700005)(2906002)(8936002)(71200400001)(55236004)(66946007)(76116006)(6486002)(66556008)(8676002)(38100700002)(91956017)(86362001)(64756008)(66476007)(36756003)(186003)(2616005)(110136005)(107886003)(54906003)(31686004)(6512007)(7416002)(5660300002)(26005)(31696002)(83380400001)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dmFPVEl0SGhQNzVZUmNMWEhwSzJ3UjkvMzE4amNURXZSVUJ3Z01uMWxKNFRQ?=
 =?utf-8?B?Mk0xRnRDZGxQVDEzQ1lRTUNJd2tWSWswNW1tdkNidzVDOERWckwwTEh6NS84?=
 =?utf-8?B?YTMvdEJSWUYySkwzVWM0dEN1KzlkNDREeW1XcGRhVlJMcW1uM29EZ2lKMWll?=
 =?utf-8?B?YTVEOGJhU2pRZTMxTm5TMXpmRWtFR2xMS3RVcGljRFJCUFB0cHcybHFsaU1p?=
 =?utf-8?B?OC96d2ZMSmF2L0J1RDNoZUZBV1VBWmxRSmhjM2crUE9xNU40RnNBVXJQTW85?=
 =?utf-8?B?L0s2WTdaZmZXSkN6Tll6WkY1ZFdlYzllN0VlV3o1UzhQOGhMR04zemhzcjQ3?=
 =?utf-8?B?U0gvSEZDNy9sOVQ0MTJIbFdFQWdzV2QzNThDbzJ1Nm9FMnZnQUc1T0diQ3NO?=
 =?utf-8?B?amJ0SlpaU2tlMUZHU1hPL2x1bGJLVnJYZGtXZXR1UHhsRVpVSXdDNm5nNFVs?=
 =?utf-8?B?RzBqSDFtOHZ3cFRldC9Pc3hhdzMyUTJVaHp1UWkzVGJUN0NJN1liblhNK24v?=
 =?utf-8?B?bWc2R2IvTWZNTzhmSUNBYkR4cy9FRGphQ0MzMVZzYko4SjA1SDNhK3BvVzNT?=
 =?utf-8?B?VExMSUFDbGVLTUhaaUVEWWRpdVdROGZFNGN6d0FYRXBjODNrNkFNcFh2V3Qv?=
 =?utf-8?B?c09naFpLSmxrWnc0RlZJNHF3a3NCMk1GcUhyL0NnSFVqNDZFSVVFN1JwNm0x?=
 =?utf-8?B?VTJkU0lxZ281UWI4U2p5endZcjBCNWhLdTZ1WnVTemdHczl0a2FuK3puN0JH?=
 =?utf-8?B?OWN0QnZJS3NYdVF2RHgwemUrYTh1a0hpdjJJSnlmdVlLR2E5cnl5VFhRZjVL?=
 =?utf-8?B?TVJITm5EZUIrWUFYQ1l4VVRQWTVROHM0cVRYbWl3V084WjNVNjEvRFY1RjRy?=
 =?utf-8?B?dGhUZGNSWGlzYy9uK3d4ZXRvY1NNRlg4NDZXZTBYWVVOZjA2OWR1Q2RCSUZN?=
 =?utf-8?B?L2xUaUErTEcxTVdhU1lWZUdwdkZjSUNFdE9WcXJnaWZwYStXTWMyM3duWnBQ?=
 =?utf-8?B?dWJ6VlROZ1JOTFF2TFRtWTkzcnU2cDZvZkhBbGFFQVhXTVpwZmRBR1VLUUVK?=
 =?utf-8?B?ZkJNb2JHSzlwVVNpclVzRGFWVG41aE9UVktDa1d2NFducXlDMXIwTURZbmtJ?=
 =?utf-8?B?d3VhazIwTUhzc2lkL0NPcWlYcjRXU2RQV3grSDJENUlmRFVyMmM0MWJ5bVNX?=
 =?utf-8?B?TU9CN2F0d2hVWksvNUtweG9iQ1pLYVpvUXBXSFBVM1JmcGpDZVlrV1puRGtF?=
 =?utf-8?B?b0FyRVlsVndhK3IxS2NHMXVsVVYwZGZ4c3FTTHFnWlpJdzRuS081M1F4SjRO?=
 =?utf-8?B?cHJSeVVDMklaaWFhdE1MN3g1N25lbFg5WkxsS3NmMDkxWU1mSFlGWkJCU1pi?=
 =?utf-8?B?YndoSnJUT01EN0VFYllHd2pkanQ5NFdpN2hlVVlzNzdDcDV4MG1DbEFoVk1t?=
 =?utf-8?B?U015TUt3VTVhVUpjZ09pWi9sa09DckNXNTd6RjJuQXUrNHlDZVFrRktuNjA1?=
 =?utf-8?B?anBpaU9yWWFvR2RDc1ZvaGpnSTJ6ems1cTZBRkJGYityT2s5UDNocFNGNEVC?=
 =?utf-8?B?empwbThkRXVsV3lwbVVOZTgwVWxveEsrZU1vOFo5bGQwZHVkb2IzcXNJNFll?=
 =?utf-8?B?UDBvU1QrVDV5eDlUU3VNRDNwNjhJZzVINTluMVdLMjd0OWx2MGp1dWVDM3Nq?=
 =?utf-8?B?VWJvSEhzSzArOVg4T2Yyb2hlbm9Ec0tnTU9ueThCMGlyL1FscUlaNDFnOSth?=
 =?utf-8?B?S0hTVjVxeHdJMnZPQjBxdXFZcUVYZFlPV2lXNE9iZVEwVXVXekN4WDUxL2w5?=
 =?utf-8?B?ZlRINGNWTFUra1BrLzE0eDBxZmQvRjQ5SlY0eFE5SjZOSTc5ZUxqRW5vRGl2?=
 =?utf-8?B?RGZlUHVCRFNXR0xaKzRLMGcybFUyaXdjU050RkRybTJVTGtXeldnb050aUEz?=
 =?utf-8?B?Y0c5ZWpLSUZRTEs0Q2ZkdHRtNSttelNiV2ZMclByQVo4WVpyTmlPRkVYZWlL?=
 =?utf-8?B?emcwK0RZeEcwTldQTmwxOTkxR3d4em5YdGkwaWRMakNGSDdVd0xMWWJBNCtP?=
 =?utf-8?B?K2cvYjNoaE1rU3kyUm1FNjVibVQ0Mll4aW5rck5saG5UMFhWMzlyaVhYNlBN?=
 =?utf-8?B?Y0tsWTBBd2FGK2YyVXJRd0tycFlzUWtKNDlkL29uNGYrcUc3Qy80aGtGNStZ?=
 =?utf-8?B?M0FjdmY0bHluamJxcEc5L1M0VkFJaHhrUEoxUXVsZHF1aFYzZ2xvQzhZVk1Z?=
 =?utf-8?B?b1pxc0JTOXpoLzNMWVExbzNIQzhwQmtCQ3Q2OHMyNzYvVW1USnc0aW1EbUM4?=
 =?utf-8?B?L0RWcS9aZVhFTjA4bkJLQWNYcytqTXZ5bjZYM2tmMTFuWTU4N0tHTS8yL0Jt?=
 =?utf-8?Q?5lalA0AaADUP8RNw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41B5B3EB66B31E40AA03E0291F2E9D23@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3ca224-c58b-4c9c-45f9-08d9eaeddf79
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 10:29:22.5489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yH+JmudSHGtxtOUSFvM/RWRi9YlDHONZko65C2CPqxFIyDqo3YS91W/N7hi67fUStLOjKsvEwG1EFiK7DwlXhlqblEohfz/gD982hCESPjxI5l6ajSKF0YGOL4Rat6SM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5090
X-Proofpoint-GUID: 1Ku-GYXqsvH9o5H1sNAdk-W_PnU9P9r6
X-Proofpoint-ORIG-GUID: 1Ku-GYXqsvH9o5H1sNAdk-W_PnU9P9r6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080060

DQoNCk9uIDA4LjAyLjIyIDEyOjE1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDguMDIuMjAy
MiAxMDo1NywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAwOC4wMi4yMiAx
MTo0OCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDguMDIuMjAyMiAxMDozMSwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IE9uIDA4LjAyLjIyIDExOjI1LCBSb2dlciBQ
YXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4gT24gRnJpLCBGZWIgMDQsIDIwMjIgYXQgMDg6MzQ6NTJB
TSArMDIwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4gQEAgLTUxNiw2
ICs1OTQsMTEgQEAgc3RhdGljIGludCBpbml0X2JhcnMoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+
Pj4+Pj4gICAgICAgICAgICAgaWYgKCAodmFsICYgUENJX0JBU0VfQUREUkVTU19TUEFDRSkgPT0g
UENJX0JBU0VfQUREUkVTU19TUEFDRV9JTyApDQo+Pj4+Pj4gICAgICAgICAgICAgew0KPj4+Pj4+
ICAgICAgICAgICAgICAgICBiYXJzW2ldLnR5cGUgPSBWUENJX0JBUl9JTzsNCj4+Pj4+PiArDQo+
Pj4+Pj4gKyAgICAgICAgICAgIHJjID0gYmFyX2lnbm9yZV9hY2Nlc3MocGRldiwgcmVnLCAmYmFy
c1tpXSk7DQo+Pj4+PiBUaGlzIGlzIHdyb25nOiB5b3Ugb25seSB3YW50IHRvIGlnbm9yZSBhY2Nl
c3MgdG8gSU8gQkFScyBmb3IgQXJtLCBmb3INCj4+Pj4+IHg4NiB3ZSBzaG91bGQga2VlcCB0aGUg
cHJldmlvdXMgYmVoYXZpb3IuIEV2ZW4gbW9yZSBpZiB5b3UgZ28gd2l0aA0KPj4+Pj4gSmFuJ3Mg
c3VnZ2VzdGlvbnMgdG8gbWFrZSBiYXJfaWdub3JlX2FjY2VzcyBhbHNvIGFwcGxpY2FibGUgdG8g
ZG9tMC4NCj4+Pj4gSG93IGRvIHdlIHdhbnQgdGhpcz8NCj4+Pj4gI2lmZGVmIENPTkZJR19BUk0/
DQo+Pj4gQWZhaWMgYmV0dGVyIHZpYSBhIG5ldywgZGVkaWNhdGVkIENPTkZJR19IQVZFXyogc2V0
dGluZywgd2hpY2ggeDg2IHNlbGVjdHMNCj4+PiBidXQgQXJtIGRvZXNuJ3QuIFVubGVzcyB3ZSBo
YXZlIG9uZSBhbHJlYWR5LCBvZiBjb3Vyc2UgLi4uDQo+PiBDb3VsZCB5b3UgcGxlYXNlIGJlIG1v
cmUgc3BlY2lmaWMgb24gdGhlIG5hbWUgeW91IHNlZSBhcHByb3ByaWF0ZT8NCj4gSSdtIHByZXR0
eSBzdXJlIExpbnV4IGhhcyBzb21ldGhpbmcgc2ltaWxhciwgc28gSSdkIGxpa2UgdG8gYXNrIHRo
YXQNCj4geW91IGdvIGxvb2sgdGhlcmUuDQpOb3Qgc3VyZSwgYnV0IEkgY2FuIGhhdmUgYSBsb29r
DQo+ICAgSSdtIHNvcnJ5IHRvIHNheSB0aGlzIGEgbGl0dGxlIGJsdW50bHksIGJ1dCBJJ20NCj4g
cmVhbGx5IGluIG5lZWQgb2YgZG9pbmcgc29tZXRoaW5nIGJleW9uZCBhbnN3ZXJpbmcgeW91ciBt
YWlscw0KV2VsbCwgaWYgYW5zd2VycyB3ZXJlIHRvIGJlIGEgYml0IG1vcmUgc3BlY2lmaWMgYW5k
IG5vdCBzbyBnZW5lcmFsDQpzb21lIHRpbWUsIHRoaXMgY291bGQgZGVmaW5pdGVseSBiZSBoZWxw
ZnVsIGFuZCBzYXZlIGEgbG90IG9mIHRpbWUgdHJ5aW5nDQp0byBndWVzcyB3aGF0IG90aGVyIHBh
cnR5IGhhcyBpbiB0aGVpciBtaW5kLg0KPiAgIChhbmQNCj4gaW4gcGFydCByZS1zdGF0aW5nIHRo
ZSBzYW1lIHRoaW5nIGFnYWluIGFuZCBhZ2FpbikuDQpJIGhhdmUgbm8gY29tbWVudHMgb24gdGhp
cy4NCj4NCj4+IEFuZCBkbyB5b3UgcmVhbGl6ZSB0aGF0IHRoaXMgaXMgZ29pbmcgdG8gYmUgYSBz
aW5nbGUgdXNlciBvZiBzdWNoIGENCj4+IHNldHRpbmc/DQo+IFllcywgYnV0IEknbSBub3Qgc3Vy
ZSB0aGlzIGlzIGdvaW5nIHRvIHJlbWFpbiBqdXN0IGEgc2luZ2xlIHVzZS4NCj4gRnVydGhlcm1v
cmUgZXZlcnkgQ09ORklHXzxhcmNoPiBpcyBwcm9ibGVtYXRpYyBhcyBzb29uIGFzIGEgbmV3IHBv
cnQNCj4gaXMgYmVpbmcgd29ya2VkIG9uLiBJZiB3ZSB3YW50ZWQgdG8gZ28gd2l0aCBhIENPTkZJ
R188YXJjaD4gaGVyZSwgaW1vDQo+IGl0IG91Z2h0IHRvIGJlIENPTkZJR19YODYsIG5vdCBDT05G
SUdfQVJNLCBhcyBJL08gcG9ydHMgYXJlIHJlYWxseSBhbg0KPiB4ODYtc3BlY2lmaWMgdGhpbmcg
KHdoaWNoIGhhcyBwcm9wYWdhdGVkIGludG8gb3RoZXIgYXJjaGl0ZWN0dXJlcyBpbg0KPiBtb3Jl
IG9yIGxlc3Mgc3RyYW5nZSB3YXlzLCBidXQgbmV2ZXIgYXMgdHJ1bHkgSS9PIHBvcnRzKS4NCkkg
YW0gZmluZSB1c2luZyBDT05GSUdfWDg2DQpAUm9nZXIsIGFyZSB5b3Ugb2sgd2l0aCB0aGF0Pw0K
Pg0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

