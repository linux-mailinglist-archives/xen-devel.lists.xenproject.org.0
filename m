Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A25D75F43CA
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 14:59:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415530.660127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofhWG-0002Z0-St; Tue, 04 Oct 2022 12:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415530.660127; Tue, 04 Oct 2022 12:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofhWG-0002WW-Pa; Tue, 04 Oct 2022 12:59:32 +0000
Received: by outflank-mailman (input) for mailman id 415530;
 Tue, 04 Oct 2022 12:59:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AV+7=2F=citrix.com=prvs=269045312=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ofhWF-0002WQ-JJ
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 12:59:31 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6180d713-43e4-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 14:59:30 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 08:59:24 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB4941.namprd03.prod.outlook.com (2603:10b6:208:1a6::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 4 Oct
 2022 12:59:22 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 12:59:22 +0000
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
X-Inumbo-ID: 6180d713-43e4-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664888370;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=61JzA7D30egICvJcKWfhbSNuYIE9MdK+1IDhrWjxMrQ=;
  b=cAN+JEyREhcHEnnobCZ8F7Vxht/pjiK7Jzyy+4JfGc+vQnTnESha89RL
   j/1DhMg1fC7Uya3KS62f1cNtEsu2lXNxTvlHuD4Uo0cw6iieTmTEd6QX6
   okE2LBtn9vfQlotD18phNHkgaqm7AD8YgBLLr/OcRJnM26cL7n8UB2zP3
   Y=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 81060429
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iEwpSay5HNTVRIp0/2t6t+ctxyrEfRIJ4+MujC+fZmUNrF6WrkVVz
 zMXWz+Aa/uLYjekLo8kb4q180oF6pfTy9JmGQRs/yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHPykYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtspvlDs15K6o4WtA4gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwyON3L2J+s
 uwjdRMxTQiKhe+U+66cY7w57igjBJGD0II3nFhFlGicJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuvTi7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLVqyry3rOVzEsXXqoCJb/o/aJg3GbM/UgDTy07Flu7ruCm3xvWt9V3b
 hZ8FjAVhao4+VGvT9L9dwalu3PCtRkZM/JPF8Uq5QfLzbDbiy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU331y1uPhTa7OCxQJ2lSYyYBFFIB+4O6/tF1iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxlohDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:htUIJKxOn3btlmwmIkr/KrPxt+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICO4qTMyftWjdyRKVxeRZgbcKrAeBJ8STzJ8/6U
 4kSdkFNDSSNykEsS+Z2njeLz9I+rDunsGVbKXlvhFQpGlRGt1dBmxCe2Km+yNNNWt77c1TLu
 vg2iMLnUvXRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIG/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF9nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvGOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KNoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFrLA
 BXNrCT2B9qSyLaU5iA1VMfgOBEH05DVCtue3Jy9fB8iFNt7TNEJ0hx/r1sop5PzuN+d3B+3Z
 W1Dk1ZrsAxciYoV9MNOA4ge7rCNoWfe2O6DEuiZXLaKYogB1Xh77bK3ZRd3pDYRHVP9up4pK
 j8
X-IronPort-AV: E=Sophos;i="5.95,157,1661832000"; 
   d="scan'208";a="81060429"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QS7AEi54ObmODJ7ufodLA7Rx2V80tejm3ERSoaa+bI/exywH6hTvqkGonMeMn0zgDYHLzVyVopUG0zZtKw7hUCAAIQOA+cuE4jbWn4kqYa1PiCIFvrmc67aFtG11uvfS+NFRH/4p7Lla9vS/k/ZjbfaFpw5EyR1b8FVFQUQZk5HiwuxVSxCbmQEeLKwX/2b4/OYMa3RMpGIDrqbuqEoG1G6SO4/dBE4dp0nrJ0AAYxj4ufwvCDQ7ZZqI2AV0s/cIHbJehrnDW+jYbFwnWOfFRLC5eGOrB5Ye0VoXUUh4wEzobeGtYCOIdpAMxoVe/QzsnHL2CR9X+Rlxqpi9AhUHgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waDwAaiXiRRXDcBI8kJO/v0XUalPOoo5kuxE445hk1M=;
 b=b6zPHxJMYA3JYhh4F1VYNnjHXM2fQd8r4jkYt6jA42+p3ghF14P2qrUOKVWss/QLAT/yUZ6R3ZK6s6peXlwAVtTXbBGYr4rbw7dLThF/bZEdYfRSWx+v2KawRBsPnW9ZPtTFXDGYCnwdjEnP6HQVF09Ifz9b/7voZyurtz9Xz2PB0j3krmh+feQlFrPT5eP/9g6PhSwuY+ORz6OUvUvWqOYI9ZkCiwkdUP7kT00VQvUvMW4tCO3p86SAxNCKfSAF6xC7/73q2edfK4GZyJsoLEZ/q77SkDFWTkg6ipGrzaySH70dNf3IhPwRR+xbsKFvXlUokdeJAYm8xwpvsKaqPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waDwAaiXiRRXDcBI8kJO/v0XUalPOoo5kuxE445hk1M=;
 b=ahIdEjM/syYZEExEvsUBsG2F/nwEHzz1pXVoOwet6L+bWsfpmPxLphHHix05iqbzQEUnIXRX66vY8GDo9eDGitOdmfId/Mz1XKrW1/efemTE5xNlZLt3G2w/3Lvyj1jvXXSUshl2kstDY1o4g5u8gL4lPszltPjhpUyTSooV8Fw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Oct 2022 14:59:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17] x86/efi: don't translate EFI memory map MMIO
 regions to e820 RESERVED
Message-ID: <YzwuJTOtcIopeOlm@Air-de-Roger>
References: <20220930141737.67574-1-roger.pau@citrix.com>
 <e3235c0f-5964-0f95-fcc0-bcc44bf9d784@suse.com>
 <Yzv8lpnf28aXgQQM@MacBook-Air-de-Roger.local>
 <ea544e76-0dfd-4f24-89ef-25265f7b049a@suse.com>
 <YzwkXh+8xzbCZdkO@MacBook-Air-de-Roger.local>
 <2d49fdfa-bd76-0469-0840-6260c5a8ff48@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d49fdfa-bd76-0469-0840-6260c5a8ff48@suse.com>
X-ClientProxiedBy: BN8PR16CA0033.namprd16.prod.outlook.com
 (2603:10b6:408:4c::46) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB4941:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d577618-3d1d-4281-159b-08daa60841be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g5kFhaAnWbhpjMchApWa+AdcN4iSgeEWaiVhJ9OvUCmk7cPGtCjWAzarlQxSwM+KHPhCGWGfJN3QQ3hoqevRf8iSRBOtZz8LMRTVS6GzjvgKCpMfzH5WUC7bMyxbTeShorK6FQT7FamzAB8tF/OxxM66rtUrZ+l2RP0fiKYGVXnz2yc8l+wdMStyCvf5awWiaAXfPA3bJF8RzhHC+3d01TCbcY3TkuZl32Jl/EeYoklnmKhmA18++LSA5idy3Rk/Iy1LysSDshU+i13HF+8mUgGoih9TqOr8SGePpWKS2sEa1uSJztNtCrKlKkfAJREVQw5bhiFGh3C2YEB27nSv1nPWgDIQB14uPAhOORAM4pxzxsxz6PWFH/wQQBk8ZP4YxWeNQFVP7tVuIcdwwlLXQ7Q8fcATwFI0tw/DIzuiZp++BNR/T0qAtXoItQYcuqKn6a5CuetJb/U7n+zIovDz2Io3i7/3SYLYUt4ZcH1MZY9YfFEhBAMjNSanCQa8JROIB9CVZf1T46SSfobgs1m2mVuPaMr2egsG0J1yNK3ZEaPyPUJJkD0caH5o4KoqjG/4loXHaY1zqZPkTuJJEYEg6SQaEveWzMC+CjdIdMm0wCPkHc+/gSYW2XBpPb2t+GyfKSiwgUVEa9DeGs8lAaKQv4ApsxIzymcZLOxw99AHuwi/n1bg7JpmLBjGdcP3MMrmugvtgozIOmNjDIGUbI+1/A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(136003)(366004)(376002)(39860400002)(346002)(396003)(451199015)(186003)(2906002)(6506007)(85182001)(316002)(6666004)(33716001)(54906003)(6486002)(478600001)(41300700001)(66946007)(8676002)(66476007)(66556008)(4326008)(6916009)(53546011)(6512007)(9686003)(86362001)(8936002)(26005)(5660300002)(82960400001)(38100700002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aG9zL2lnZTRHeVBZWHZ6R2JmSUpIVDYxSU84Tm5aMk1ldytkZUhTWFpaSGN4?=
 =?utf-8?B?dUlYZmhOdW91NHdhWVRjRkN5cVVBWi8yaVFQbkdVOXp4TnU2bGJEQjRuK3lP?=
 =?utf-8?B?RFRWTnVVdkx5S1hRMkh1WEhQL21CdVk4ek53ZTAvbDV5cGxodlBEWlFwSmt6?=
 =?utf-8?B?Y2JaQ1FrK21nanVhSENHd0k3bWRwVERZbUMweXpJL1pTZlNIYmdwTGQvYUd3?=
 =?utf-8?B?VVdzbEliOWx0SW5RR0thT0hkVkQrRkhoSEVZU2YyK3k0U1FNR2dyTEx5N0VJ?=
 =?utf-8?B?SEwzNm44Y1piYy9tOW93N2VQNWc1YXdadEhYYkpXSmFxYkdadUpXSVBKcUU0?=
 =?utf-8?B?MVl5aVdDcGJ0RTRxaHhqZldsaVBOY05Pd3BDL1NxVE1UYjVRUFRtcGN5VTRY?=
 =?utf-8?B?RnZhM0IzNGNoWXMvMlMwdXZtSFVPUCsyWTJCUXRYQ2JsWC9GTTZoMGx3MDNL?=
 =?utf-8?B?WTN4Rm00aC9qMXpWZkZjdEVvTWd5SXV2SmNNRXIrYXNLSXVneHhlTndyNmV4?=
 =?utf-8?B?c05RKzhKTko5VU9PQVU1Tml3L096ZzgxbGFGZlI1MCtMY2hpbHluV0diVjdS?=
 =?utf-8?B?eHFkMHdKWlF2NjBBL05Wam9SeVVuRnJpcDUzeDZ2YVE4eEkySUVKZDM1Sm05?=
 =?utf-8?B?WXNBSXR3NWZkTjIrd1VoOUdWdE51b3pkejJCSjVCVUtFUzJuL3h1d1FSenFs?=
 =?utf-8?B?NEFuc2xXU0xiUHNJNlRhZVVUTlNUQlhvTHBhYVprcmJOT3YrVFBZTEdXV0tH?=
 =?utf-8?B?UjJRWDNDcm9qVVg1ZmZUTUNNT1BXVUZiRFBCU0Q0Q0x2cnlMWU4rNTZFVUlL?=
 =?utf-8?B?WWRHM3RmTS9iZWdvS2dOWUE1TEErMmFlMjNHODJtREtSMGZsNzFTQUcvdVEr?=
 =?utf-8?B?ODRRSWlFZG1EeFQ2YnBLbTFSVnVIZnNBUkNnVDVRd21zTjdHWEpsWkcwWVBi?=
 =?utf-8?B?VVBmc0p1RVNBRWtyaDVKQTlVWjdmV05lSnhSRGoyMlFEeGVMckpQa25lZXB3?=
 =?utf-8?B?emFYY1NYY3N6eCtiYmdWZHNkc3RRVkRXK2R3MjlFcW9WMlEyN0I4OHhwOVhP?=
 =?utf-8?B?WVZpdUxucU1uZHN2eDkrZDloOGNnUDBlRGVGNkV1V2dBN2dNNHYzb3JhVzF5?=
 =?utf-8?B?M3NuTHczdWVOVHY0VldsaVhUcjBtb2hEYlJhMlRXM0N4R1BCRjFncmY3Q2xM?=
 =?utf-8?B?bzFLODROQzlGSnVYSXJEVmNuUnZhQ3J2anFzeGsrcmEwRmN1RENHd3EyOHB0?=
 =?utf-8?B?L3Vvd2IzRHlvdUZ5QVlaM1RMeHV1NjdtOGVTS2ZNb3lUQUFhYUxaU29WV29F?=
 =?utf-8?B?ZkdGL0o4MjZ1bktkeUJtTytsb3BpM0hlblRRdC9KbmJESWJjdGp2d1JBK3NS?=
 =?utf-8?B?UWRFWHJhMExsYnUwQ1h1cGVhNmE0eTc4WGY4VzVsMGFZcWJvbFN6TnpEZnFQ?=
 =?utf-8?B?V0EzUzduSzk5djJib1FXWHNzN1VvWmRPcjdOYmFQNy9OMU1VdWZrMCtRNGxx?=
 =?utf-8?B?WjNDS0huT2V5TWkvUTBOc3VCa1E1RG1Mem80NlhTS1FRRkxFZUpiYVFSdU1y?=
 =?utf-8?B?UmdHT3V1ZXRhaVZWTWJhWHkvdGxjVytkdTFWT05jMWY4UXZQR09SRCs0L3Nw?=
 =?utf-8?B?cFcrZ3pnQndtZnBNY2NISE5KRkJrTWZySHVhMzJxQnVTK3h2c2w3TlFmc3ZY?=
 =?utf-8?B?eGRjdHpMNVNoM3NsRHRNczcvT3hPZFYyQjJybzdlMzA0NllHV1J0U1EwYjB5?=
 =?utf-8?B?dXp0aFl0TzJDSnljVmdIeTVOdEx2VFhVbEl4VnoycFFRTTc2Ymd6cDhwM1N2?=
 =?utf-8?B?b01mUFZYeXUydUsxRGhDZ1hDODRTQ3loRnRRaFN4emJpOXFHUGEyVHc1dHY0?=
 =?utf-8?B?S0VHVlBBZnZIVmtxdTcyTEhjVzNuT0d6eFcrN1VWYUNtVDFhZXRCTUM4eFhE?=
 =?utf-8?B?SUIramlWK0NyK1B1SkFuU3d4WHlBRUNUWS9UekY1RWIvLzdmRit0bmxlZksv?=
 =?utf-8?B?czJQbStIOFZEMjRaWWhlOGVBOUdxWWE2Q04yYmM4alArbnl3L29xTTFnZEMz?=
 =?utf-8?B?Z0RqZmJUUmtEMUIwSDVBcTBJeFN2UDlMbHRvV0xXRUpsVnBaU1NRd1FOZ3VI?=
 =?utf-8?B?MlBvMnlCcGN4eFdtM0twWkJKL1pwYS9WdnNQaTlBWTlqWFZwUWozUndBWDZI?=
 =?utf-8?B?dkE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d577618-3d1d-4281-159b-08daa60841be
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 12:59:22.1459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0LN37vXR71gku+oKc7oO86b5gx49exug2WCnfLVR/IV6eRYVdjaMU6v7bCSQYB67BagWxoTUHNYtDtft2gFZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4941

On Tue, Oct 04, 2022 at 02:21:20PM +0200, Jan Beulich wrote:
> On 04.10.2022 14:17, Roger Pau Monné wrote:
> > On Tue, Oct 04, 2022 at 12:40:10PM +0200, Jan Beulich wrote:
> >> On 04.10.2022 11:27, Roger Pau Monné wrote:
> >>> On Tue, Oct 04, 2022 at 11:01:18AM +0200, Jan Beulich wrote:
> >>>> On 30.09.2022 16:17, Roger Pau Monne wrote:
> >>>>> The EFI memory map contains two memory types (EfiMemoryMappedIO and
> >>>>> EfiMemoryMappedIOPortSpace) used to describe IO memory areas of
> >>>>> devices used by EFI.
> >>>>>
> >>>>> The current parsing of the EFI memory map was translating
> >>>>> EfiMemoryMappedIO and EfiMemoryMappedIOPortSpace to E820_RESERVED on
> >>>>> x86.  This is an issue because device MMIO regions (BARs) should not
> >>>>> be positioned on reserved regions.  Any BARs positioned on non-hole
> >>>>> areas of the memory map will cause is_memory_hole() to return false,
> >>>>> which would then cause memory decoding to be disabled for such device.
> >>>>> This leads to EFI firmware malfunctions when using runtime services.
> >>>>>
> >>>>> The system under which this was observed has:
> >>>>>
> >>>>> EFI memory map:
> >>>>> [...]
> >>>>>  00000fd000000-00000fe7fffff type=11 attr=800000000000100d
> >>>>> [...]
> >>>>> 0000:00:1f.5 disabled: BAR [0xfe010, 0xfe010] overlaps with memory map
> >>>>>
> >>>>> The device behind this BAR is:
> >>>>>
> >>>>> 00:1f.5 Serial bus controller [0c80]: Intel Corporation Lewisburg SPI Controller (rev 09)
> >>>>> 	Subsystem: Super Micro Computer Inc Device 091c
> >>>>> 	Flags: fast devsel
> >>>>> 	Memory at fe010000 (32-bit, non-prefetchable) [size=4K]well
> >>>>>
> >>>>> For the record, the symptom observed in that machine was a hard freeze
> >>>>> when attempting to set an EFI variable (XEN_EFI_set_variable).
> >>>>>
> >>>>> Fix by not adding regions with type EfiMemoryMappedIO or
> >>>>> EfiMemoryMappedIOPortSpace to the e820 memory map, that allows BARs to
> >>>>> be positioned there.
> >>>>>
> >>>>> Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
> >>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>>
> >>>> In the best case this is moving us from one way of being wrong to another:
> >>>> So far we wrongly include BARs in E820_RESERVED (_if_ they can be
> >>>> legitimately covered by a EfiMemoryMappedIO region in the first place,
> >>>> which I'm not sure is actually permitted - iirc just like E820_RESERVED
> >>>> may not be used for BARs, this memory type also may not be), whereas with
> >>>> your change we would no longer report non-BAR MMIO space (chipset specific
> >>>> ranges for example) as reserved. In fact I think the example you provide
> >>>> is at least partly due to bogus firmware behavior: The BAR is put in space
> >>>> normally used for firmware specific memory (MMIO) ranges. I think firmware
> >>>> should either assign the BAR differently or exclude the range from the
> >>>> memory map.
> >>>
> >>> Hm, I'm not sure the example is bogus, how would firmware request a BAR
> >>> to be mapped for run time services to access it otherwise if it's not
> >>> using EfiMemoryMappedIO?
> >>>
> >>> Not adding the BAR to the memory map in any way would mean the OS is
> >>> free to not map it for runtime services to access.
> >>
> >> My view is that BARs should not be marked for runtime services use. Doing
> >> so requires awareness of the driver inside the OS, which I don't think
> >> one can expect. If firmware needs to make use of a device in a system, it
> >> ought to properly hide it from the OS. Note how the potential sharing of
> >> an RTC requires special provisions in the spec, mandating driver awareness.
> >>
> >> Having a BAR expressed in the memory map also contradicts the ability of
> >> an OS to relocate all BARs of all devices, if necessary.
> > 
> > I've failed to figure out if there's a way in UEFI to report a device
> > is in use by the firmware.  I've already looked before sending the
> > patch (see also the post commit notes about for example not passing
> > through the device to any guest for obvious reason).
> > 
> > I've got no idea if Linux has any checks to avoid trying to move BARs
> > residing in EfiMemoryMappedIO ranges, we have now observed this
> > behavior in two systems already.
> > 
> > Maybe we could do a special check for PCI devices and allow them
> > having BARs in EfiMemoryMappedIO, together with printing a warning
> > message.
> 
> Right, that's one of the possible quirk workarounds I was thinking of.
> At the risk of stating the obvious - the same would presumably apply to
> E820_RESERVED on non-EFI systems then.

One option would be to strictly limit to EfiMemoryMappedIO, by taking
the EFI memory map into account also if present.

Another maybe simpler option is to allow BARs to be placed in
E820_RESERVED regions, and translate EfiMemoryMappedIO into
E820_RESERVED like we have been doing.

I will attempt the later if you are OK with the approach.

Thanks, Roger.

