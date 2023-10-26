Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4452D7D8172
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 13:03:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623702.971792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvy8d-00079d-QM; Thu, 26 Oct 2023 11:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623702.971792; Thu, 26 Oct 2023 11:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvy8d-000778-Ne; Thu, 26 Oct 2023 11:02:55 +0000
Received: by outflank-mailman (input) for mailman id 623702;
 Thu, 26 Oct 2023 11:02:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iwvv=GI=citrix.com=prvs=656fec104=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qvy8c-000772-W9
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 11:02:54 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34ebb47f-73ef-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 13:02:53 +0200 (CEST)
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Oct 2023 07:02:50 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.16; Thu, 26 Oct
 2023 11:02:47 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Thu, 26 Oct 2023
 11:02:47 +0000
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
X-Inumbo-ID: 34ebb47f-73ef-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698318173;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=OUP5hlZiFVYxTI/vO4+CTHz5HAMBHd+YpNvakVxfuLA=;
  b=A7+jvAp+0e6vd4aYdmEXd+xqWDcqgA8EFCk6mEbVTXv3YzdhWhYIv3xU
   y5GHCSxxd3992eZIsNuIs0S3+C4SQ3Kdr2pVgd8R07ZoZUI8jcdDEJv2Y
   0GSSh791h9p+D/WeOG9aoA02EW2AgdJeMYfXqzSz2xge+t7qQVWhIukkD
   k=;
X-CSE-ConnectionGUID: LVkVczW1TjmlyzSqp8kuWw==
X-CSE-MsgGUID: NsxUQoxdToqcMkuKFcc0cQ==
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 126707688
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:6m01h6laJvJi35nDHCMCupLo5gynJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNXW+BOfiPYzT3eI9+Pt/i8UIPsZXQmIcxTwNkqHw1FiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K+aVA8w5ARkPqkT5gGGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dgmKw4GfC/au+CzxKOpcfB01sc+E9a+aevzulk4pd3YJdAPZMmbBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3ieC0WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHmlB9pNSu3onhJsqHuI1lEqDw0aaVyiqty6l22QUNkHI
 HVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkAowXQqYCYFSU4J5oflqYRq1hbXFI87Seiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:3103e6FKJOXR8lUypLqFaZHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdqZJkh8erwW5VoMkmsiKKdgLNhdotKOTOLhILGFvAE0WNtqQeQfREWmtQ96U
 4kSdkENDSSNykxsS+Z2njALz9I+rDun86VbKXlvg9QpGpRGsNdBnJCe2Km+zpNNWx77PQCdK
 a0145inX6NaH4XZsO0Cj0uRO7YveDGk5rgfFovGwMnwBPmt0Ll1JfKVzyjmjsOWTJGxrkvtU
 LflRbi26mlu/anjjfBym7o6YhMkteJ8KoNOCXMsLlaFtzfsHfpWG1TYczAgNnzmpDs1L8eqq
 iMn/7nBbU315qeRBDwnfKn4Xid7N9n0Q6c9bbfuwqvnSWxfkNFN+NRwY1eaRfX8EwmoZV117
 9KxXuQs95NAQrHhzmV3am/a/hGrDvBnZMZq59ls1VPFY8FLLNBp40W+01YVJ8GASLh8YgiVO
 1jFtvV6vpaeU6TKymxhBgm/PW8GnAoWhuWSEkLvcKYlzBQgXBi1kMdgMgShG0J+p4xQ4RNo+
 7ELqNrnrdTSdJ+V9M1OM4RBc+sTmDdSxPFN2yfZVzhCaEcInrI74X65b0kjdvaDaDgDKFC6q
 gpfGkoxlLaIXieePFm9Kc7gizwfA==
X-Talos-CUID: 9a23:ZITG5G0fmUCe2nsXUkHrRbxfPv4mTHbP8y7sIUq8GHRSUaXFSkKv5/Yx
X-Talos-MUID: 9a23:3bNxEAsTLX4hLq9KrM2noipyCf5v86iSD1kGtJYbmOePPnR7AmLI
X-IronPort-AV: E=Sophos;i="6.03,253,1694750400"; 
   d="scan'208";a="126707688"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvRXA0t6hYtSheKjF52WwyBmB8TkJ/hXvSMJuf3E8RbncwoN0sZSdrlapGS717iKXWJw+/ffmESBMWLXrArErb9ndLQUe9T0Yl6VFZbWcsfhcJEmbA9bovUQnCCxC33d28WpYuYdw1sL2iQOIytVSAM3vyYCsO5aOKUjgVw5h2nv3Zg7oQns/WkFlMrU/fWp+BFnnQCu85E9YNb+sOahMjOF6zIHTUvXZ6WuWgV5tr2lJu4q02sXwjFkyk+bQPclfndcRJ3DT2DT6JLyrrmn6AqLcIqFRRtsDjRJOGq8sDFUns7fq05JIlTowcwzlQDDjQr2e17ZFez0/JhwKHn8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vGAbp6mjTrWPJuIU6jAZaW13brH8j/1qJlULg7b2CQ=;
 b=l03ZRCTAKQO3D9xegqDyqcRPSeEzqW02Mh3Y3YapLfUfFYNWnJ+ngZ4c6b7vPYL0+R1GboKxNygQiwkNQcakH/ISOR/uNd2FBz5z5DJdbfwTpDyYGicQYYzR+fO4oiayUCHphgx6yMw0psolVPGx5n/fOE4IFDoFvii/7Uilk+aq7wehG5ABa1FULbuLN/upQLseAnlB9cgVxWdxgJe3WPZVxLZuaMvQ+4LanPgecqYH/LEV0L1c0crJtpd57dKsAnWn7Su0nX4JjAxm5m4/IWmZMAGd7VEUYRnBL4URplkp+lbhaqqS6nokK5MiLJtDwV3Ix0xpSDI/z1IcrbrMuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vGAbp6mjTrWPJuIU6jAZaW13brH8j/1qJlULg7b2CQ=;
 b=sHaUzmwnfw1+q+M/qThy1gx3dBQcnJaCdCEc7ovggV3EJiWuT45b66MwW4gEHeqSM40tjtB3k5s10pES2XcCsaqnFzL/XpHCTkYZgWWbPiYDsUbnFxUHGfJ/gwY05bTZ9AhOPztWElY1/OwmJiYAMCxncqZa8+92FZoorI8aVsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 26 Oct 2023 13:02:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 7/7] x86: don't allow Dom0 access to ELCR ports
Message-ID: <ZTpHUzeBbDLe5Lin@macbook>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <118fa3e5-e1ac-ab3e-8b86-1ec751513434@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <118fa3e5-e1ac-ab3e-8b86-1ec751513434@suse.com>
X-ClientProxiedBy: LO4P265CA0074.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e962262-326c-4ace-9548-08dbd6131629
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wcItea2iYelamEZBiZ00FRhoVLYSEMP7rxuUAV8fSGJz7+wNqYiqNGgdtgwiLjMuWLWtbrPBsgraMrUguejFNPywGSzJ/jN/tvFLoOTxTb5dpragnAG1JugZ11qTK8zb2HqGyUs+2cNaE94RpsjN64nXmb3mw/LvTWr3W/BqqI1ENxdKU8AoBGJnbJhR/DmRdnmKjce+K7xuA7nKxBA7oWLG5BA60L451zDHu+tmjnzdBLZr9LHFZ/XVsYe5Utisr6i5i6Fmi/ku7LUmF5QvkhEmtlSHWvM/xIGaLStNUYaNp/3FaPx4X1LUycurO9jJswdKKDir71a8ysGDmfKleUxbyjucWYxEXnaOsGRL9OygdmQ2CowHHwWE7E9vnagr/JKRHSEoYqX9G1zJURaKqMU9gjqI5gzmyPLpQFcJib8AUGGu8G3k1rpfEhZEMqJ2bAU1MbUYUAJakscGB1R4TI5nOYfLi1XBTM5aDmxMpGztB6FN3EDfBJc6vvMEbgi24CWT/9kAUkrDiaD1QxzeAyn8RusJEjuIa5HjL1vbDuXNiO1+IWd7vUzteUmnqJJR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(396003)(376002)(39860400002)(366004)(136003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(6666004)(38100700002)(6506007)(6512007)(82960400001)(9686003)(478600001)(6486002)(83380400001)(33716001)(2906002)(316002)(85182001)(8676002)(66556008)(4326008)(8936002)(86362001)(66476007)(41300700001)(26005)(54906003)(5660300002)(66946007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3VTZjF6bSswWDlaWldUbHo3SlB3UFl6QXIrWFdtZE9RajdXVW0rbFJOZDQ3?=
 =?utf-8?B?eGpPUUdUd1dRUEFtTGJKc004M1BXNEVCTncvU0FRMjdjVUhHMllCZlZCZFl6?=
 =?utf-8?B?SkhIQWsxVU4vaExoem96MGlFWmYrcm52dmZIalZQWTRTUDZLODlxS2xkYXN1?=
 =?utf-8?B?aHdXaGR6UGd6T1lTRHlJQTZTd2ViUzhudEk3VTM0Uko0STF5bGxDY3RHUUNt?=
 =?utf-8?B?VFplRENTNVlzeXd5cDU4SnpFUHJvemJrSDlvcG5CNnNpZGlGVFBWeXFHVHdX?=
 =?utf-8?B?MGdsd0FTbk8vZFlpV0xXSWcrS3dJSVZ3TGpERlRzd1EyQXJXRWVTUG9Cbnpu?=
 =?utf-8?B?ZjUyVTJSQW9ZbVZndzE2bUgwV3EzR3B0cWFWcG9mT3ptQXVvd2JRNk9UeUow?=
 =?utf-8?B?N3gvcWdvRTFsSTlQWkpuVDBkdmN1ZlZKL25jOEZmSjQ2WjJtNmJSeFZMaFlx?=
 =?utf-8?B?aFExQlZSTmZXVm1EdkFaYjExT1lxL0Z4ZG1UN1lSMExvN3FlRHFVZXVxUDh5?=
 =?utf-8?B?WFgxbmFtWnBwTzBkUEx6K0ZwK2xnbU1rMy9vdVpoZzJlKzFWeGpwSE1ZcnM5?=
 =?utf-8?B?UXQydFE5TTMyemZiemY4dDVSamlYOGt4dlJVcHZJTVNHeC9pMERYMng1eDFs?=
 =?utf-8?B?bWhyeEl0ZU80dGdhSEtsNnBiMHRvWmxtWlpLNHU0TEIzcHlkWjZIOGswTm9r?=
 =?utf-8?B?bEoyT3dPVzE0TVMyRVNYVnhOTWRsZDYrSlVRdGRuOUw5ZlZtOUJtUGlJT0w3?=
 =?utf-8?B?YnVaUWppZC9Pd0NrcUJUVUJDSG0vWnpJckRiRTllWUZNOEY3MFBiUDViallq?=
 =?utf-8?B?STNHNnBnTnVOa3VPbjdEekR4Y2thTElOZzZyRlRSYlZOdEFNSTNZaUJsUDRw?=
 =?utf-8?B?WU05Z3FjR1FqT1hnZjJaTVFlUHg3N3lmY3MvZ09ONmREYXROQ3hXeFRnYjRr?=
 =?utf-8?B?bkpGc2FabWFkM0YwcmJ4NVBzdjI1SHFEMVBwTEJtUkFNQ2dIKzFnVXdMTzc0?=
 =?utf-8?B?Mk9MMmpiVnMyY0FjOHM1ckRFK3FscXRrVXpxVEdaSEJFM2JvK0Mwem03MzRC?=
 =?utf-8?B?azBzR2lCTWFwcTVoVzVVY091c1pIazBaWEZocHBua05IemhIUUFoejN0N3l1?=
 =?utf-8?B?Z1VtcDJzd2JrM3FEOTZmWWNXb2I4WG5maW1xY2p6VHVMbldmM1R6bzhGNUJa?=
 =?utf-8?B?V1M5Zlc1dVZmTk0vSFNKZ0lPTjhIR2lqeHY5QTFPak5YOGEyVm9sU2RpdnhK?=
 =?utf-8?B?ayt0ZTFaRE50ZWhnNjNJSEJZaHloUXNxTTFHUUlWWThRYS93OUZYVHRLb1k5?=
 =?utf-8?B?cXR6NCszWnZFd29NTmZkNHhkTHFMQ1huOGJsMTZ0QjNVeHd4ZCtzWkc1RFpB?=
 =?utf-8?B?STZJazVDVHVkdHk5MHBwV0t2RUxqQkoySmErQnFpcFBIbWxManhzR2ZuOWlo?=
 =?utf-8?B?cEk1cmF1UktoM1RBV0dUa25OL0dqeTJLd2d0RHlEbEZrSFhuNUpNK0dHdFhi?=
 =?utf-8?B?OUQwaXROdHJsZnZrMDgwQ1FZS1hmVTFwQ2V3NE14N1lweVRqRXdSU3lkcytt?=
 =?utf-8?B?bk41SjdFMFJjYkU0UmFtTnN6R3ZqbzFnbE1saHZ5VnQyZWI0Ylk1TG1IZnhl?=
 =?utf-8?B?NU84ZWlHUEdpTVo0a0YxNHh3YVVwajFBZExvN2lxU0l4M2ZiY1YwNzJiQzJ4?=
 =?utf-8?B?Y2o1Z1lGYzVJeHNZUlRXM3QxY3h6VFpxUDdhRFN5WjV2OHlJQy81cmw5UStC?=
 =?utf-8?B?L1ZkSXBXdkx0aW8rVThEd1pQc3BIYWhuRDQ4cC9Ea3lDMGRhYTJ2R1lQUlRi?=
 =?utf-8?B?ZGJlTkQyREZtN3VnV2hPVm1zaEdjQUZ4aXBzS3pDRUlBSnRmMGpySnhVenlH?=
 =?utf-8?B?S1VTdXVwaEd1VDIvYzg1T05TTVlzYU93amFNSlZWSzd2cXFEYWpHMmpCb2RK?=
 =?utf-8?B?bVVZa3lyUDROa3ZTekhLamN4RWxOYkdYdDZTUmlsVmJFZlg4QTkzSWM5SzhC?=
 =?utf-8?B?V2daVkltNW00VWpIYWEvVFNuR1NGc2x5VFdVckJycGxKZ1lzWElMbkQwb0xL?=
 =?utf-8?B?NGxTMU93NXIyWi9BWEJ5dDZzbmNKUHZjT3pNRW1Kbzc5Sy9UeDlpaC9sZjNV?=
 =?utf-8?B?M0FMMWtMSEdBS0ZnTk9Sbjk2WThQSVEzSzJYL1JreE9pOENWRi9iL3NwM2dV?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uTXC1W9RtpaK0wY1lwqP2xz3ow/nMwGwq4HRSR2a3NGCNM8nOJwHBMHRCGjOpLiWOnPuqN4/pbgv9LDxaEVt3Pwl/HyFpTOFrRnzhFzrd7Kx7UNx16+vjOBZIktTO6uxAXubfvrMabzmv/78zjdE7IipCs8AeLr2pa+c5Ut+Wb/v2xAp5IMVWM0AezQz8OjoCrSn2dmpTLyBcoImAyuc53tFGpzntydXy+MmZQ1kgkpLdnekMjZsHOKDH/DC9m7ityPSBFVbR5Z2/XiBHVpEDTRGCZ1C24WFaBLCJNdMv7yl6dJ1jEo3Mi/NSyp46pNBxB62eqhYyB/u1oxKvXkvhlXtuh2eRsRvqghMmIEsBd54sIKIj6fI+d0G4JVzTUGTOMt/gb1qZ8t1BFL/P1FnNqPc+sTTtdatUTBMGhB8ZSWtx4ppxKHMtg+zZT1VMjvmq4gJEN0Gdijg3L3qU6wpx6ovb2uUpFoZN6CkY6AKoaE49q7EI1JVSv42kJ5pcBDcE2EglFrm1qlFsurH8Li/cJAv2tlDYl8x4JkLYn7XohCkHDE1DAE5SU8stFDMUJb4cMXra0rIdMeIcTWXgtcbR3IoBdZ9iiiW+cU8jt5/737aHaRn1QICxi9o4UUiUZ2uq49ATA3v9nK2bOklbhC97pNJWdBgZHITTjHNYt3sTw9Z6+WEn29fJY6Kog+HEZZYyULvqtKUwc1b5EGoyU+/Cg4h2Lzc7nHygFxiThsn9HoSCkGzOc8NrCuLnBax2SNaRaFBNYg2FImHKscvKnxtXbsSRFxyyQ6B7zEsH2kdGpFiikn232OTwqFmbuxHTuMIRouysOP19h0UtxsHOog0oQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e962262-326c-4ace-9548-08dbd6131629
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 11:02:47.0184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7LeuIsZlVjvWFj2FA6G9QSjfmXoX2bEpVmvEK0LB3WalItoYO38GMJwhjI3LdBEz8WQJ9I11b2lXP7nvN6uYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6428

On Thu, May 11, 2023 at 02:08:09PM +0200, Jan Beulich wrote:
> Much like the other PIC ports, Dom0 has no business touching these. Even
> our own uses are somewhat questionable, as the corresponding IO-APIC
> code in Linux is enclosed in a CONFIG_EISA conditional; I don't think
> there are any x86-64 EISA systems.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> RFC: For Linux'es (matching our) construct_default_ioirq_mptable() we
>      may need to permit read access at least for PVH, if such default
>      table construction is assumed to be sensible there in the first
>      place (we assume ACPI and no PIC for PVH Dom0, after all).

Unless I'm confused, thise ports only control the triggering mode of
the PICs, and hence a PVH dom0 should have no business with them, as
not having a PIC in the first place.

> 
> RFC: Linux further has ACPI boot code accessing ELCR
>      (acpi_pic_sci_set_trigger() and acpi_register_gsi_pic()), which we
>      have no equivalent of.

If access to the port is denied, ~0 will be returned, and hence all
IRQs will be assumed to be level.  Some bits reserved and must be 0
will also be returned as 1.

> 
> Taken together, perhaps the hiding needs to be limited to PVH Dom0?

I very much doubt Xen will ever use the PIC unless forced on the
command line, and we should likely remove such option and just
mandate a working IO-APIC in order to run Xen.

My only doubt is whether some Linux code will get confused by poking
at ELCR{1,2} and malfunction as a result of not being able to fetch a
sane mask.

As a last resort, we could make the register RO?

Thanks, Roger.

