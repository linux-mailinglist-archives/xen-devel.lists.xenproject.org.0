Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F945797B9
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 12:33:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370531.602323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDkWo-0000Dr-Ql; Tue, 19 Jul 2022 10:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370531.602323; Tue, 19 Jul 2022 10:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDkWo-00009y-Ni; Tue, 19 Jul 2022 10:32:34 +0000
Received: by outflank-mailman (input) for mailman id 370531;
 Tue, 19 Jul 2022 10:32:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUxJ=XY=epam.com=prvs=91999985f2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1oDkWn-00009R-A9
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 10:32:33 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17bebed3-074e-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 12:32:31 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26J9c4iE016342;
 Tue, 19 Jul 2022 10:32:27 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3hdt2yg6ke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jul 2022 10:32:27 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM9PR03MB7948.eurprd03.prod.outlook.com (2603:10a6:20b:43b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 10:32:25 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::3db3:dad:7bd7:4488]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::3db3:dad:7bd7:4488%7]) with mapi id 15.20.5417.035; Tue, 19 Jul 2022
 10:32:25 +0000
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
X-Inumbo-ID: 17bebed3-074e-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqjqhUN6NZIMWs7cesoqNtyc016duieGA+OpXt/1BzygLNcH7puLWf0PxWlK4vFNtHezWgBWEEIfSEBCegeWrzynpvo6sdeDyc2KvNwT2V0YCmYGGv67nuf73Z0mH+PvDXlyO9wwy+azc6m1DQ/F8ljtBXFgJlVfWaNA12v9n9jQTdx/bRxvYRfs+6CkTLUU2MoC3wpgZpKCjgyPKM/zMGY1rET0HIYl6snoQ9iLyYZSeb3wSOZiVItUXJ1EBh4W9K8WULbsmK6N7qBSCMrr8xG3dsoPhuNC9YSrCxG7v4p9qJyMfYLjAMDjddUOqqg2+meTuG/VVlDe54xIRQMfCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BY2AUKfBxi9X7pJmjnwBZcV/H/f0NIH5eYvKnlU1nYE=;
 b=OBZrMQ1yzUQgMBuWoAepy5scmJDN2kwmjobXLq70j5JWeeYuoNqhUKrqrHW6Wk5WBl6a4f6DyQ5qjGxZL8xR5eXR3TI89wyhCV9kwg4An3l3YgsaloR1RJC+WrcpYem0lC41v6H9BXS70cvst01Z7XRtzBtJVwbwXtrKqiJmktHhR1JgXWIQqBS3UH8V0anyzPWnLlQClGG+nr+PeglSnjabSMYHNI6Di/eYhXIpe2thYPvutHnm2RqNfgfKHTT+Nv/VH9OHXhse6RyqrN9mR6vPoZSNwZwiSOCAU/Vu8aoe5brTlYCZ7/BrA1UoBEQV9ouMiOuodxkcKt34RI48HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BY2AUKfBxi9X7pJmjnwBZcV/H/f0NIH5eYvKnlU1nYE=;
 b=abqc0ZfgTG7VdsR+VaJO++6j5rZPJvbotC42cD91RDg66l5qjBDah5Zn2ys7k3lY4GB/N9SxJM2VJ05SuyUEmYQ4CISot3v8If6L7efxVXz8bUEbjBeoslpaBTBucFKPJwEADNVvp8XWOUN62PMbXFxlwn9YB64QW86yYipIqtS3Ro5kjpYnLke6J3jVIu3q5jGDyot/UrsvKzK6A3lPtl1fx/KAFt+k/5YCOupnoVftSIM+6TI6Ld/eBLLPGHBkp3F82tPhs63AcpksyWV4LYRDrFAwOvIM6+bQKULaJw6Puz9gUC3lggA9amXtPaWcHNkrWu3ky652h1z2UZf2XQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/4] vpci: include xen/vmap.h to fix build on ARM
Thread-Topic: [PATCH v2 4/4] vpci: include xen/vmap.h to fix build on ARM
Thread-Index: AQHYmuuJ09LC1x/2uEWs942YY/fNVK2FNeCAgABJdQA=
Date: Tue, 19 Jul 2022 10:32:25 +0000
Message-ID: <87ilntgzpj.fsf@epam.com>
References: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
 <20220718211521.664729-5-volodymyr_babchuk@epam.com>
 <b4554a1f-73ab-7a46-591b-ccb5bb34ea1f@suse.com>
In-Reply-To: <b4554a1f-73ab-7a46-591b-ccb5bb34ea1f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 28.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90166373-770f-46e2-69d6-08da6971f8bb
x-ms-traffictypediagnostic: AM9PR03MB7948:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6v+4zrcmE/yL8IM6y9g2VUOT3EROJY/nTW1Lbj1UurvF4UGCl6LU9Jktem5N9zP1nwbT4YXm8xc7RKd0qslkMYqdFI0vJ75uHXxyzT9uZ78cYJQa0Sr3FJtivZj3zrx0VdVoZ2cvC6A1k0zemAmv5zN2qcoODwPEw4vrvVdEhtH/7us3E9sttrBAI8DMyhF+aRLOkYpY/SWmZgdIk33R8F3Sz3UgAKfTYgqoOLkTfBEqTbfmw3ZZFRvhkbX2v15e9Olqu+JxGyQ9P2G7SuPGDP/bRRG4DrOE/4pRSlsFkSgCWIyAYXkdOiB7KfJ9XK5wtj8LukQjZsLBR6iJKxAvT6+0bZgqp3BeVAxU5aNCmkdJGih+4B8k9bHmxRCPcIlAgpMzaW5RDum3tv6X3MhvJ+sRbCXxI+mp2g67FYA+vldK8gLkdirX5aMD/RMXtGpssPsvEpnxdzo20aqWZHefJKW/RqJSL8GWBzeS72FEX89R13jVLDTsAlWM8/stnFH2IqnGoOU9lknsAmLgXxYQAKa3symvcAZV6JhW93HUIgXE89Yf/+0rAcVS4ZQI6mwRKPtX8Ok8p1K64o2EhAMPR5YX+vYn+6/1qtO/4q+rgPRtfdCPoj4wi7Jhtss4qxSRCIyfiZ8tLWWQl5dBKWV5dZurlwJyI0bKSDzUTmAe7FqqFqnFaAcHb46w9v5/MMbJifkcBEb0qq2BddhlZo+1JhzOFKutkyGkDmaTG8pFrpAvqhTN3Og/URAnFOBjJi+Tkr8fwDRz4CQHNlggfBYeJh3VQ/1XS2moYYvrenQ/q5g=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(66556008)(41300700001)(6486002)(122000001)(186003)(478600001)(71200400001)(53546011)(2616005)(55236004)(26005)(38100700002)(83380400001)(38070700005)(66946007)(66476007)(6512007)(6506007)(66446008)(2906002)(4744005)(5660300002)(8936002)(4326008)(91956017)(8676002)(76116006)(6916009)(36756003)(316002)(54906003)(64756008)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?pWWvQqK82oElIBOHaPEVRf1iCHEYuhaAXZifs5ok+jYaHSbk2pIMNA15qJ?=
 =?iso-8859-1?Q?pwJ5bG8SCA1rHUWls7aM7+HNL83LH1vqqlGGTeMdPfwYiuftiGVjzg5KFM?=
 =?iso-8859-1?Q?e3/bWdZbo670HVo/4GRhf+5YF2ip5ERXMBUz1T5FwZFHKxz80SFOg27wJm?=
 =?iso-8859-1?Q?GRKNdlJG1USPGvpvhiHe7h3nrwNi1/HjGTReBc6RgF3s1CvgnEytO3DD0w?=
 =?iso-8859-1?Q?F598J6AHRtHdBY9NEihBBffcatFaO9VbMXkg35vQ3epQ88ZqbhvMgs/HwB?=
 =?iso-8859-1?Q?QnpirvCV5J0Iad8yqyDJFxR6Ly8al/6Mixgl19Nuzva56zSpmQs0QrYSel?=
 =?iso-8859-1?Q?vSQAxtRegxFN+2wjs5fw52rlWfTsVw067DPouuVRNTxrT60JckPE3pCquV?=
 =?iso-8859-1?Q?duK5MToVTnzasDlRUwfoFbE3xKZQG+z1Am8VzQyqPdqcWGr/SDxpdbxOeb?=
 =?iso-8859-1?Q?ZJtDd7SH0zs1C+8TR9WE6k11sjLASyW+yfj4cEG2ti/vWBPKJ/bzM5xBtf?=
 =?iso-8859-1?Q?K4bFFTuNVdvNudX12UfmzSWHX1QzAB14H5IcGllUrh39BCfXBn74EjuJ8i?=
 =?iso-8859-1?Q?A6MEFbJD4PGYP2XGVCauFA7/2qDp6nWzoTYiga9QnTn5XSVyNmizcACyYJ?=
 =?iso-8859-1?Q?EqhiUYzyCwF10g09raovcZoki+Gvcn3N3KrLvsR5g5FLktIP+jS8fv5tOu?=
 =?iso-8859-1?Q?r102EyHBDZ5LjkGVKdomUaXtlmjkxx5dBRmV/RJC9z8hFBNtLftn40tlZ4?=
 =?iso-8859-1?Q?HiY9480193Ap0VUbkD3Uy+AEC54UpinkgiMLnNK1pv1os+hDoYyom1PSdT?=
 =?iso-8859-1?Q?6HrDwGhDsqobitPdPilQ01ak8H161h3SxHpz5qWSFllNrmtqXF7DrcGcwv?=
 =?iso-8859-1?Q?8tOytjQCDE6+bG4eCb09ieLSfymc9D5tk02FU0nfvN63oSPABGfcaTUnLT?=
 =?iso-8859-1?Q?aQY4pwiAHCz0gYW3yjQM9Y+X7mc/sRYlFXYx8UG2tZMRLn54zKiZxb5zDQ?=
 =?iso-8859-1?Q?ggFE8GmYoBsowRO15IZoVFCq4R5QkWLFSAR/8FOK0of6y2ngbBtEeZ6JW/?=
 =?iso-8859-1?Q?c4w5+QxCJiTI/PIfz565VTM99xMm62H4ufYJAsC392WhXK6gzYwQ/0mU84?=
 =?iso-8859-1?Q?fKq/lL07jM8c+5aDVc4kt8603QD6xNh6nxN54KpYoKGiu2piWL9Bu+xYdw?=
 =?iso-8859-1?Q?8s+/qhJY2Pdqix6Oj6rDAqDRDbo19WDvPq/3pfE8iCV3XmUIyTbWJ7c6IU?=
 =?iso-8859-1?Q?/KXE2m2qVHxsbho86v7KYzalP+8tzwI7pLOnlN63jCtcqBSnbjPoGSMxOS?=
 =?iso-8859-1?Q?pYG6gxSyYggIm/BT82peif1uYhlSY+GaBChI0ixEKpDjy+xg4mPFv+w2Ba?=
 =?iso-8859-1?Q?tKHiz+Y8mUUAfRJsyFJQ6V/8Fn7RL3QKaUvsk7Z7X0QRjSNBjmLbJ+6Q8U?=
 =?iso-8859-1?Q?VE/INzgtXqUaXWVg4rTEZ9q/8MJbsjfCW7DkEzlYLzkpAdgJlWHuzoo7OS?=
 =?iso-8859-1?Q?vZrmBMqYaqxCDtGqBYp/vylVREnzv/LAXMvIpGK1OH2mG8T4hIXNGCH5sh?=
 =?iso-8859-1?Q?bD1XNkQI957JIdC6+tLJAqPqkNG9ftVRkj2LT5h1ec4owTaLWjOKv5F7No?=
 =?iso-8859-1?Q?bw+bcB++IVZGpswpzkhd9yDDJ2R4K8cI9NxkkRlQ21b4jj/IcytKaAJA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90166373-770f-46e2-69d6-08da6971f8bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 10:32:25.1130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B7syTT87qDDfTq9E1I0Fqe2HrREqTGRL7tqrbCbq+qdeJJ+Z+JalOyDCWgFqEq8s9cbsKPkUleGYfV2iB1iZ0KyrdjAibbQGXR1gkIGkiSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7948
X-Proofpoint-GUID: 24UIyhoREGNrPAodSvB8CtVuga0TKTXW
X-Proofpoint-ORIG-GUID: 24UIyhoREGNrPAodSvB8CtVuga0TKTXW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_22,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxlogscore=663 suspectscore=0 impostorscore=0 priorityscore=1501
 mlxscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207190044


Hello Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 18.07.2022 23:15, Volodymyr Babchuk wrote:
>> Patch b4f211606011 ("vpci/msix: fix PBA accesses") introduced call to
>> iounmap(), but not added corresponding include.
>>=20
>> Fixes: b4f211606011 ("vpci/msix: fix PBA accesses")
>
> I don't think there's any active issue with the "missing" include:
> That's only a problem once Arm has vPCI code enabled? In which
> case I don't think a Fixes: tag is warranted.
>

Fair enough. May I ask committer to drop this tag?

>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>
> With Roger away and on the basis that I'm sure we won't mind the
> change:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thank you,

--=20
Volodymyr Babchuk at EPAM=

