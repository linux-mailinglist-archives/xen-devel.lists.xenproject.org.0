Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12156528237
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 12:37:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329762.553020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqY5I-0006JB-5d; Mon, 16 May 2022 10:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329762.553020; Mon, 16 May 2022 10:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqY5I-0006Gz-2t; Mon, 16 May 2022 10:36:16 +0000
Received: by outflank-mailman (input) for mailman id 329762;
 Mon, 16 May 2022 10:36:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1taX=VY=citrix.com=prvs=128915162=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nqY5F-0006Gt-Vr
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 10:36:14 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 007c667e-d504-11ec-aa76-f101dd46aeb6;
 Mon, 16 May 2022 12:36:12 +0200 (CEST)
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2022 06:36:09 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BYAPR03MB4615.namprd03.prod.outlook.com (2603:10b6:a03:12d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 10:36:07 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 10:36:07 +0000
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
X-Inumbo-ID: 007c667e-d504-11ec-aa76-f101dd46aeb6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652697371;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Hvyd0ozVM0yEezdsN/R+DWEWq1PoRLMAJ/WLQB11LfA=;
  b=OHqMxTea1mvzbac+bfhHt/HCqaOEutf7xfuov0fsOzzSbDIxShos2Q8a
   lw+JeSLwDlgrUqU8wzYpOnqpVqVhts3a6qCFQxn9ZMnsWHX1sFuopbxYh
   M8sv2mPIyE3oYixYzouNlByCbbu1hFYVTmrm8JY0Leiuz4eocUFLF+POs
   E=;
X-IronPort-RemoteIP: 104.47.55.102
X-IronPort-MID: 71785816
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bYeDXaiEH3SJXXQ0xobObHP+X161FBEKZh0ujC45NGQN5FlHY01je
 htvWDrVOf+NZmP0f9p0Po2zoEIFsJXUyIcyQFE/qS8wEC8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlrQ4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQsNIq3TivgmaElBSjkkArFk9If/fGfq5KR/z2WeG5ft69NHKRhueKgnoKNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuIIehW9q7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9wvK9fdnuja7IApZ9b7jAuT/W5uwGsxSwWaWv
 kft/nn6DURPXDCY4X/fmp62vcffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc9BVJ
 lEQ+yEuhbMv70HtRd74NzWnpFaUsxhaXMBfe9DW8ymIw6vQpgOGXG4NS2cZbMR87ZdsAzs3y
 lWOgtXlQyR1t6GYQm6c8bHSqi6uPS8SLikJYipsoRY53uQPabob1nrnJuuP2obv5jEpMVkcG
 wy3kRU=
IronPort-HdrOrdr: A9a23:NUVRXq3XYUmZQFIMu4sTkAqjBVRyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjjfZq6z+8M3WBxB8baYOCCggeVxe5ZnO/fKlHbexEWldQtqJ
 uIDZIOb+EYZGIS5aia3ODRKadb/DDtytHMuQ6x9QYPcek8AJsQlDuRRzzrZXFedU1jP94UBZ
 Cc7s1Iq36JfmkWVN2yAj0gU/LYr9PGuZr6aVpebiRXoTWmvHeN0vrXAhKY1hARX3dmxqojy3
 HMl0jc6r+4u/+25xfA3yv47ohQmvHm1txfbfb8/PQ9G3HJsEKFdY5hU7qNsHQcp/yu0k8jlJ
 32rxIpL61ImgHsV1DwhSGo9xjr0T4o5XOn40Sfm2HfrcvwQy9/I9ZdhKpCGyGppnYIjZVZ6u
 ZmzmiZv51YAVfrhyLm/eXFUBlsiw6dvWciq+gOlHZSOLFuIoO5lbZvs3+9La1wUh4TsOscYa
 hT5YDnlb1rmGqhHjzkVjIF+q3tYpwxdi32MXTq9PblkAS+p0oJsHfw9PZv4kvoy6hNNaWsn9
 60VJiAtIs+O/P+PpgNcNvof6OMex3waCOJFl6uCnLaM4xCE07xivfMkcUIDaeRCdQ18Kc=
X-IronPort-AV: E=Sophos;i="5.91,229,1647316800"; 
   d="scan'208";a="71785816"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHb5D2FgwTrHXrPIbRAON1+6q29QF9PgGHkgUVfeyxibH/lIgpP5SmqP+4zB3I6JFiPdJ/wEq6Yqt1B98MiQ0zGY9jpBo1bhZc9YqMsvXHO3pKRp4kFvadnQP40mVU/RiaKCwCHF2XdmDaEjpJk2MIn7yYkG+MzD4orvvu20/YLTYmBPaVkYWPEMzj3MuqczIGjJ7lWlmkTpfD5l5nxEE5Wr3WIEaO++JcvGTDko3ZBs6lFFyTNszi9OKHm7FS1mO1aUyqC1iP0RC8X07myQTSuGRR3abAx6iALD7yRauZG/4mtzR9c8f5boN2AhefhKeurKPsbJguFmhujTy4GKoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6VRuSEWcJyBV3jT/k3E6n1bWGDSbjz/MtUh+1H03Jg=;
 b=SHqtGnm+h4GFyLTCFR9IF+TO+W1jObOhLtGXpgAuq93W4NscAaxS7Tmvbd/jmdDAhvm3zRNkD+o2k8QIrqRv4zSrCJN6PmjlV343gGFAGbmT8X8k80Q/zJaqrvZELAkKICpvd4arabdqPfVQCCAi5CpWnN9lQFQ39dJGtrvPuDvtowZDYVOdLB4nSD+in2/31vUg86TBx+hK8F3zChuhHtO9MlimVZUwdRQ1/utEQIjOkomdXk/CGQ9iOWNFAVYSi9W6n3cYAjkLuudipqqmpBlnxb3rFBDwojeDfDhXaqadGMh8iOJIXmxEH2kxB6dcvt8ftTzA/6zhRZwjvVr0mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6VRuSEWcJyBV3jT/k3E6n1bWGDSbjz/MtUh+1H03Jg=;
 b=gPLFvN3FEuhG3sgI029uq8yEWv1buqUoD7iqw68VwSN20jw/mybqe4HeXYcbVPi1QIPIjC/aELU58BGy62uE9B6693sHOqXBLTnadixZMcgo+lMh6+Vix9XHtnewsbmF72qVfoyFyiQ9hC85QsU9lGUSG4YbMDkiM+XDtssZT7g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/mwait-idle: add missing newline
Date: Mon, 16 May 2022 12:36:01 +0200
Message-Id: <20220516103601.25671-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0085.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5ddcba2-f619-4abe-dffe-08da3727e2da
X-MS-TrafficTypeDiagnostic: BYAPR03MB4615:EE_
X-Microsoft-Antispam-PRVS:
	<BYAPR03MB46159A79F008D4B037AE489D8FCF9@BYAPR03MB4615.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LkQOV+cig1/xsWA74vO9yb+aQN0TzSfYN3S5sSyU3bp5wojDeIfeUQ2uUZS7yVpFs03UgUUjYKmgxjbrSLlzhmD6j1AGo1a8t+qCzOSEi9dEbjJXTMNOWKlzWI5l2U+dMk4rVci4kWPHNAAuTN18sC2FeMKHCzdIdykZ6IkjhyEKyfWUPvg8RrhapevSmffCQyjAAVfuB+30kUafkxWNocyhBJRyQ3cO6GHXWKPwYZ7DvDPXoUIwzjwb9InyJDoaVg1pT7+QNadqVCn0LUBtIeZ7sIZyrJpGm10y1GdCwIhhB6wB9iQNLSUGH2+0X3y3ihYmW4tWwAEUUoVY/M/MPmiRXCsyAc8y4J2L8qwZy6c37X4Zavv/iFHG2VOnJ+HtDC9SYwxtHmDXP/SHxqan6lK9+IlKYzDMlMmVck+7Pxtb8oD4WPscTknez460xTnrPiYTfdsPB933PBKwiF8nYAdgOHfd5Zmw8q5CkFyuaHoO0bmc1QPH5Yn/aSJL607avvcDnhrgMVEwfwf2zKbQ4ysGMDG7BuM65Hu6BdroID1Ns2cVi4JJ5+jTCuH9eTXqZCg7tDWwnEjY7uXh43cTkVqjaPFQ0btnV0FzZXLxjOzGWXUqnVqJu67F86ngjqS+5vvKj2Cn0j6AcAvFQXekjw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(36756003)(8936002)(6916009)(508600001)(186003)(1076003)(6486002)(316002)(38100700002)(54906003)(2616005)(4744005)(86362001)(2906002)(66946007)(66556008)(26005)(4326008)(66476007)(5660300002)(6512007)(6506007)(6666004)(83380400001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0dZT0ZnMGFQRXZiQlIrcmIrTUczVmc0WDdlM3dmMFN5ZVVLdVVUNHRwOWti?=
 =?utf-8?B?MDJoaTE0UXVLMml6Z29EWlRWdEljUnNmMTFld0pjVUNNY05ydGRDQmxlY1B2?=
 =?utf-8?B?T3ZTampWcCtNekcvc2U1OEp6dThYOVhXeEt3UUJRQjZVRUlRSzIwcmJSYi9O?=
 =?utf-8?B?bUFHUktaa1NMZ3k2ZEhKSHNLeWJraWd4VW5oV2JidlpJK2JpU2x1dVFWeXg4?=
 =?utf-8?B?NnhZNkRXeVY1TXk2L05SeFdvSmZveW5pUHlXdzVkSWdVZHBlOVZoWmsrQUF4?=
 =?utf-8?B?OUduVUcwQVFqbEJEbkxkYUYvVmVrVFV3dmFhZEhMajlHOWVwdGt0cXAxVDhr?=
 =?utf-8?B?dThxNzgvM2FENWxHOWVaRHRMMEdIMFc0RTUxS1dneUlCRHZJU2N1V0N6SUtn?=
 =?utf-8?B?SXFEeDFvQnJYMnB3Y09jV1dRazVBVVBOV2RwN2JNR1o1YzBKSjlmZFR4L1NR?=
 =?utf-8?B?Zm5HbnNXYTVLZ085dWx0a2ZQZlUwRW9HNy9BNndUZEZUTERrb3BLSFFVMGNZ?=
 =?utf-8?B?NTZwdWVmVDh1LzNQSXQ3aXh1dGp2cU9Xc2c5WVJZV0ovVjF4NkpGaGVvOWZz?=
 =?utf-8?B?Q01heXdSb0xlNnlDYkRXZDR4czJrUTNrdFdxenFHK2VXcmJFa0xybVROWXd4?=
 =?utf-8?B?anlQOTNrR3diMFlUUmZieTRVUFY5ZTRlSUkrcitlSmRpSWRORjlPOCtaVzhr?=
 =?utf-8?B?eGZpaXV4dkRRUVpEVFhUb2h6bXBSbmZURjQwa09CZ3hTOTIrR0cwV0hMWFZm?=
 =?utf-8?B?Zi94VmkvQzRrUVVLRmJid3JaNlczMW0zY3pkeUM3WUhmNXhuRGI1VE9zVEFI?=
 =?utf-8?B?UWVMQTNBUjdqcURSdEM1MGJWM25VOEtZTDcyVzdTRG14bG82bnNHcGtBTUov?=
 =?utf-8?B?R1UydTk0NTBQMEcxTytWamI1N2RIWTVYYjFtN09ocFZGaTFDM0RvYmlTeXBP?=
 =?utf-8?B?K0dCeEVXbUs1L1V2S3VGM3ZpY1ZKZ2dqKzlubjl2d1lyczlxMU1FWVlNMUxi?=
 =?utf-8?B?VzNtNThCMkFDV1A5SklkR0RLMmU2bXFsVUFKYUgwR0xzenFOaXB5VDhIclE0?=
 =?utf-8?B?SkxCMjJ5TEh3Q3dQVmlCN3pyZ2lRaWlSc3lwU2d0d3NacXI2cC8rZTBndWgx?=
 =?utf-8?B?VEx0T1RFbUlJTlM1R1dDL3h4YXZqbEY3ZmpmZ0NEL1hjbzBEVkYxRTJ1MlFq?=
 =?utf-8?B?anpSSkNFZzE5NHJJOC9CN0Fld0FnZ3hpVzhlU1pXY0FtNU1aWXRMNTlJNytZ?=
 =?utf-8?B?ZzE1Z1I0WU1tdTc3VEE3N2tzZ3Y0QzlOWi9oOUt5K0JpcGNBRWZRaEREbTVF?=
 =?utf-8?B?SkJLbEZDTnpLbFVZTkJieTJlQ3h4RDUydm5PbFhKQWNUWnJXYXo3OXhxQVNw?=
 =?utf-8?B?NjNWVjhVbWRmRjZ3c2g4NlFUWUZGYmpEMjJPWDZUckFZN2JDTnlvSDZRTmZq?=
 =?utf-8?B?elRQelg1MjhRTWJXOUxET1hjMHRQL3Z5SVY1UEFsczdiWFRaZWFlazNUY1VJ?=
 =?utf-8?B?c2h5MlowYlBoSUJ2bkRBUkF0OGVyWmVRRXZpQUE4SEQxZWtMZHFoSUd5T0pk?=
 =?utf-8?B?dUVOZWw1djVYU2ZWaW8vVzUwdTdtejlJcmkxdlBidHg4ZXQ5am1mWWxDN1FL?=
 =?utf-8?B?SFprdjEwWCtaMGZrQ0FoV1dNUHFxZjcvWnE4KytWLzR6c05kRXdOc1RlN1Mv?=
 =?utf-8?B?bEtEZFJtK01saU05K3ozSnkvbzdQdDZwUkVkOW8vdTBJUUU2WFpwWEg1R3VQ?=
 =?utf-8?B?clU2MUpvNUMySzM0Rk1oQjg4TnFwSE9kMGtxbXlpdC9wSzJYdVA1b05wMUFm?=
 =?utf-8?B?RUcxVEp4RHRnbndXc3JmenJ3V0c3QXZFZGlYSUJzbUkyQmVEWmp4UmRSdU1U?=
 =?utf-8?B?aFc5aTJqeTVwODdLVEFOSThLbkhIb1NXQUJZQzU1VEpvR1lFckNFVHhFQmY4?=
 =?utf-8?B?empDZ0ZDcm1lTlJPVFZwMlZxditBYU5Ta1VJK0xQVDNNaTVuRXNYZ1g4WVBu?=
 =?utf-8?B?Z21XeU5XTUdTSXhqVi8vc2xyYW01bVlaeFlDZUwyR2YxQlNzSUNWWGUzNGw0?=
 =?utf-8?B?RkF0ZVlVWWdGOVpZUHRDczBrSWJhL2tNR1V4S08vbFZBTlpScHNMSmM4OGc4?=
 =?utf-8?B?UTJORmdWdFFOeG4yN2pLaUJkNHpIMnNvTTMvMDh2Ukt5YmFOdTlFbGllWkdq?=
 =?utf-8?B?eDRkcXNiTC9nQ043VDJFTmdyQTFNUWY1V0NwRWZpNjlFcUMxTkFvYmtyRUcz?=
 =?utf-8?B?YU4vWG1SMXZIUGRsRnVlQ3lYbitac1FKN0tEZ29ZR3dTMHdVM3dnUG1zUUtG?=
 =?utf-8?B?TFloNklFN1FyZTRjWVhDZi9zcXVoTDdsbTJ5QzJ6R2ltM2JSeVIvZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ddcba2-f619-4abe-dffe-08da3727e2da
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 10:36:07.6687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7YxGfJzI/P85nHS+P3irJVWKSq1ctYmzer7CJ5NxVTLXdjxy3X76vS4aOoelMLZ1c01K49SvHPFDbRzmeXHRPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4615

Fixes: 5a211704e8 ('mwait-idle: prevent SKL-H boot failure when C8+C9+C10 enabled')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/mwait-idle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index 6add64dc5f..5d77672f6b 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1363,7 +1363,7 @@ static int cf_check mwait_idle_cpu_init(
 		/* if state marked as disabled, skip it */
 		if (cpuidle_state_table[cstate].flags &
 		    CPUIDLE_FLAG_DISABLED) {
-			printk(XENLOG_DEBUG PREFIX "state %s is disabled",
+			printk(XENLOG_DEBUG PREFIX "state %s is disabled\n",
 			       cpuidle_state_table[cstate].name);
 			continue;
 		}
-- 
2.36.0


