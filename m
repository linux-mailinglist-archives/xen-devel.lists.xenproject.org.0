Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FA34A405B
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 11:41:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262934.455411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEU7T-0000YH-5Q; Mon, 31 Jan 2022 10:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262934.455411; Mon, 31 Jan 2022 10:41:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEU7T-0000Vq-1n; Mon, 31 Jan 2022 10:41:11 +0000
Received: by outflank-mailman (input) for mailman id 262934;
 Mon, 31 Jan 2022 10:41:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9o41=SP=epam.com=prvs=4030d24c28=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nEU7R-0000Vg-As
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 10:41:09 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a1e1b86-8282-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 11:41:05 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20VASFxQ032010;
 Mon, 31 Jan 2022 10:41:00 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dxc900h7y-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 10:41:00 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7427.eurprd03.prod.outlook.com (2603:10a6:20b:267::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Mon, 31 Jan
 2022 10:40:47 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 10:40:47 +0000
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
X-Inumbo-ID: 4a1e1b86-8282-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEDSngHGW7Fj+msqshwImQN8b5O+xmSZqrlop7Laq/5GWfOGR70hnu9mX/L4vNoCOA3/CCEhvz/kusf7b4cQO5hoAC+892h1yP+a+0wUQ8AyGderKmkWvtthQyxCkRcowlY54QNhHnkpKmqywV+GrmqtbAF4fS0Yp3p+hELPkpLlICugh6Lb2dWR9u6E7YzxsYgOYwgtpV4RJk3XYhs2E/xWAL7PY7K+neYlkeyq/y3gCilJLVcIUXYQUKpfI2lLUTpHXyQQ6Y/YeBUuTBcuCFkWRtwcf9ezxBjONRfvru4DQBWph6cBxLvzwQc7znPsWKV7ppFY7/jCjK9c8h/gSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kH4XBHUf9FGsP2w6C3p6QN2RpRm/h2jV8LgjptuoLRA=;
 b=g9ezCphUPRtSKyYrmLwF0WNeU5f5sz+Os6GzOJ32UIWP248jpG8bv7zLjKqzaO8FYeZFEuZpI1CMvWpxNfIQeIIUTh+IAHawX6aDtzWNnPnab6dnJ1ih9A4AfoFzrKl4pC872vKbRTccY3yAN5xZoxqiOxrrJoIn1UqxxTKZFcPJsn99FJHVAM2DzK5L7bIx9tqa22SwXOMtImlr8IRrHEIMj9yB6ZEsB3KsqfgZCg79ekV0/AR0aTTtk/Vc4OuAr+9cvCdlBgVG+GX27FjrYRLZvc8Gz0KagBrUGPfClQgEH3DrpDixr5Sgm4gR3J8hfpx6tjKNw54/v6UOKRW+qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kH4XBHUf9FGsP2w6C3p6QN2RpRm/h2jV8LgjptuoLRA=;
 b=NEGqxL3bnGGTIzJ9tGo4BrMBUIGR0Lu6D9f8VXdiryhu2JMPM+gnWR4d5eN2whOTIhiR08b2Y9WB0mUszBTi8MgGhhtVhDAlAvUB/Z/0wnHcjUQ427s/0nod5jt/GDpugt1UN0V4ERGFeWSQ+UuHNdo9HfSH9i0CvlTzEJV8J0FTR07QcZNXoEOAQeNPWgdY8TNBIAceTw912Q7BuPd3KO2XCMTVEU6jE6YvjFAMzwa5I6G53gr5c8O/EWc+07NYMEHA65pvvtVTrM/sE3LLH5sEdhMAe2JuGx2WjGpSoPq3JvahR6xg6A/JHhXv4Yr/lhNlxlBN8J2amcx3yAya8A==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
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
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHX4ewHyWAyD811HEGp8pIjUuVWNaxfndGAgB2tWgCAAA7+AA==
Date: Mon, 31 Jan 2022 10:40:47 +0000
Message-ID: <c7e87ebd-2c56-d510-b08b-02d53f9158d1@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
 <77c00154-646c-a2a3-98cb-be4324003446@epam.com>
In-Reply-To: <77c00154-646c-a2a3-98cb-be4324003446@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3f2c2d5-f95f-4dd7-b739-08d9e4a62464
x-ms-traffictypediagnostic: AM9PR03MB7427:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB7427F9BD24217F2DE65FE239E7259@AM9PR03MB7427.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /QjBsTav9CS2o1kU/f+RarNBysCnMZrW6671SvOXVb00UmYnJhPiHIhIXw9tH+mAiFyfrlM74hCnLJP2rKiplCow2ZD/oafYQp2OD7cMsoj0b9aJqDdwN/Cy0VJC3FxlK1/IY1i9T88CJpGuwjMDAuQC6ZgTyVeipWs76eAN+hSWXd3cFEMcbMpF8QXBIftgVJzzMaM0h8u3Dt+46vHic/nfIrejwK4MDDXx6c6SrkP+gmJEgTmOCrStuagakmeV6rCP1AHrCuPkp8u65EUIBGKYUdN0+F1YRb4I5f5hVqhlVcwlpaTQeuNufck68G44Xb9dhOyrf8sUoS0f3m5BTG/ifPwvo1/1o1WtDUPfXKyuFOMG9iUpAWerwfeRyB5GnPbFheumsv1NRmJ0lWLgcCgm2qQbklJx7ceFbjOBkB5mt7OlErsw/EC7e19+spQ6eGbl3sWTIZOv4YetKrbICLUzAZEy1KoTlUnHR0Vmk+OcaBfpNELA6lsXZxqLdmKnNYT38As0O8NFyebRS4v1ufIo28rBcMz3OAV/L2oYWbi6a2QAmgbPObWYLeXM1v6sXrWq/XqAcDYu0t8aaGye7PiLkdlRG/zJqAsJh3/r6v4xFnNHtImoC78O/jO+JpE8pt5c3vDdNFwKGnagf2EQD7M1lcM5Sh7QwidhihJm7nE8JaSr40zB7JZA77AFnqySqMBeUOkyrIQZuanHwWglyofmRdua0sJoWBvc62tJrceRYftHcuBVQbwjzyW/7B6w
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(76116006)(64756008)(66556008)(66476007)(8936002)(66446008)(4326008)(8676002)(66946007)(36756003)(53546011)(122000001)(38100700002)(6486002)(91956017)(31686004)(71200400001)(6506007)(6916009)(107886003)(5660300002)(7416002)(508600001)(54906003)(6512007)(316002)(83380400001)(2906002)(186003)(31696002)(86362001)(26005)(2616005)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RG4wbVpzUUdqOSsvNU8ycEorUDlEMkY0VXZYcGlSM3NlL2hrcHcrTmxHT1Zw?=
 =?utf-8?B?VVhUekZqVXNDNG5iNVgxd1FvNDlsdENJY1hhRjJuR3RFdlVySHZvSVpYVHBl?=
 =?utf-8?B?bU05T0oyT0cyZHZlUml2dUlockxlb3VZcHhhaGM1YjZVMkNSeVcxOGlxb1I2?=
 =?utf-8?B?TUgweDF3TmNWbTQzN3JUeThZZGRBUUdsU2Q5b3haL21WUm04cFBva2VMZmRv?=
 =?utf-8?B?aFFmMUpKMzB5VlhpYnBndVRiV2s5UGREUkJJbEhpU0cxRklxUUtMalhQVWtU?=
 =?utf-8?B?NzZEVjhFSTJmUWt4NGp6YmdhdlY5a3lhN2drUU1pcW9CRW5SNXNsUGVTWk9i?=
 =?utf-8?B?aHY0YnpRd1UwVE9jUW01K2VjZURNZGNYZlZSRTNxUnNaWVJvOElYVmZSNit5?=
 =?utf-8?B?THB4b0tBMEZUUzVXOGR1VWlxRXVvTE5aMWxnK3oyMEJuTDdXZmxzZnVrT21o?=
 =?utf-8?B?NDJmVGNkdkFQRnNJU2luWkhBb3VrVzVycGNWdmpDTkNDQ3oyemovNldKQTJ2?=
 =?utf-8?B?dTR1Z0VpQmFsSnZ4dXFMYTFCSkN0ZGhUY0owSGtLNElNSktHNFZZSzZsc0dU?=
 =?utf-8?B?ME1pajVRb2lvNCtWSFRKTGZXVEQwT28xQWN1Nlh4cmpaQkszMTdIWE1sUmRJ?=
 =?utf-8?B?L1hpRW8rNjBkVUZRTndpZExLQUpKZTNIVGlIa0hrdWtvS1JtNTJIWExmUkc4?=
 =?utf-8?B?UnNoaUpBMjJYSUhzVSthb3NmU0lsUVR4eWZ1ZEVBMkZUc05tOE42YXpVQmNh?=
 =?utf-8?B?eW50YnB5YzA4eWhvdEk4Q2ZJQTU1Rmh6QWkyTXdNNjdWQllvd25seG1BRExp?=
 =?utf-8?B?aGVhL0liQjlzV29EZEUzMDQrZFMvZTBxVC9SMmhJNURLd0Q2VitUWDhPR3ky?=
 =?utf-8?B?b2JwSWhXdmdaSEJnaHA2ZVdnRTV5SXpsWjgzanFOVXBscEdmNkxtYjZUSkMr?=
 =?utf-8?B?ZG1SeG1FQXBldjdEUjhCemQ4b0syVjQ3eUE0MHFTTitmcVhJNFo4bU1MekRm?=
 =?utf-8?B?bVZ6YVZJY083ME5id296eTZWZURySERnSmp1MUt2aVNxOFVRWW9HcG04aG9U?=
 =?utf-8?B?NGx0WFQ1RUkxd2xYTjVuK1d0alNIeEFQTXoyTCs5a1RNc1VibW44aDBTSEZJ?=
 =?utf-8?B?eDh0ejhCTlJNQmFBNzd3dlZhQVpMZEtCSDVGSmpxK1pDRUpnMjNGNzcxZitw?=
 =?utf-8?B?SjdOZVJnRkc3cTUyd3NpaDFYcmYrR0N2Qk9xVytWblo0YnBBQjFTVS9KeHVt?=
 =?utf-8?B?UUFCOG1pc3N5RytwLytZK0tQWUFtSDhEazJFWm9wbDF2blNZN3grTWQ3OC9n?=
 =?utf-8?B?bWpMUk9abzJqK2ZUUy92US9RT0V0cUtvQWE5WklkRDh4MWF5bTB3NFM3dTJ6?=
 =?utf-8?B?R21RK3ZSMG1FbjUvdENkK09FK2tZYXNnZHl2UDJmWnBla01VRXIrQ0tJVWN1?=
 =?utf-8?B?RnJOZ29oMytDZXRZRHd1QldNUDVuK3pPVjB4TE1RRDhUWkorRE1CKzRyQVVD?=
 =?utf-8?B?Ny80eHkxSXd4Z2hxMTFVb050WU1yVVhRMFJTRnVUc2FDZlROTWVMVkVkUG1K?=
 =?utf-8?B?OEdMSVYycnNyS2F0Y3Y1NXdCZ0s1Z3dyUnFhT0ZoTmR2WE1HelhVTk14c2VE?=
 =?utf-8?B?K2luR3loOC90dklPbWdGSG8wVDRpOGtGTldvLzlzZXdUbWZtektCenFnd2lm?=
 =?utf-8?B?OVN0WkxqVTlVdkZnWmlYb1BMZGI4aHFjb25sbnVLekJlakxSSXBwK2I2NWpS?=
 =?utf-8?B?bkZqQVhabTVvK3piY1Bkb0JaUWN3QkMrb3lHL0RzZWlidGkvdEUzd2NXMTRI?=
 =?utf-8?B?aE1ZdWNKaDJTRDVqSjRPZjdEVytFeW9SSjcvd2UwdGxpVkh5U05odUh0Rk52?=
 =?utf-8?B?bnFTUVNjc2FPNUdvK0xKaDJYS0dvSWFDK20wMnJiZVlYaWhuc0hzcVZQYTRL?=
 =?utf-8?B?WDdKTFdFZXFCMVJybWN2RFRqTEdKbXhUN3F3dXdjQ3hUVXB1WStOc3NiVVVy?=
 =?utf-8?B?czlqc09HOGNUK05KQWFPNmNiZ1lqVFJCaGlxM3ZBajZyVkRKQzJpS1VBbVRH?=
 =?utf-8?B?TXlVOFZicHp1M3lpSmRKL3dSWFVKQ2k1ZjNTR3g4L0c2OHpjdVoxNGxtcFpZ?=
 =?utf-8?B?TDBaY0VlVEpQWUM5OHFObEhKS3YrUCtmY1IrY256dW9BWnl0MlkrM3BkWk42?=
 =?utf-8?B?N290QWEydVNHNjllbnJ0cyt4c28zbThISFFJcHJnZERrSVRPMlhUL0xPYTBn?=
 =?utf-8?B?Y1lIeU5CZmxKRCtOUlV5WkppZkg2cWdDK3lTZFg2a0k4cmdKRTMwQ1NwdlQv?=
 =?utf-8?B?eFVRVk5uS1hnazlnQUZoQmhkU1ZlY3ByR2VxU0Vmb2tZY2FMRmQxZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D7B33E94A381547AD0A5E205AAB3D98@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f2c2d5-f95f-4dd7-b739-08d9e4a62464
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 10:40:47.4826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ESN+APQX8NKKKHfErGNkY8rGqLnrHHMwV/u7Wo89DoGSictVMu+7ULWmLARU6iR7qSxyJ8Q0uksseLQZBQUjmffhVgOTFL7eI/aCi5A2toKE/XHW+vhOYS/v03Wn3mh+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7427
X-Proofpoint-GUID: ETKS2BrDVz-m0_siqTzMCIQo6b_N1mWw
X-Proofpoint-ORIG-GUID: ETKS2BrDVz-m0_siqTzMCIQo6b_N1mWw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310070

T24gMzEuMDEuMjIgMTE6NDcsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPiBIaSwg
Um9nZXIhDQo+DQo+IE9uIDEyLjAxLjIyIDE0OjM1LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0K
Pj4NCj4+PiArc3RhdGljIHZvaWQgZ3Vlc3Rfcm9tX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2
ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdWludDMyX3QgdmFsLCB2b2lkICpkYXRhKQ0KPj4+ICt7DQo+Pj4gK30NCj4+PiArDQo+Pj4g
K3N0YXRpYyB1aW50MzJfdCBndWVzdF9yb21fcmVhZChjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRl
diwgdW5zaWduZWQgaW50IHJlZywNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHZvaWQgKmRhdGEpDQo+Pj4gK3sNCj4+PiArICAgIHJldHVybiAweGZmZmZmZmZmOw0KPj4+ICt9
DQo+PiBUaGVyZSBzaG91bGQgYmUgbm8gbmVlZCBmb3IgdGhvc2UgaGFuZGxlcnMuIEFzIHNhaWQg
ZWxzZXdoZXJlOiBmb3INCj4+IGd1ZXN0cyByZWdpc3RlcnMgbm90IGV4cGxpY2l0bHkgaGFuZGxl
ZCBzaG91bGQgcmV0dXJuIH4wIGZvciByZWFkcyBhbmQNCj4+IGRyb3Agd3JpdGVzLCB3aGljaCBp
cyB3aGF0IHlvdSBhcmUgcHJvcG9zaW5nIGhlcmUuDQo+IFllcywgeW91IGFyZSByaWdodDogSSBj
YW4gc2VlIGluIHZwY2lfcmVhZCB0aGF0IHdlIGVuZCB1cCByZWFkaW5nIH4wIGlmIG5vDQo+IGhh
bmRsZXIgZXhpc3RzICh3aGljaCBpcyB3aGF0IEkgZG8gaGVyZSB3aXRoIGd1ZXN0X3JvbV9yZWFk
KS4gQnV0IEkgYW0gbm90IHRoYXQNCj4gc3VyZSBhYm91dCB0aGUgZHJvcHBlZCB3cml0ZXM6DQo+
DQo+IHZvaWQgdnBjaV93cml0ZShwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcsIHVu
c2lnbmVkIGludCBzaXplLA0KPiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50
MzJfdCBkYXRhKQ0KPiB7DQo+ICAgwqDCoMKgIHVuc2lnbmVkIGludCBkYXRhX29mZnNldCA9IDA7
DQo+DQo+IFtzbmlwXQ0KPg0KPiAgIMKgwqDCoCBpZiAoIGRhdGFfb2Zmc2V0IDwgc2l6ZSApDQo+
ICAgwqDCoMKgwqDCoMKgwqAgLyogVGFpbGluZyBnYXAsIHdyaXRlIHRoZSByZW1haW5pbmcuICov
DQo+ICAgwqDCoMKgwqDCoMKgwqAgdnBjaV93cml0ZV9odyhzYmRmLCByZWcgKyBkYXRhX29mZnNl
dCwgc2l6ZSAtIGRhdGFfb2Zmc2V0LA0KPiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkYXRhID4+IChkYXRhX29mZnNldCAqIDgpKTsNCj4NCj4gc28gaXQgbG9v
a3MgbGlrZSBmb3IgdGhlIHVuLWhhbmRsZWQgd3JpdGVzIHdlIHN0aWxsIHJlYWNoIHRoZSBIVyBy
ZWdpc3Rlci4NCj4gQ291bGQgeW91IHBsZWFzZSB0ZWxsIGlmIHRoZSBjb2RlIGFib3ZlIG5lZWRz
IGltcHJvdmVtZW50IChsaWtlIGNoZWNraW5nDQo+IGlmIHRoZSB3cml0ZSB3YXMgaGFuZGxlZCkg
b3IgSSBzdGlsbCBuZWVkIHRvIHByb3ZpZGUgYSB3cml0ZSBoYW5kbGVyLCBlLmcuDQo+IGd1ZXN0
X3JvbV93cml0ZSBoZXJlPw0KSG0sIGJ1dCB0aGUgc2FtZSBhcHBsaWVzIHRvIHRoZSByZWFkcyBh
cyB3ZWxsLi4uIEFuZCB0aGlzIGlzIG5vIHN1cnByaXNlLA0KYXMgZm9yIHRoZSBndWVzdHMgSSBj
YW4gc2VlIHRoYXQgaXQgYWNjZXNzZXMgYWxsIHRoZSBjb25maWd1cmF0aW9uIHNwYWNlDQpyZWdp
c3RlcnMgdGhhdCBJIGRvbid0IGhhbmRsZS4gV2l0aG91dCB0aGF0IEkgd291bGQgaGF2ZSBndWVz
dHMgdW5hYmxlDQp0byBwcm9wZXJseSBzZXR1cCBhIFBDSSBkZXZpY2UgYmVpbmcgcGFzc2VkIHRo
cm91Z2guLi4gQW5kIHRoaXMgaXMgd2h5DQpJIGhhdmUgYSBiaWcgVE9ETyBpbiB0aGlzIHNlcmll
cyBkZXNjcmliaW5nIHVuaGFuZGxlZCByZWdpc3RlcnMuDQpTbywgaXQgc2VlbXMgdGhhdCBJIGRv
IG5lZWQgdG8gcHJvdmlkZSB0aG9zZSBoYW5kbGVycyB3aGljaCBJIG5lZWQgdG8NCmRyb3Agd3Jp
dGVzIGFuZCByZXR1cm4gfjAgb24gcmVhZHMu

