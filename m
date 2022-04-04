Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CB54F1795
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 16:50:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298385.508298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbO1X-0001NP-K7; Mon, 04 Apr 2022 14:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298385.508298; Mon, 04 Apr 2022 14:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbO1X-0001Kh-Gt; Mon, 04 Apr 2022 14:49:43 +0000
Received: by outflank-mailman (input) for mailman id 298385;
 Mon, 04 Apr 2022 14:49:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Zjy=UO=citrix.com=prvs=08688decb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbO1W-0001Kb-0E
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 14:49:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73804e38-b426-11ec-a405-831a346695d4;
 Mon, 04 Apr 2022 16:49:40 +0200 (CEST)
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
X-Inumbo-ID: 73804e38-b426-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649083780;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=XbOwN9fSFt5ZN2aeCUUoAMZNnhGimNiPjlOHzFlpzs8=;
  b=W7SolaS0jawU1/Wnz5O9ujlGPBXSUo7k+mkaXYCi0+THk7rMXosxPa8Z
   4Wm8z7MkhHcKCR24soqyX7ykl4WLvyoUWaRvCUfv402/IR1TjRJueqztg
   pxWY0YMFUnPfHy9UR3aobPmcEV1a952kt7ilGaqNTwxEdk4DlP4wa7ty8
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67951437
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KgcvaarCkYbTKMgHIX2Yv3Q23KteBmLVZRIvgKrLsJaIsI4StFCzt
 garIBnSOPeIMGD3L992Ydyy8B4Cu57TytBqTlZvqn0xEH8U8ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 Y+q+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBLrDmmrwgU0RjTDxSNq5U/ILKClySvpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZVINGMzN0uojxtnHQg0GcJkoOOToHDBKz99uH+viow67D2GpOB2+Oe0a4eEEjCQfu1emUOdu
 2TH43W/BxgcPdOS0xKV/3S0nOjNkCjnHoUIG9WQ1vNsmkzV+WUVBzUfT179qv684mahX/pPJ
 kpS/TAhxYAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9+4FHhQ27ufTEyjEsO7J83XiYkD5MFPuewcUUCEHu+Tj/bpskz7ETcRnLaOeqvD6TGSYL
 y+xkAAygLAajMgu3qq9/Ezajz/EmqUlXjLZ9S2MADv7s1oRiJqNItXxtAOFtaoowJOxFAHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWJ4vWoWyKRBaJ9sldrVj
 Kn74145CHh7ZibCUEOPS9jtY/nGNIC5fTgfatjab8BVfr96fxKd8SdlaCa4hj6xwRB2yf1iZ
 czHLa5A6Er274w9kVJaoM9Hj9cWKt0WnzuPFfgXMTz5uVZhWJJlYehcawbfBgzIxKiFvB/U4
 75i2ziikH1ivBnFSnCPq+Y7dAlSRVBiXMyeg5EHJ4arf1s9cEl8WqC5/F/UU9E890ijvryTp
 S/Vt44x4AeXuEAr3i3RMS8zMOq/BMknxZ/5VAR1VWuVN7EYSd/HxI8UdoctfKlh8+pmzPVuS
 OICddnGCfNKIgkrMRxHBXUhhOSOrCiWuD8=
IronPort-HdrOrdr: A9a23:XWV6e6xh3vZXnATpZ36aKrPxwOskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WBxB8bYYOCCggWVxe5ZnOnfKlHbakjDH6tmpN
 pdmstFeaPN5DpB/L/HCWCDer5Kqrn3k5xAx92ut0uFJTsaFJ2IhD0JbDpzfHcGIDWvUvECZe
 ahD4d81nOdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInhy6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXgIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6X9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF/9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc0a+d
 FVfY/hDcttABKnhyizhBgu/DXsZAV4Iv6+eDlMhiTPuAIm30yQzCMjtbkidzk7hdAAoqJ/lp
 T525RT5cBzp/AtHNFA7cc6MLyK4z/2MGTx2Fz7GyWUKEhAAQOJl6LK
X-IronPort-AV: E=Sophos;i="5.90,234,1643691600"; 
   d="scan'208";a="67951437"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhMUoAXA0GiQII/q2iV+qMo3gCzNwwdxtMXHz/1x7R14iEaivL7s/ROl42DaHMNE1eivZncXGf941KrpGXE4qiRZ2Uuy1qBaC+oFrNCJA1vSwvJURgl6xPu7di4sOOk3vphmC8shZivQ3IzD0DOJ39khymltUkAZaluaqi/IoM7F3ZFsTjBjFL63JLd5p55KQkVYbxn1A352XE4HVZFoaoGf1LwgVBlpUnzZNX2GDvOu0Cgu2n/lN4N+hKIG9r0jwb1kPc4F45ZhrrY9GZIbgxTncPcgyad4UVYvIY6knxlSfBYzl2h8ga0GDeAv8KCNC69IFkdszLmkDIWtixTmtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cY2/U7HQ2GVDu9OVSig0xymFmXpVMQst6H3h4SZSRNs=;
 b=NRjfuelYNyX/ivTwdVb5RyM3Uj1suCqYgmEyEL/++OC6jWlM64ISg03ISHrX6LmHaFua450Q+ir7wYvU0fwQDduc84cNN0VnhoBFE+ao6xg/0Hfovyq2C5oQRiLp3HpBvnOU3Qf+Ys2OVJKdA6SmQef9z8OjBmmHQErUJRXlCD1ZlXWoTQTaDxyDGRANmboVT7sproc8FPVaBS7j5iRfKTw8XlkvuXsOYIRiiBA9Nk9wx2uqYw6SoYTvN01P3JIzPVDzpaQueVDjFrfZqyhWhyriNUO2Vw59BWBl7xMOkTvEeHNylZ+ZiH+IWNxsTMvBRfBHXwRsZZgA8HvG0igvrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cY2/U7HQ2GVDu9OVSig0xymFmXpVMQst6H3h4SZSRNs=;
 b=iKZZcuyw0lgRS5EAwyIF4dEz7kpuyQwmxOPWCY9Hgnp8HvGUEP1eHMMROsbtQOsQRpYWprGPtEpv3yo9nq1PoWalthnUw2WrCp3ifUr+SFFr3K8WuqPDhw2GBAbwNex0EtmfrBGChePa9rUCdw5Fbl703EnuK2p1BR4z3RtMxoc=
Date: Mon, 4 Apr 2022 16:49:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"community.manager@xenproject.org" <community.manager@xenproject.org>, Henry
 Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v4 1/8] x86/boot: make "vga=current" work with graphics
 modes
Message-ID: <YksFeCB3bcXBGfDe@Air-de-Roger>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <3fb7f3e9-a6cf-4f8e-1141-100848b1bdd0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3fb7f3e9-a6cf-4f8e-1141-100848b1bdd0@suse.com>
X-ClientProxiedBy: LO4P123CA0470.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f94545a0-127b-4028-a7f0-08da164a54d4
X-MS-TrafficTypeDiagnostic: BN8PR03MB4753:EE_
X-Microsoft-Antispam-PRVS: <BN8PR03MB4753AB87D5EC10A6E7FA981B8FE59@BN8PR03MB4753.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kSTv8Kxs8s0wi9LzoRLVisHLJ4QtcT8I4HhVkZblXnqFs7Qhqr7WDaoKySVOnqD28kalN5GWcmcYtktB1EGCWcmc5DfIvSSer6J1/eLC0Spdc01w1yfolKJ3waw5WcZwHKo95NJG/q7YqOnes3EiQr4lSxQl22jnR7Z2HCAt5DG4l0jpWaodEDkNcJ7WdcIjkVanzSO3GYPgngfyA5JKvFkeRa9Geuo9utLVZXi2roAGJAavkWcNRNa9iuMjyp5CCLEH19IRSPj69qcimgR05XKVeRN8gH89/PVUpXyjjMhb72LbELI1NSG9AUtYmxsw5jARCpcaHfZFCHDBWiBDh2wGkuUHWswY21f8/JnQFeWMFZhDYgK9J0617r+qz0mg/wQfARqS888qKCfnwXl1ES6dS/z7MeCpMZjvlJnyVPNSPYKQ+8O04jzV4vmbTSzi8b/yT/VyVfb8rvhXWJorSMLTDuryI7VYOB+CCJPTCd0bChrDE/DY1K/vAt9rKbF9nj2wrBvMl58aBIUFZWmzh3bynxGGSfU8mg+1Pc8/swyU3Dhxn4g+ZAU/RXA2Jf3A4aD6zkZrCaFK2FUG6Rve0xkwqVS6zVcLe8Nz0wguMg2j/A6SWi/oHFWQYnIaF72qUdrsEs8AD2CXdUYT+YfTEy/jTfn0eVXkPbuIaMsERfbUorJA5XZMzfentYo5w8Y5SuHjxDvVBKL70H9EvOV8iamdpdA3yT0jd7qJg0tf0k4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(5660300002)(54906003)(26005)(8936002)(508600001)(186003)(6486002)(86362001)(38100700002)(6916009)(83380400001)(9686003)(66946007)(66556008)(66476007)(6666004)(6506007)(2906002)(33716001)(316002)(6512007)(8676002)(82960400001)(85182001)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWdLK01ESU0rNFArYVJSaG5KRFN5RlJsWTEvMkNscUsvdGMxWVNpUXgxalha?=
 =?utf-8?B?K2lVbVBlVzgrTjNsNWN2U2M3MG1aMUZCRzhzOFAyaUF0V0EzNWRJeUF0QmxY?=
 =?utf-8?B?T2Y0UDRFUFB1bWxmSnpWM0dMZHpOUTYxakZVNUhtL1JqbE1XaWhtdy9SRlA3?=
 =?utf-8?B?SWVMUndQKzQvdWFUU3d3U2FSUWJPZ08yUFRwTElWKzUyM2VadWtCdDAwc1JC?=
 =?utf-8?B?RkdZcWR2cTdKcDQ4bFNPZ01ic1U4RXlSdFR3S1dGb2JqKzhiVzVaYmRJdHdS?=
 =?utf-8?B?TG9naGJ1Tk12emxSaURGSlJKN2dHTUhNdDZmZ2w5RVhHeDJZT0ZvcmRRSTNt?=
 =?utf-8?B?Q0hlbTNTeEpOd0RCcVd2NG95SVlObExCVWxOY0x6ODBSY1ZiUlJxV0pWNXJk?=
 =?utf-8?B?U3luNjJiRWlseUVUQ1l6VXpEVHZ2WW9MYVFRTkRXTkJpNXVDRUUxK05ld2dP?=
 =?utf-8?B?SnRNUHF2MnRvdnQxaWphQVNoMERjd2J2ZjJQbVh1VUozMW82RExGVXBPcHpL?=
 =?utf-8?B?amEyVHh1dHZ2eTlEeUlZaUxDckdKVkUyZDdLdXNQU0g3cGxJSkdMTENTRHFI?=
 =?utf-8?B?VktkSFBPdkVQdHRFeFdHbUhwYVcyRTlQVS9ZclFUMnYzOU5tSURXaGVwdGZG?=
 =?utf-8?B?SE9ITW1hUFUwWWtLUTNhcUpiQUZGbWZoMWgwb05pcC9wc2Q2SlNkZzVTM2FI?=
 =?utf-8?B?UUpYam1YVmQrK3lEY1J5MWV5bWE3eUd5UTJFaExJT1psQUtTTEU5Nnh6M1Zq?=
 =?utf-8?B?WTFnQytuZEQzWStzN21JRlNDWUo5TXZUaHI3bE5xZ2IrZDk1bUtxZ2l4ZEdD?=
 =?utf-8?B?K0MzNXJQUEtJOThqbEFnM0paZHlGaVNiUUlMdTVaVUdJSnkwOThTSitYakI5?=
 =?utf-8?B?NTA5ODBTRHZSVFZXbXo2cktvMi96TFNqWWczYVJZczNjZlZjQy94NmNIcVpI?=
 =?utf-8?B?d1lXOFNTWEFiSzI3K3ZrSjdYeU5jb1NuNHorSnRVYXM1YzRCUUVUOWlReDFT?=
 =?utf-8?B?dkxwNDR4cjJmVDU5VlBnOVYzNmtEdnVQczJ1T0FkM0ZuYTRDNHhhMjk5SDlP?=
 =?utf-8?B?MXR4NmsxdmF0YzB0NzFBdmJVL2ovbUZnQVIyTFdXUXFjSlp6b2FzclVOSU1H?=
 =?utf-8?B?NUFjZWswbEpFNVVEM2lYdDlLMlFNc25GTzdCRGxzUUlyeHdrazdSdFVtS1F3?=
 =?utf-8?B?Ujhsd3hCbzYvMjE2Mnh5OWRwOVVWN29hTGt6K2RLR2hFRVlEbVhJYXB1RVdQ?=
 =?utf-8?B?SjdISjVCVVlZeHRRQTVXSHFJd0Zvc0htL2JGZ2RhbVI1R0VsNmJ2S1l0RlZh?=
 =?utf-8?B?OWJVdzh3MHJhWXlFSU1OaVZFQ0NTRGZyK2lBNzhDYTl4MEJrUU83MWV2cGdJ?=
 =?utf-8?B?SzI2UGU0eW1GcXJpUDhjRlhldWxCamN6VUZITkg0RmtSY0xsZWYzWVgydjh1?=
 =?utf-8?B?cFdZbXNlRHRHSjRCZ25SRmFmSVFyTW9zVlFWeGtTbmJGdGFReFdKSkpZbkJ3?=
 =?utf-8?B?aXV2U1RGQ1QzUGtwMEtROTF6eU5peDlkbTFha2lWdnZGY0RQRXNJZFlJUHdp?=
 =?utf-8?B?VVFpYmwxQUNHeDUyOTJSYkI4NVlyVTZlbU1renF3RW01RkNScTRwK1oyajVj?=
 =?utf-8?B?SWtnZHF0ejJaNkZLUVB2cFVPTS9WLzEyL0VHQWRPaVRKVlRYdEpRVStBVWRC?=
 =?utf-8?B?UzEyRVc3L3NmN1Jsd0l3ejhWMWo3RUpzd0RXaVZ6bWFSYTZVOEtObEIvY2R3?=
 =?utf-8?B?RE1PcWtxKytreForYndick4rWit5QVhteFphZGxTeDJheXkyL3NoU3lEVytO?=
 =?utf-8?B?TWoyUCtpRCtYSllTQ0F4dkhUMktlS2hlYVUvanJ2UFFnQVVmK2ZrK3hsRSts?=
 =?utf-8?B?S0xad1FpV0FIMXBsdWJna2hDelB1VmE2eGxFYlFtZWZiV1BZZzNORHNrbE9N?=
 =?utf-8?B?RG5BNlQ4aUNjaXRVL1NGZURyUGlOV2p3UFJIb09XVmhjaWo4d1JyTE1HS1lE?=
 =?utf-8?B?MkExQ0JIMHNXNktGRjdoSSthS0JyQ3grRTg2cHVSWTduaXRXM0UxQmkxZlpE?=
 =?utf-8?B?Z3V5TEF0ZUQzT0szOTdkSXFqZy9VRVRZK0wrcDRQaWU0Sm5hclRqNldUc0d0?=
 =?utf-8?B?cW90ZXlEMHpvSmo0L0NjalZFelQvb3NVV0g1dDN4WHMyQWR2OUFnbzVSOGg3?=
 =?utf-8?B?RHhnazd4ZEt6ZHp1WTBVSHYzakN3L09HTTk5WWEzKyt0L281NTJ1ODY1UVlj?=
 =?utf-8?B?MlZPK3E3eUVUUGtCRi9PK3VFU2N5RkQzRG1EY1hVVEFubkFYR0hnejlNSWNI?=
 =?utf-8?B?L095dndsc2pwNWtiNVU5Qk9lWEVLdk5vVXZCb2tIOU9oNjVYSjEwYjlWUkFh?=
 =?utf-8?Q?dgTVNryM/4zMFfZA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f94545a0-127b-4028-a7f0-08da164a54d4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 14:49:33.4678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VyIHhbh2v90qbj6in0VqO2m+pxWrE3QhV0oW5SB39as3VtC10XlyLWUA4xsKJKTgRVMI2efTdo67MHPby69qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4753
X-OriginatorOrg: citrix.com

On Thu, Mar 31, 2022 at 11:44:10AM +0200, Jan Beulich wrote:
> GrUB2 can be told to leave the screen in the graphics mode it has been
> using (or any other one), via "set gfxpayload=keep" (or suitable
> variants thereof). In this case we can avoid doing another mode switch
> ourselves. This in particular avoids possibly setting the screen to a
> less desirable mode: On one of my test systems the set of modes
> reported available by the VESA BIOS depends on whether the interposed
> KVM switch has that machine set as the active one. If it's not active,
> only modes up to 1024x768 get reported, while when active 1280x1024
> modes are also included. For things to always work with an explicitly
> specified mode (via the "vga=" option), that mode therefore needs be a
> 1024x768 one.
> 
> For some reason this only works for me with "multiboot2" (and
> "module2"); "multiboot" (and "module") still forces the screen into text
> mode, despite my reading of the sources suggesting otherwise.
> 
> For starters I'm limiting this to graphics modes; I do think this ought
> to also work for text modes, but
> - I can't tell whether GrUB2 can set any text mode other than 80x25
>   (I've only found plain "text" to be valid as a "gfxpayload" setting),
> - I'm uncertain whether supporting that is worth it, since I'm uncertain
>   how many people would be running their systems/screens in text mode,
> - I'd like to limit the amount of code added to the realmode trampoline.
> 
> For starters I'm also limiting mode information retrieval to raw BIOS
> accesses. This will allow things to work (in principle) also with other
> boot environments where a graphics mode can be left in place. The
> downside is that this then still is dependent upon switching back to
> real mode, so retrieving the needed information from multiboot info is
> likely going to be desirable down the road.

I'm unsure, what's the benefit from retrieving this information from
the VESA blob rather than from multiboot(2) structures?

Is it because we require a VESA mode to be set before we parse the
multiboot information?

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I'm not convinced boot_vid_mode really needs setting here; I'm doing so
> mainly because setvesabysize also does.
> ---
> v4: Add changelog entry.
> v2: Use 0x9b instead of 0x99 for attributes check: I think the value
>     used by check_vesa also wants to be converted, to match vesa2's.
>     (Perhaps the value wants to become a #define, albeit before doing so
>     I'd question the requirement of the mode to be a color one.)
> 
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -6,6 +6,10 @@ The format is based on [Keep a Changelog
>  
>  ## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>  
> +### Changed
> + - On x86 "vga=current" can now be used together with GrUB2's gfxpayload setting. Note that
> +   this requires use of "multiboot2" (and "module2") as the GrUB commands loading Xen.
> +
>  ### Removed / support downgraded
>   - dropped support for the (x86-only) "vesa-mtrr" and "vesa-remap" command line options
>  
> --- a/xen/arch/x86/boot/video.S
> +++ b/xen/arch/x86/boot/video.S
> @@ -575,7 +575,6 @@ set14:  movw    $0x1111, %ax
>          movb    $0x01, %ah              # Define cursor scan lines 11-12
>          movw    $0x0b0c, %cx
>          int     $0x10
> -set_current:
>          stc
>          ret
>  
> @@ -693,6 +692,39 @@ vga_modes:
>          .word   VIDEO_80x60, 0x50,0x3c,0        # 80x60
>  vga_modes_end:
>  
> +# If the current mode is a VESA graphics one, obtain its parameters.
> +set_current:
> +        leaw    vesa_glob_info, %di
> +        movw    $0x4f00, %ax
> +        int     $0x10
> +        cmpw    $0x004f, %ax
> +        jne     .Lsetc_done

You don't seem to make use of the information fetched here? I guess
this is somehow required to access the other functions?

> +        movw    $0x4f03, %ax

It would help readability to have defines for those values, ie:
VESA_GET_CURRENT_MODE or some such (not that you need to do it here,
just a comment).

> +        int     $0x10
> +        cmpw    $0x004f, %ax
> +        jne     .Lsetc_done
> +
> +        leaw    vesa_mode_info, %di     # Get mode information structure
> +        movw    %bx, %cx
> +        movw    $0x4f01, %ax
> +        int     $0x10
> +        cmpw    $0x004f, %ax
> +        jne     .Lsetc_done
> +
> +        movb    (%di), %al              # Check mode attributes
> +        andb    $0x9b, %al
> +        cmpb    $0x9b, %al

So you also check that the reserved D1 bit is set to 1 as mandated by
the spec. This is slightly different than what's done in check_vesa,
would you mind adding a define for this an unifying with check_vesa?

Thanks, Roger.

