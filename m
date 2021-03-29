Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6A334CF38
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 13:41:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.102963.196541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQqFt-0001Sq-40; Mon, 29 Mar 2021 11:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102963.196541; Mon, 29 Mar 2021 11:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQqFt-0001SR-0c; Mon, 29 Mar 2021 11:40:25 +0000
Received: by outflank-mailman (input) for mailman id 102963;
 Mon, 29 Mar 2021 11:40:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vM0b=I3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lQqFr-0001SM-Uo
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 11:40:24 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce0707cf-ec34-4b07-a0f3-217e4b734653;
 Mon, 29 Mar 2021 11:40:22 +0000 (UTC)
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
X-Inumbo-ID: ce0707cf-ec34-4b07-a0f3-217e4b734653
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617018022;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5Zi09haqp5DcxvhE/zCjuqmg4Y7tuPjN1RMdHV6x8es=;
  b=DDYmaXay2DGZ1dj3JAsos2KeFQoHll5mHGu/LgkqckuDmOheFdV/tUNd
   w/3KR0YsSyCLQmKSSgoSCfm0q1P/axsq2VQNamOsTMohCnMlFy08Gg1Lh
   au3+BV4KOShGYUcHBn4NQTm7snaxb8EG+ZixfRUZYgcoIszaNp5bZgl6X
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GL00tQ5A5eOdvQM+9hcGOm/5vsYNEkF9xK1FWWrVNNKca+MiUDKLVCoOLReePgXvQ9+FnxKIcC
 uq7BQnJ/xDkJQaD1LPrbOaJ/jwb8iPh7pUaN2+FThDPnGwVMjfBi4cXsY/r9zW9OR4rONkKlPA
 ZEj0VGm363j5whLyc/gyPueJXbN6LGuwTp/JGvZZe9jV+THoe45WBIlS2jbHg2/VidsqBgs9NB
 7ajq/KQAQWjGE+ng5Glh64SvU3nmpaPiwi2W+XdGGfKys0nQqj9qV59MK3+xygsJoL5EkMviPf
 u0c=
X-SBRS: 5.2
X-MesageID: 40319036
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:BddH26ulcJPZSExQBJNHV2Nb7skCxoYji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOjrU5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qw6Y
 5JSII7MtH5CDFB4PrSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjjtRICzzKDwQeCBtA50lGJ
 2AoudGvSOnY3QLbsK9b0N1JdTrjdvNiZ7gfFo6HBYh8gaDlneF77T9Hhie0H4lIk5y6J0l9n
 XIlBG827W7v5iAu2Th/kLwz7ATotvuzdNfGNeB4/J6FhzAghulDb4ROYGqkysypIiUmTMXuf
 nK5ywtJsFir07WF1vF3SfF/ynF/HIQ52T5yVme6EGT0fDRYD4hEcJOicZ4X3LimjMdlepx2q
 5KwG6V3qA/ZXir/FWflqr1fipnmUaurX0pnfR7tQ0mbaIkZKJMtotaxUtJEf47bVPHwbo6G+
 pjBty03ocxTXqmaRnizw1S6e3pdHEyEhCae1MFq8yY3hNH9UoJsXcw9YgxmGwN+4k6TIQBz+
 PYMr5wnLULdcMOa7lhbd1xDfefOyjoe1bhIWiSKVPoGOUuPG/MkYf+5PEQ6PuxcJIF4ZMukP
 36IRxlnF93X3irJdyF3ZVN/ByIan66Ry7RxsZX4IU8kqHgRZLwWBfzCGwGoo+FmbEyE8fbU/
 G8NNZ9GPn4N1bjHo5PwknXR4RSE38DS8cY0+xLGm6mk4buEMnHp+bbePHcKP7GCjA/QF7yBX
 MFQXzdP8NFwke3WmLpoRTYVn/3E3aPv65YIez/xaw+2YINPopDvkw+klKi/PyGLjVEr+gXcS
 JFUfbau5L+gVPz0XfD7m1vNBYYJF1S+q/cX3RDohJPF0v1dL0EquiOYGw65grCGjZPC+ftVC
 JPrVV+/qy6a7aKwzo5Nt6hOmWGy1weuWyNVJVZvqGY/8/qdtcZA/8dKeJMPDSOMyYwtRdhqW
 9FZgNBbFTYDCnShaKsi4FRIvreedl6iAKCOtVVtnrbiEWZqagUNzgmdg/rdfTSrRclRjJSiF
 E02bQYmqC8lTGmLnZ6vP41K2RWaGOcAKtPCSOMYIk8oMGtRChACUOxwRCKgRA6fWTns2EfnH
 boIyGvdfbXOVZFoXxD3qH28FR7S3WFcytLGwNHmLw4MV6Dlmd40OeNaKb26WeXZ1cY6sw2MT
 3OY1IpU0hT7uHy8CTQtCeJFH0gyJlrA/fUC647darPnlm3LpeTqK0AF/hI3ZpsOdz0qNUXWe
 aHdwL9FkK/N8oZnyiu4lo1Mih9r3cp1c7y0Br+9W6iwToRB+HRLFkOfcBsH/isq0zfA9CG35
 VygYhr4a+eMmDtZsWHzq+SRThZMR/XqXO3SeZtiZ08h9NHiJJDW73gFR3P3zV7+T97CuHevk
 YXWr5677DMIZUHRb1bRwtpun4S0O2SJ04quDHsCuAwfVsRn2bWVun5lobgmP4KOAm9vwP+Nl
 mUzj1F89rEVyWF06QGC6hYGxUgVGEMrFBj9viFbYveFUGDcPxC5kOzNhaGAfVgYZnAPbUbtR
 Bh5d6U28eRairjwQjV+R92OLhH/WriYcS8Bmu3aKN12u3/HVSHma2x5sGvyB/xVDugckwdwb
 R/SnZ4VLULthASyKst0iazTaTrokUq13tmiAsX6WLF68yB+2fUHUZPLAvDpI5ZNAMja0S1sQ
 ==
X-IronPort-AV: E=Sophos;i="5.81,287,1610427600"; 
   d="scan'208";a="40319036"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJ8AYPaNHQ6PvR6w9EDs6XyLQ2UoiqEEHKK/86oxbvxwItYbQxLRsmCy6ul4KmHFBhuFSnpgD/oFPMWSvvizkR/lC6q+XO+CNVX+qJFbXvuoZQEwcge0FlcDPwRycU3VdaKfvLlBaSXeSJObGIsZbfFdtnC9Qjgjo/QFcp5xxYQxNcxR+VmCFH20nqJmaCBgCnubikpqxgFBsR08H603fUhMufZVY3G04UokzXVFZl/XduJ5h7C4w58EMOqfv/LFgJVdJ+s/1yU3Vseu9kkzzlC7UbLcKybjWPKO2rfWOxI3eVRLK99R4efvTZM+TWDRUIiDtZqs5gbuu5+aAt7iBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gLKGKti2R4HmzLf/MvxctvsNUBdPdGoIqclvp8+Wps=;
 b=EE+oP+bVDYbwniTXZIE1EMnxIKu82ZRQQ8nzIB0du7lQRa0/qFC0p4cXzuKGB26LlEgVkt+Ggm1zJ0CWyEP6hfZZKmvxMnBzYFm2TTWR76TFUNilKF2lSYz/XSA3lga3KeRoWSGiIsSP5O0YirikR+V531oAa4rwGGUxFMvL3FmMBQkRYoPPyxoavsk1qAP8wFpyB4By0uomLK22gobvgW4oWoGyvxCXfcG/bjTGNOi/Uj+5SDuRNdJMYk6mjbr4cseztenXU+Bh0ZuK5ywSZMQKvVuctDMOMYIskkRPh57+DOkjV/mCVdPc5srnnBQaez3cMOzn2j1GxmB3O5DaKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gLKGKti2R4HmzLf/MvxctvsNUBdPdGoIqclvp8+Wps=;
 b=MhccAGQArwwT8ijaSiqFkVEUdKzIMLJUkQx8cp+91PYpI4vGohUDGo0nFNmS/Gg7TFazHvKVyyf5A577tQ93C+tkqoHqWapRsbbPpz5sKgc69L8AvTX29f13YJLrzZB+bLgF62JioH+Lg8aQoA5vtWBANkYREIRR/6CWSqUdaoY=
Date: Mon, 29 Mar 2021 13:40:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, =?utf-8?B?RnLDqWTDqXJpYw==?= Pierret
	<frederic.pierret@qubes-os.org>
Subject: Re: [PATCH v2 2/3] x86/hpet: Don't enable legacy replacement mode
 unconditionally
Message-ID: <YGG8mnYrfPNxbCCc@Air-de-Roger>
References: <20210326185947.23243-1-andrew.cooper3@citrix.com>
 <20210326185947.23243-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210326185947.23243-3-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR2P264CA0038.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::26)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ace51d5d-c7ab-4d7b-7b89-08d8f2a76c3d
X-MS-TrafficTypeDiagnostic: DM6PR03MB3948:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3948D7F42F18806560C828918F7E9@DM6PR03MB3948.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XS6LknUqa0GjtMms8KblswUwt7vZNQWEa/EPOVr3K5ZZ1PyRAbWLJyg365vy6glmy2CPRqEWHyZbAvnrWChksu8KplpakILaUF+smYXN7US3rt25JcqQXUnTMEgvV3nAtCyJv8o0zoAliZ/mYmUKjO18DhVFf4n0ifbIdkag8gPw0eFYRGpqRGWX3ecHzp7Pli9KgrLPbegpAcYNS8WF2Sjnx0FkH2yyXMIi/QYVG0jXOwyMh1H0gx9z2TRp0GLLLt5MNmwv+ecdcTPJV6G6HPWvbjj+mptVcrhTqvXrmB6xobmUedq0PSh883uyq8vIanb9TeyL7XVY7P6UtMsYCEYkRrMTmiqq4l1W+9PpoK2Qc/Lxm2UbKSqdwS2HQi61tt7Ap86sUo+nQZRX6aTnQbL3GpuZhsMNGxJxZXo1J5B+89G+bMGHolmsYlKqP2MfMxZ+swcrUxwDq3HMrx/a6CoW5xbTyGvokIx0rSUxwFiujG3PhezUf2ALYGqDnqyBLDohCbjzvTBdzPb6yChyT3Tt637tPLLvOZwuWoSOo7FMWX5FpHtQyXJI+vZMXZ5CPnRreX+Fjd0FS09vf3hRGBy7uvfFUf7nmYf2FNVSvCC8Ni/MyWAXrIc4LMMun8IUwSSImblMU4IBRplVd2C1kje6pjL985+JrtFU5wyOICY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(66946007)(66556008)(66476007)(6636002)(26005)(38100700001)(8936002)(6496006)(2906002)(83380400001)(8676002)(316002)(33716001)(85182001)(186003)(6486002)(66574015)(86362001)(6666004)(478600001)(4326008)(956004)(5660300002)(6862004)(9686003)(16526019)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VGxhbURleHVmYXU4MVEwZWtXeDNEN1JkOHUyeUtzTkQyaWo5eGNhZzNMbWNH?=
 =?utf-8?B?NUdrQkVaSzU4bGFxT3p2dmlaT2pIUk9BbnZEdmtwM1BTajRhSExUWHI4ODBk?=
 =?utf-8?B?akVQci9Bd3lyOEUzT0Z5M2NBYUJ2TFdzcDA3eW1SajVESEJabDN2VG83VEtt?=
 =?utf-8?B?ZHVVbVphOVcweUNXV1BKbmJOUE0wNEV6ZThDRDZIdDlKelA4L3pHbUVmc2xK?=
 =?utf-8?B?Y1B6R3NNWldpeTl5YTRpc0tqc2syY0xONFRjUTBoUndYcFVnR1o0ZWJpNnJD?=
 =?utf-8?B?b2JlSlBrTWhEUW4xcW8xcnRtNDV3SnpBMFBuL1BON2VNYjNuVURza3c1MTN5?=
 =?utf-8?B?M202dk9XdGdFMDlwZ1lwaktuSEpadDJ1VW90VFpqUHdTeW1aenJwUTV3cTdC?=
 =?utf-8?B?VXFEN2dpcGpWRmV3djE5cFRpdmdGRTBnQm00TnZWbC9mU1Y0Z3FoVXNNZGtV?=
 =?utf-8?B?SVpjL2wvUEtkZDBhN2ROOGU1bUVWUUhYbTdEYnF1K3o3b1FBeitMSTVVMDAy?=
 =?utf-8?B?TEZoVXEwVit6aktuUW9wK0I3YXN1cEM2U3I3SmZhcWFoaGlwL0NlQm9EYnRX?=
 =?utf-8?B?dmRlZy9VZ2ZacDNLbU00WE9FM3dnNExEV25ZdU91M3pJbzJDejBrOFhMRTJD?=
 =?utf-8?B?UW95T0QwME4xR1ZLeVQwdUxWUnVHbnNyMmhKOU9RQzRvbHVxSGtVU1hWc2I3?=
 =?utf-8?B?SmEzRk9EZzMvY2ljTExlbktWS0JpNmwvejlVMXpEcTFZMkdSalN6TkJkSG10?=
 =?utf-8?B?WlkzZHNPbzJOTUJGRFVVRlFlMXdZWnhNY2dRd3ArWFBBWGlCdHB3d25jVnd2?=
 =?utf-8?B?OEllTHhMV0dDOU15SW1CdjNDcjVQZnAvSGU0QnVVOEpjS2d1SHdETk5iRzFP?=
 =?utf-8?B?b1piV3JNZGFvejVkRGliM0hkdVpCdjE5VGNtc0d2UWlyU2hLT01odEN4d0Ji?=
 =?utf-8?B?UUJjVDFJUVQrbjZ0UmNDMGU0T2FQT2JiZVcwODhHbkdYYUV1VENQaWFVSHh3?=
 =?utf-8?B?YmFLNHBhOWhzRSs4MmhjV2g1K2Y5cy9vbndTM25XT2dhZ21WdHB1VllVL1J4?=
 =?utf-8?B?ek1EYWhxUkhEdEw3U001dTBBdndidy9kZHRDSWJ3djdBV0NlQkRyQ0p3V3dl?=
 =?utf-8?B?MHduaktHYUdVNS9Idm1sNm9YMUpLVy9LK09XbEQrT2F5UEJNM2V5bnR0SGMy?=
 =?utf-8?B?M2NrQjZSWXV2b3hnUnV6TFJMSXp0cEx1SkZFMmdkdE5kN2pJOUZsc2JPYUlt?=
 =?utf-8?B?RkxGZmJYTkluUWdtN0xsT1lXcTk0K0xWZU5Nb3EwM1lGRXlCNC9VWGREQ0Vx?=
 =?utf-8?B?WFR4T0xneFZvODhYM2h2YlNaMmVQbGJ3US9DK29XenNkRy9GdVp3TGoweStE?=
 =?utf-8?B?bHAydmlTMGdHWUVsVExCU0g1cVE4MHFWL2VpRFZvYm0xb3BUV2c4aVRqZW1W?=
 =?utf-8?B?UnRteGRNOGthc1NYMVNBZ1hiR0xyNVJ1bUo3L2YyVmJxNVRETzNWcUxUd2dq?=
 =?utf-8?B?ek1qdVlVUmhNRFJ2WldtcDBBLzhJNzZiQUJXa05nekp1WlZOWFVSVGU3cFR0?=
 =?utf-8?B?b1E1NEJkWHNuZDFqMGcxdlBWSVNoWTRIMHVHRDROTWQ1czBNOGFxaFlTWnpP?=
 =?utf-8?B?SFFDeWhsQ3F0aUtGcG1lWTFITnNMWnpHNnNOVTdmdklRNXg4UElML2svQmU0?=
 =?utf-8?B?VGNsem9oY0U0RmZlVVpPWHhscGZNdEV5QVZpUGZiNmtaTzNLWjZlT1BLbWd5?=
 =?utf-8?Q?cawOHqH9PpHKGdHKcSyiBCN65w9vzwjNViGpSdg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ace51d5d-c7ab-4d7b-7b89-08d8f2a76c3d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 11:40:16.4046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7ajAumnFxUvwiEqgpRvkZSe5JzBzOIaigUyj9WsDuJsYgwBNjn9kb51Yg7pze8TR9TIStSrHWCf1zd4R+5x3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3948
X-OriginatorOrg: citrix.com

On Fri, Mar 26, 2021 at 06:59:46PM +0000, Andrew Cooper wrote:
> From: Jan Beulich <jbeulich@suse.com>
> 
> Commit e1de4c196a2e ("x86/timer: Fix boot on Intel systems using ITSSPRC
> static PIT clock gating") was reported to cause boot failures on certain
> AMD Ryzen systems.
> 
> Refine the fix to do nothing in the default case, and only attempt to
> configure legacy replacement mode if IRQ0 is found to not be working.
> 
> In addition, introduce a "hpet" command line option so this heuristic
> can be overridden.  Since it makes little sense to introduce just
> "hpet=legacy-replacement", also allow for a boolean argument as well as
> "broadcast" to replace the separate "hpetbroadcast" option.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Frédéric Pierret <frederic.pierret@qubes-os.org>
> 
> v2:
>  * Reinstate missing hunk from Jan's original patch.
>  * Fix up "8254 PIT".
>  * Drop "goto retry".
> 
> For 4.15: Attempt to unbreak AMD Ryzen 1800X systems.
> ---
>  docs/misc/xen-command-line.pandoc | 33 +++++++++++++++++++++++++++
>  xen/arch/x86/hpet.c               | 48 +++++++++++++++++++++++++--------------
>  xen/arch/x86/io_apic.c            | 27 ++++++++++++++++++++++
>  xen/include/asm-x86/hpet.h        |  1 +
>  4 files changed, 92 insertions(+), 17 deletions(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index a0601ff838..a4bd3f12c5 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1274,9 +1274,42 @@ supported. See docs/misc/arm/big.LITTLE.txt for more information.
>  When the hmp-unsafe option is disabled (default), CPUs that are not
>  identical to the boot CPU will be parked and not used by Xen.
>  
> +### hpet
> +    = List of [ <bool> | broadcast=<bool> | legacy-replacement=<bool> ]
> +
> +    Applicability: x86
> +
> +Controls Xen's use of the system's High Precision Event Timer.  By default,
> +Xen will use an HPET when available and not subject to errata.  Use of the
> +HPET can be disabled by specifying `hpet=0`.
> +
> + * The `broadcast` boolean is disabled by default, but forces Xen to keep
> +   using the broadcast for CPUs in deep C-states even when an RTC interrupt is
> +   enabled.  This then also affects raising of the RTC interrupt.
> +
> + * The `legacy-replacement` boolean allows for control over whether Legacy
> +   Replacement mode is enabled.
> +
> +   Legacy Replacement mode is intended for hardware which does not have an
> +   8254 PIT, and allows the HPET to be configured into a compatible mode.
> +   Intel chipsets from Skylake/ApolloLake onwards can turn the PIT off for
> +   power saving reasons, and there is no platform-agnostic mechanism for
> +   discovering this.
> +
> +   By default, Xen will not change hardware configuration, unless the PIT
> +   appears to be absent, at which point Xen will try to enable Legacy
> +   Replacement mode before falling back to pre-IO-APIC interrupt routing
> +   options.
> +
> +   This behaviour can be inhibited by specifying `legacy-replacement=0`.
> +   Alternatively, this mode can be enabled unconditionally (if available) by
> +   specifying `legacy-replacement=1`.
> +
>  ### hpetbroadcast (x86)
>  > `= <boolean>`
>  
> +Deprecated alternative of `hpet=broadcast`.
> +
>  ### hvm_debug (x86)
>  > `= <integer>`
>  
> diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
> index c1d04f184f..bfa75f135a 100644
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -52,6 +52,8 @@ static unsigned int __read_mostly num_hpets_used;
>  DEFINE_PER_CPU(struct hpet_event_channel *, cpu_bc_channel);
>  
>  unsigned long __initdata hpet_address;
> +int8_t __initdata opt_hpet_legacy_replacement = -1;
> +static bool __initdata opt_hpet = true;
>  u8 __initdata hpet_blockid;
>  u8 __initdata hpet_flags;
>  
> @@ -63,6 +65,32 @@ u8 __initdata hpet_flags;
>  static bool __initdata force_hpet_broadcast;
>  boolean_param("hpetbroadcast", force_hpet_broadcast);
>  
> +static int __init parse_hpet_param(const char *s)
> +{
> +    const char *ss;
> +    int val, rc = 0;
> +
> +    do {
> +        ss = strchr(s, ',');
> +        if ( !ss )
> +            ss = strchr(s, '\0');
> +
> +        if ( (val = parse_bool(s, ss)) >= 0 )
> +            opt_hpet = val;
> +        else if ( (val = parse_boolean("broadcast", s, ss)) >= 0 )
> +            force_hpet_broadcast = val;
> +        else if ( (val = parse_boolean("legacy-replacement", s, ss)) >= 0 )
> +            opt_hpet_legacy_replacement = val;
> +        else
> +            rc = -EINVAL;
> +
> +        s = ss + 1;
> +    } while ( *ss );
> +
> +    return rc;
> +}
> +custom_param("hpet", parse_hpet_param);
> +
>  /*
>   * Calculate a multiplication factor for scaled math, which is used to convert
>   * nanoseconds based values to clock ticks:
> @@ -820,12 +848,9 @@ u64 __init hpet_setup(void)
>      unsigned int hpet_id, hpet_period;
>      unsigned int last, rem;
>  
> -    if ( hpet_rate )
> +    if ( hpet_rate || !hpet_address || !opt_hpet )
>          return hpet_rate;
>  
> -    if ( hpet_address == 0 )
> -        return 0;
> -
>      set_fixmap_nocache(FIX_HPET_BASE, hpet_address);
>  
>      hpet_id = hpet_read32(HPET_ID);
> @@ -852,19 +877,8 @@ u64 __init hpet_setup(void)
>      if ( (rem * 2) > hpet_period )
>          hpet_rate++;
>  
> -    /*
> -     * Intel chipsets from Skylake/ApolloLake onwards can statically clock
> -     * gate the 8259 PIT.  This option is enabled by default in slightly later
> -     * systems, as turning the PIT off is a prerequisite to entering the C11
> -     * power saving state.
> -     *
> -     * Xen currently depends on the legacy timer interrupt being active while
> -     * IRQ routing is configured.
> -     *
> -     * Reconfigure the HPET into legacy mode to re-establish the timer
> -     * interrupt.
> -     */
> -    hpet_enable_legacy_replacement_mode();
> +    if ( opt_hpet_legacy_replacement > 0 )
> +        hpet_enable_legacy_replacement_mode();
>  
>      return hpet_rate;
>  }
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index e93265f379..3f131a81fb 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -29,6 +29,8 @@
>  #include <xen/acpi.h>
>  #include <xen/keyhandler.h>
>  #include <xen/softirq.h>
> +
> +#include <asm/hpet.h>
>  #include <asm/mc146818rtc.h>
>  #include <asm/smp.h>
>  #include <asm/desc.h>
> @@ -1930,6 +1932,31 @@ static void __init check_timer(void)
>              local_irq_restore(flags);
>              return;
>          }
> +
> +        /*
> +         * Intel chipsets from Skylake/ApolloLake onwards can statically clock
> +         * gate the 8254 PIT.  This option is enabled by default in slightly
> +         * later systems, as turning the PIT off is a prerequisite to entering
> +         * the C11 power saving state.
> +         *
> +         * Xen currently depends on the legacy timer interrupt being active
> +         * while IRQ routing is configured.
> +         *
> +         * If the user hasn't made an explicit choice, attempt to reconfigure
> +         * the HPET into legacy mode to re-establish the timer interrupt.
> +         */
> +        if ( opt_hpet_legacy_replacement < 0 &&
> +             hpet_enable_legacy_replacement_mode() )
> +        {
> +            printk(XENLOG_ERR "..no 8254 timer found - trying HPET Legacy Replacement Mode\n");
> +
> +            if ( timer_irq_works() )
> +            {
> +                local_irq_restore(flags);

Is there any point in undoing the legacy replacement here, as I
understand it it's only required for the routing check?

Should we also prevent any attempts from using the PIT as a
timecounter in x86/time.c as a result of having the HPET in legacy
replacement mode?

AFAICT init_pit will already assert whether the PIT counters work, so
maybe there's no need for adding an extra check on whether legacy
replacement is enabled.

Thanks, Roger.

