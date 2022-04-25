Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0061050DA7E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 09:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312410.529641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nitUo-0003OO-Po; Mon, 25 Apr 2022 07:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312410.529641; Mon, 25 Apr 2022 07:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nitUo-0003MZ-Mj; Mon, 25 Apr 2022 07:50:58 +0000
Received: by outflank-mailman (input) for mailman id 312410;
 Mon, 25 Apr 2022 07:50:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2itc=VD=citrix.com=prvs=107928106=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nitUm-0003MI-PA
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 07:50:56 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e13e3c4-c46c-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 09:50:54 +0200 (CEST)
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Apr 2022 03:50:51 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BL0PR03MB4289.namprd03.prod.outlook.com (2603:10b6:208:6c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Mon, 25 Apr
 2022 07:50:50 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 07:50:50 +0000
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
X-Inumbo-ID: 6e13e3c4-c46c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650873054;
  h=date:from:to:subject:message-id:mime-version;
  bh=iULifExNRLw2P/oVIh+trd/fPLbWVeUmhCbaLqog3+w=;
  b=DV2XgjKSdgRroq+Eg4dEe5zmtoWhJ9aig1Krh0+BgDZRYbV66y1yfLCc
   hqm2eAj+7I/Z7z8oyU4xcQAOOn1wtUuWFnToas499H2LbPYKr33p0sk+F
   fZvneMKxpxyAeRi58ml2KQev2nqb0TuXIjGfGmPgxhm6lxqe/FM9JvIIe
   w=;
X-IronPort-RemoteIP: 104.47.57.175
X-IronPort-MID: 69712376
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sgYGvKzgA9DtadrGSx96t+dgxyrEfRIJ4+MujC+fZmUNrF6WrkVVm
 jdNXWuCMqqPajT0LYslbo20o09S7JSEzYM3SQVqqyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY024ThWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplqaOCFQFxGb31x9syYT0ITQhTP6wZ0eqSSZS/mZT7I0zuVVLJmqwrIGRoeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeHOOTuoIwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GhImIB8gnK+8Lb5UDp7SpD6InkYeaLZ8aMa+t6r3fG+
 CHJqjGR7hYycYb3JSC+2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGEZlWWXtteL
 wkY/3QopK1rrUizFICiAlu/vWKOuQMaV5xICeom5QqRy63SpQGEGmwDST0HY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:pkEzYK30QkrkGdTX1q5JrgqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-IronPort-AV: E=Sophos;i="5.90,287,1643691600"; 
   d="scan'208";a="69712376"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mxpb9stK+fiOtinFMGPti+tQRUU+hZKHl8/ohO7pymPymYeRv8sWrLb031rVd/nYtnYyVNk0ppg4ANh9pvEaSDgC+19lQUe1/NLlaCOqWzfrcRCdl5oiowPKnmHsM2i3Bdez8rBQ2/YX1I6TnjdOGoJOFrh9i+SE/UNgUEl+FaRgyiwgZLFM8O2ajpwlyYzYxI+/Utj6WNkOG/WGNyISyh53VAUyJ0+qyYwSXMo6WhLhpgJTCXqnt9roaN8L6DyTBkOWClqVvajc6pCfyDF2crf3LRoNuXZ6Cp+KJwGgX7h1aG3NE1EZ32SDgI1EmQO+0HwVlmTxlreaJGEkyH28Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iULifExNRLw2P/oVIh+trd/fPLbWVeUmhCbaLqog3+w=;
 b=Yb/bzHgBplUzVcFKytzsCFAC8mmADqW6PQUkYP2Rd3k6fRfe/J2mdVaPo+JVihhWymym4toKgSMR91nbNJIXEU5ycTK6P6tgWgVSQQ70yWpJbELj9yh/WyI0DiMQ5uT+FbcBXvIuV0VZLcIQ4P+S8nusLPJqPWvC0iuFDmMi2PTh/3+W3kO1eNC6wBAlC5DaJgugUre6VCvpzXNw64s1BgFbn2jEJTKez1YhQ3keNmstvA+kqemrxPCauIB+bXMxE17vA6STzuJ3IxaoCnksnKLBx6cKsvk6pDG0/fR8EOjZwqPuzmcD1HYTMUBOs7XVrMBfs/2SZuKX4QZswWvjTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iULifExNRLw2P/oVIh+trd/fPLbWVeUmhCbaLqog3+w=;
 b=U6RzX1ey407I6fc1YIhF7K2uzCqI6/tfdC0bGoQBYMpbuKREhrjLQvv/ogG+5XIKiO9Wvq9ql371NcLXfR9g+u+P666kS0F+nnpyR48HKiq3uaOTG+c7oK0je5kBR3DcFUFBepPHDY4NBFWgOHRZT+2qRN28uOUjnNB+tUx1Ovc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 25 Apr 2022 09:50:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Subject: osstest: noceras back into production
Message-ID: <YmZS1EduV4tOsxrT@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-ClientProxiedBy: MR1P264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 205c0465-e259-4de3-cc9d-08da269050c8
X-MS-TrafficTypeDiagnostic: BL0PR03MB4289:EE_
X-Microsoft-Antispam-PRVS:
	<BL0PR03MB428989028F4AB9F9DD57BC788FF89@BL0PR03MB4289.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hH8RfrLWCSeiAXUMLd2wuKZ087KWVcmVeIpoKygbJNI745UxA0XiZeaQpSIaMfkl5PalHyUvmeAc2FYTlk7ckpzYB4iRUUatxGQ1+bDf0HuVIaH+rVl+7EJJ7wly0j3UaP1pv4ccG3unsCwEnXgA1jr2QYdpJUFxZpXWDKWtz/H+VvQbeNJhRBxwLVk4j2syQl2LIDTYJHKgCkjKPKryQ2R2eJ8drs/5FNFgEZX6TLPBZAb02jy4M4zem7fp+dY4KnoDdIH5Em1x5bYidAJ3ElQeMDonjEb610r7hfezVKZJIIzggdz4tGH9QC3/PtVb7pDOO8pPPfUL8PZfmDpfuiPtiR8CHVe7yENyyo18tE0APO1O3ZWov0ToM3rrmqj0sJ21ildRds+CS9WXCOjg3gVFgbtzddCL2gQz45YyVZznRnxuxYR3RlnzMICXklS7/z1l/ADdjbSDUMK9jL00EeubANW0uYqRFUK60cCdzDLU4N7zFwEPzSddBQrBzVoWT6lKepDi4ZNZQHDd5QqZR6FgNldsxi1J6eZpU0zc7lVaKVRmz0STdzlzYTSFCKE9f7jIfIFn8/RXggfdEln/M9tsjuJ/buOD1RkzzkeKqy4nbjqlAGwH+AVIR6Ktpp60jxg9OgSIhrX/pMfd78Drc0cECUR34ShDu2uzdyuG+Yb3INOeKvritORGz0ZiemEougHQwdtOOPxejXduvJyaVum2QhJ6Fe5MnetdvdR+Mu2fY5avv+YodoQec7esRzMzCB4xy16gW/T6H7kNa3b69jXcxMsA0gXczYXERTCUVz0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6512007)(9686003)(26005)(186003)(6916009)(6506007)(85182001)(33716001)(558084003)(508600001)(6486002)(966005)(38100700002)(86362001)(5660300002)(2906002)(316002)(6666004)(82960400001)(8676002)(8936002)(66946007)(66476007)(66556008)(15302535012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUtxV0x2UWNrdTBaaG5IUEltVEJNVWxQYkJ4bU5VM2hlWXhwWHJvZnRneU4w?=
 =?utf-8?B?V2IxWmNOallPZjZYdHBJVi9uQUdFYnY5bVBMWGt0OTRZYjlIejk5V21OWCsr?=
 =?utf-8?B?a1YvdHNYMlZkTVpQT0pQYXNjejJIMVdaSTFpMzhObDRoZlpxK2N6d1pzak1v?=
 =?utf-8?B?Yk5rajN6QlRzcGszQ2s3dlhqYkRlVEhLd0FCaHlEN2lrVjR4OUU4dHFRYng2?=
 =?utf-8?B?bDYrU2IvcXA3SDNKTFRxWHZOOHdDOXlveUMyaTMwYm5VTjVuRGx5UFFVTmxJ?=
 =?utf-8?B?OGk3UkZEaXloQlg0d0dUVWRmTjdvaHY1aUo5dHpTOE5XSkRXTnZ5VGhKdDZq?=
 =?utf-8?B?ZExRS2JIdXRFU2pmWTN0YTBmMS93Tm0rdmxrdks2TkRsbDNSOVJacjVrdW9m?=
 =?utf-8?B?alZTcmtEdkcvZjZGc0ZxdEh0dE5kK1N6dVB2NWRiZ05adWtYUzZHcGdrUTNU?=
 =?utf-8?B?UTZ6V3NUdFhBZEJlM2wzS1hkR1BWU1JsY3QzUTBpVE9sZU12Mlg4NDVXK2hF?=
 =?utf-8?B?VE1nU05heDBWbHpuOEdES1JmbWl4OUhiK2NwMHRMdDFLemNabmsrKy9VMFFN?=
 =?utf-8?B?UUhMU2dTUGJBaDBRZFVkV2pPOW5kTjh5R29vS3A3aTQxQm42ZXdUVUEyTjBD?=
 =?utf-8?B?RFlpWTBEQWZ0VndPYVZVMUlsWk1Sdys4NkwzKzlPWHF2eUJDTkp3em9mZ2lp?=
 =?utf-8?B?b1JzaVhNWWdCY0Q5d3NMbyt4R2QwcFJHenJmVVp4TUZra1RxcG5vSFNWTytK?=
 =?utf-8?B?bVV4NjgxZ3JnM0RRT0UwQVRqM1dzSUQzWU9DOGV3dU1MVW5BY2c1Tk9ZMHJi?=
 =?utf-8?B?cWdpeHM4NnBkRU00ZXBqdmhpbEhvMjBOY1o2TmdnMzUxRkpvOVIvSHdMMGxI?=
 =?utf-8?B?Y0NCWTBnQjdZOStVd2RNMGpOUG5EK240R052SFF3MlFpV0lqTEFESFNIbktz?=
 =?utf-8?B?dW5tTG45aDlTL0JlYXFJekNLZTZCb2ZBSHBGd0Y4WWlVdU5BNjBZZzdUc2xC?=
 =?utf-8?B?SzlTYVpYQ211bVpua3l0RFByZyt5M0N6aVNScGxrUVhZNWdsRTUwaGNvOFAw?=
 =?utf-8?B?Zlc2ZjM2OWhrdkd3MDZWK1E5c2lEUXphbitWOXFMc0ZMM3hLWEVoLzNGZ0ZY?=
 =?utf-8?B?N09MZHFqS0drMFJJbWN2d21QQkxsMVpyUnU1OWVqaXlBYzBoSVRrMlRGNk9y?=
 =?utf-8?B?V0M5VUwzQi9NcDRBNVh4blIyd3JWOW55K2wyZ3IyS1hKUnVlTVA4cUQxNXF0?=
 =?utf-8?B?T05YS21OdUhNd0YwTHUvL2hvaW53UEtiVGowVmF6d0xOUXFXSitrZ2cvVU8y?=
 =?utf-8?B?VDhWU0ZjZ2RnTnV4RVowTG1YY2lhZ2FzR2ZsSWJTcm84NS9LZEdoL1dmMk43?=
 =?utf-8?B?RU5uRzB6VDBjclV2RFdGVHE4cFNvK0xIK1Z0NEU4OVdMbUJaMVZObU9xcS93?=
 =?utf-8?B?SVFKVXc1TDRvQ3N5RmxZMUR6YVdjSEJZQlAzVFJJbG5BS0xqWGdZeHNmVEI5?=
 =?utf-8?B?RVBhSTc2SU5WS1hpMWZNc0tBZC9YZWlVcUZwN2lrUDFtRDRLZmdSbTlyaTlx?=
 =?utf-8?B?cTJaMC9YR0xWa3hITnBWNUNhaHcwWTJYR2dsZWRsb25tUTJUSnZIdDdNWis1?=
 =?utf-8?B?amx2VXJGd3VPTjFBMjhwVmZ0QUJobEVIbkhkSkwrL004blIrTmJmeE9URWlw?=
 =?utf-8?B?VkR4Q2QvV21NVEE1ME5UZGdQYlc5Q3lPRklYTnJjMytjbjhxNFFoYnlML2tD?=
 =?utf-8?B?S2NCRmxZYTJBNUZMN1VpU1dtd1RBd3RIb1o4YUZWTEd0MnR3WUxVbjgxUHB5?=
 =?utf-8?B?ZDRKd2NYUnY5SzE5N2NPb1U0Q1JvM3FqMGthdms0VzMxbTJtYXkyeHhUNC95?=
 =?utf-8?B?Q0JGR0RtbVFqTXh3OExzTWREN1FzaVIwV2tlaDhEMmR5cG9jalByWk9SdzhO?=
 =?utf-8?B?SStUTVhLL09lTDZyU2lXWVVNZE9td1dpSy8wenJxZ2JxR2ptU0tFS0luK3l5?=
 =?utf-8?B?YUJxa3J1UDBOSHErUlZZUzZIbytNOW1mSUVuRmVnUjdrNVQxK0xmcU82SEp3?=
 =?utf-8?B?MW1tbjgzMWxscFduT1U4MGVEbThrZFVFZ1Bza21FSFpjckJpMFF2dFNPU21q?=
 =?utf-8?B?UWIvSEN1NDZ2SmVsV01MeVZ5b1ZBTThKMkFTcmVDTWF4aWlQOEJkS3o2SUVE?=
 =?utf-8?B?TDlvZ3JmaWtzN2psZUE1MnVwYmtUSWtDSkdkdDhUMVgxam9NZTZWTjdqR0V1?=
 =?utf-8?B?NGJmY2p5MXRwUDZFVXkvVHVZd0d5TU8xcGFoU1RtNncxb0VReWloeFk2cjdr?=
 =?utf-8?B?bTBpcEp4UDVNc2ZDZ1dhV2Q5dWkwZUxnaWJGSGVkdGp3TjNRZllBQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 205c0465-e259-4de3-cc9d-08da269050c8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 07:50:49.9454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +CzoHVHOiS6cYezPYOmH07ryirpTQQaigXAkacoN1bvT37lxpkSMkFYhp3SWiDwwq4jkDFdt389Cbz6XAf1ehQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4289

Hello,

The noceras seem to be in working condition again after plugging the
hard disks directly into the built in motherboard controller instead
of using the external LSI RAID card:

http://logs.test-lab.xenproject.org/osstest/logs/169619/

I will bless those now for real test usage.

Roger.

