Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB528345B80
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:00:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100547.191606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdoy-0006WF-Du; Tue, 23 Mar 2021 09:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100547.191606; Tue, 23 Mar 2021 09:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdoy-0006Vq-Ad; Tue, 23 Mar 2021 09:59:32 +0000
Received: by outflank-mailman (input) for mailman id 100547;
 Tue, 23 Mar 2021 09:59:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdox-0006Vg-7u
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 09:59:31 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49e851fe-54a9-4ef3-afdd-4687a4a484de;
 Tue, 23 Mar 2021 09:59:29 +0000 (UTC)
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
X-Inumbo-ID: 49e851fe-54a9-4ef3-afdd-4687a4a484de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493569;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=m2sJFlRZrCcr9VQ23BQRU862yHjdPgMiGukXblN3Etw=;
  b=HIsXWeqqebJVsDjghgmmQ5DE+C1t1/zUBUzUd06qgdv1WvBMGeJ0Q+Eo
   PRp4WBW1suxLufsPyHFvvjCQrCxYo5zM4pY+qfX+eexDx7RDBu5WrDUg3
   wQovQ5mI/rhnZ8Xqemmk+3PlXM5BNkfet70x6gMkm6brAkukJV8EyNwSy
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: j1z4ZbtuiCBorV6zVUrrpkFZOZ7xLcs1+ZvJukWn1fem32KHBR7WYwVcQUTiOBzUwWlOg8Psrf
 e7I7czrtH+4vMe56CrdWzBf6xn4NJqNqnDI1WevIVkVz1+5lEvcpfUNOgDPizpioqYyJPs6/A1
 D0sQENXe34JOUFBpODJzkcZCT6S0cmPpRm8r3o1ia0qCILCuxtVHp+uu27zqtCWT8zUA3mxYUT
 ilc0Hly6coFVK6ZVWWBEYB4xMT+vlzRhFyzRPAZquC5WjXBMAzHydrNolB+gzBjSBudAd2XrOX
 C9c=
X-SBRS: 5.2
X-MesageID: 40055371
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3JW5Dq429bT2gATsqQPXwS6EI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex3h3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdBHW3tV2kZ
 1te60WMrHNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2FXQotLhj0JbTqzOEtwWQVAGN4FD5
 Ka/MVKvH6Nfn4QY8S9CBA+LpX+jvfMk4/rZgNDOg4/5GC1/EmVwZPZMzzd5BcRVDtT3awvmF
 KlryXV7riu2svLsyP0+HTU6/1t6b7c4/9iIODJtcQPMDXrjW+TFfVccpmPpio8ru3qyHtCqq
 i1nz4aM85+62zccwiOyHOHsWSQs0dNmgzf4GSVnGf5pojBTC86YvAx+75xSAfT6EYrobhHoc
 R29l+e3qAnaS/orWDW4tjFUAxSjUykoXYuuv57tQ0hbaIuLJBWtoAR50VTDdMpGz/78pkuFK
 1UANjb/+s+SyLWU1np+k1UhPC8VHU6GRmLBmAEp8yuyjBT2FR01VERysAzlmoJnahNB6Vs1q
 DhCOBFhbtORsgZYeZWH+EaW/a6DWTLXFblLH+SCU6PLtBHB1v977rMpJkl7uCjf5IFiLEono
 7abV9evWkuP2rzFMy12oFR+BylehTyYR3djuVlo7RpsLz1Q7TmdQeZTko1rsemq/IDRuLBXf
 KeP49XHu/DIWPiFZ0h5Xy8Z7BibV0lFOEFsNcyXFyD5ujRLJfxi+DdePHPYJrheAxUGF/XMz
 8mZnzeNc9A5kekVjvTmx7KQU7gfUT54NZVGKje9O4D9ZgVOuR3w00ooGX8wvvOBSxJs6Qwck
 c7CqjgiLmHqW6/+nuNyGl1JBxHDAJw7K/7W31H4S8GWnmEPooripG6QyR/zXGHLhhwQ4f9Cw
 hEvWl6/qqxMti33iAtC9WuN0qAlHsNrHe2T5MR85fzpfvNS9cdNNILSaZxHQLEG1heggBxsl
 pObwcCWwviDD/0sL6ki5YVHenbUNF5jG6QUIppgEOakX/ZidAkR3MdUTLrdcKMmw4hSwBZgU
 BL/7YFjKCNniuuLmUDkP01WWc8GFi/MfZjNkCodY9UkrfkdEVLQWCGiSezpjszdmDpnn9izl
 DJHGmxQ7XmE1BdsndX3uLW61tybHyaZF81QGt9q5dBGWPPvWtT3eeHarGo6XaYbkIPz4gmQX
 b4SApXBjkr68G81RaTljrHKG4vwY82OPfBSJskaLPe1xqWWfq1vJBDO8UR2plrNNrj6LBWFc
 2efhKYNzP+BacC3RePqnMsJSlzrz0FnJrTqWjYxVn9+ER6J/zYZGlCbfU8Bfq36mD/XfaG0J
 ljl7sOzKKNG1S0TuTD8L3daj5IFwjarmG3Rdw5sJw8h9NBiJJDW73gFQbS3H5J3B8CPN75uU
 MXTqN8+q3AMOZUDrgvUhMc2lIokdiVRXFbyTDeM6sbfVs3iWXcMM7My73UqaA3Cknpnnq6BX
 Cvtwlc9ezCRS2NyPozDL8xO31fbAwZ5G559O2PM63WBwPCTZAIwHOKdlu8eqRaUq6LBPE5qQ
 t7+ciBm6uvTBXDsTqgywdTE+Zp6GaoQcS7HQKKF6ppyrWBSCixq5rvxtWygjfxQSa8cGICi+
 R+BAotUvg=
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="40055371"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tvz4+P1xVv1L4IUWH9tKQry8Mj0fe6fiNv6tzRPuxr0MCRl5MQQD4cB9G7ITmOyPu+E8rw5ZtOWNmGT7GXOJFaEwsQPmIbHvw+dc0XiOq2oxrrFMRhhJJkQcxQtugl9MWW5I4+3dG5W89B4KTWdPF4ga5lGLVhrxR7kCXCP/Bp72UDA86EXcHIBpUgorVlBPJyH6nvs5y2+yk8vRLBBtFl7rGwpVvHtcKjb9tclE+fpViyCuac/ayqIkk6zuAKRh0Yp2hQ/cKjuhEQkebT/g6YFbt8Wg0Nuy2ZQkvEFsLvgcjVZpC5lonDuCmUjPG6kGQQxRJNj2Kyl8dyZ4aoVfcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNH21g3qxXPN6ozUOJ43J5EqhCLkuO9vrTe0vMZLM2o=;
 b=l7H7eJutsrpHUGues2gtVxWj/3Sq3o7zz3FHLQoqR0FJgO1C9Wl9/SX9IF+18baDylXP3FOcqIsU+hQtmpaESTIwoxyDHjh6yFZHcuBbPhk9lt3f+zpP4zSGTqyPPPvnQS2Xun88RUOPru/djb8tZNOqoY1PJuF6dyrQGzh5pTgc1STpKxOTkmG+ImVyKykx1Dvvs7btZLVo5Ns63DB6xbu+N9iWRCoxiHQUidfJqOQnTYuXxaT8RWbwjGPTWXJr0lZP1njqtGFyLYFNZYw2DR1M1oG/Y1tk3uiO17wE5C2kYkt/e1IVY3bvUEDZzmk4inIWP06TJkhoYvKQDV5qPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNH21g3qxXPN6ozUOJ43J5EqhCLkuO9vrTe0vMZLM2o=;
 b=BETjUux3fc0Q26xCtZEswqfc7dCpl5Cp0P7n5PtjU7V3aG3Bx7mWIsE2nOSmcwF80C2+1n8Qeqpivw0C+dzoQjOXMRxZujmASTdAmrTLbb4RE9qsjARy3HT8BtYclh2cwZJXnZiYV93UzROwOBLbKd3vN1UFcF0mfceQV/Hkp2M=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH 00/21] libs/guest: new CPUID/MSR interface
Date: Tue, 23 Mar 2021 10:58:28 +0100
Message-ID: <20210323095849.37858-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0034.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3066deb2-31d7-462e-e0b4-08d8ede2570b
X-MS-TrafficTypeDiagnostic: DM5PR03MB2633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2633ACCC4463152C0D0E5CE68F649@DM5PR03MB2633.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MJHzTk+cd5v0ApdEQo5D0qg356B05XFO3oVO1cqUqDgMNA9pEqzuRGDBl6p8cF9R8DzJvUONp8Kc5hqMgvp/qFd2g0NhzgbC9FsjYjg3+GbB6i0vaCZJviHHGRQj2kRRzjKo5e7ForY31BHCtDfr21gXy/ALtl7gMjqun7RAnbT/XkrJ3LEOM3e+M5R4NudA4wvI1mqLZFX7ILO/emv20pqG7y4Upqlgkic7PTNwlnSU81GN0sSPxu6Ws6fh0gyPwA3QFAaxTTdlJPDVjtasmQgd5o8MPGzBSJcxVMjAelCopmJ0Of7Urk5AZ3L3dEhRVKhNFr9DgprXXnUMhoQjCOuDajgRylSxRXZ/7grO7/3pp+cFpZpV2Rj6dxGCEx23WfE7VzF/SA8q1lav6Zz3yHGUQcJnkTaOwxnwmKFhdu2ut7fsjqfaeLyACbZQMScoAoY8cBVpV/neOwcXODI24n4/2W27K13aZVROQpBnvwglijJ3cR1cOO7W7/pTM3dkevse1Pbp3W7GYO+yLlF1MzkrxrnfsZVFBadk54GT5pFbMaLa4vcuOl6eZnq6DLagoqcMA9qUCubCjPz0aAvtbilPMZgV4CYqpCC7f1rUtbULIF9Bz3Vk3ypVVmmHN7GYxbvVBMyZH4MP9mQ9V0drRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(6486002)(6916009)(36756003)(6496006)(2906002)(8676002)(66476007)(5660300002)(186003)(66556008)(66946007)(8936002)(86362001)(4326008)(54906003)(83380400001)(1076003)(16526019)(316002)(2616005)(38100700001)(956004)(478600001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q1VsT0diTDlOVDgvbnBWWWhYN2ttWTlDdlkxZXBxTUN0TmdCcTNRTlpUOXVr?=
 =?utf-8?B?SHduQjdqL1N2UW9QV2tOTHRMTnp0OGZGUjBoWC9rMmhnajFqQUJ4Z1RMTWFx?=
 =?utf-8?B?WWFzSStTdldtakY5TlFXbDloRFB2eE5SYWtkQ0dQWmk1WWJxTjRYbzh1enc3?=
 =?utf-8?B?VVF5SWVnaG1icXowQUQ0OHpwQWV4UkZTUC9zQXIzZHRMbkNpckVnMVpUL2U5?=
 =?utf-8?B?VTY4VlhzUmQ5a2ZYSzRlUlZ1WHJISXBaWHg0SUwwcHRLazJ0RGl4K2ZOanl3?=
 =?utf-8?B?V29jRW5wTHR4MlQ0RUh0VFVCb2hjYjA2eU5LRUJzRUxMb2VjTGF1N0hOLzJB?=
 =?utf-8?B?VXJoWWhid1ZycGtpWFlqWEEyTXRTeGhnRzJZTmZGQU5EMmRqS3hXaWR0Vnc0?=
 =?utf-8?B?TXJaRlJ3cFV4aHR6aTZYd29mR1gzUXBIMjh3WDFGYU5jdmtuSGkvV3oyS1FE?=
 =?utf-8?B?VDNBYnB2RVJqcFdLdHd3TE5ucElCZXhvL1l0cEdPM3c4M3hEQjBNY1VuV0Rp?=
 =?utf-8?B?V29vaERla3BxZG8zVjBjekE0SERBeFk4MWRNOTg1SmxtcDZLUXNpdkZTSEFN?=
 =?utf-8?B?WkFNZXAweWJzZ1o2M1MwNnUwbzM4ZUFqQ0VtRzZRTHRUdHNnclQ5bW5OL0k2?=
 =?utf-8?B?NnVFZlNObWVYR2svTmd6VDJ6NlBCL1FVSVp6YWdnRGR4NWQ1blA5aVFTRFJx?=
 =?utf-8?B?bXhKVE91MkxrWjQ1ZEdDeS9LdktOZmhNL3VPSmRqL0lUZm1SZWkvVWdlKy9F?=
 =?utf-8?B?VGFRNnlIK1FlOXpVVGZRL2pqL3ZBeHNFR21XWUlKM09NZ0lQTDQxSlpkRmIw?=
 =?utf-8?B?Q0VGZno1TGo5eTZsR0s3U0pjQURVaHBaM2F0Q3lvekErV2dndUNuOHR3cWNq?=
 =?utf-8?B?MXRlblRKcEVJeTJYdFpQOTZYWGdKL0U5MjA2Sm52RklnSnVLR1JwWDlKRXZs?=
 =?utf-8?B?ZGhxeTArRDFLS041MUd1YkRqSXNrTjVka1dnMVAvVmtyaVhFUFV0blB3S3RJ?=
 =?utf-8?B?QUQwVFhHdkZJWU5qdG03d0NWYms4ZWMzVEdIalFSczVyeWZ3UmdzdGhKQnJI?=
 =?utf-8?B?TWN6MU8yb2dwS3Fub2lyalhkYWNBdEZXcWhPYWgyN2lsQ1AraitWRC9OQitk?=
 =?utf-8?B?N3FIWWtvN0xoaGhVU2JGTVZtdy9pWHFoVnhzSWRrSll0VVBLMVJHTHRnMDVT?=
 =?utf-8?B?YjNhUHZuT3hmMXhxZmlOeXRkQlB6ZFpRaDkzam5QLzhYMlRCK2dhSmtMWUV0?=
 =?utf-8?B?LzUvaFIxRWNJb3Y4WnpBd21ENEcxMm14MDlQb0lheXJRUzA5dFVNazhGRjZl?=
 =?utf-8?B?MTV1WGdjUU0vNTRNMUJsZVZzZExhb1Vzc2dIQTJBblR1K3dVSkNsVmI0SWVl?=
 =?utf-8?B?M2VUeDJRaXl5SkNrWS9ST2tUWVBmMkFCK0ZXcVdNdE40czZncjVGaG5yTk5l?=
 =?utf-8?B?YUIzWm1ra1ZBWEliVVpOTnZkcHdOUjFKU3kwRkdRQ0F6YnlubVVlYm90K1lY?=
 =?utf-8?B?V3ptSmZzTmZpVXN4bE8zQW40eWxqOVZ2Njg4K1ZzWE45YThFY1lnL1Zzd0xU?=
 =?utf-8?B?TUZzL1lFeVJCNFdaZk5welFsQ2ZlK3VKRXE4bHVKMG5FZ0VKMythOG5keXd6?=
 =?utf-8?B?K0ZQL2tZNWhkRE05TFRKUnNvbXBrMEE2enBvTm5BNDFHa3UvQi8yNDRkWDB4?=
 =?utf-8?B?OHFYR1JER2N2ZVhTV2FDaFhBMzNjam15TUlDWnFqVWRWM0tlWWhSQ0NHbzQr?=
 =?utf-8?Q?IVsb68LW7CUXFiamcjTb2iMlsnDkO5sYYwQ78Hf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3066deb2-31d7-462e-e0b4-08d8ede2570b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 09:59:25.3744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D0N4l5alw0u0dW/pmDLBKOHpT3t0FZwXkH3h8hku9VfkQqoPjh83XM61On1ju7SEU5HRWoI5zfK13RIhSKgvGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2633
X-OriginatorOrg: citrix.com

Hello,

The following series introduces a new CPUID/MSR interface for the
xenguest library. Such interface handles both CPUID and MSRs using the
same opaque object, and provides some helpers for the user to peek or
modify such data without exposing the backing type. This is useful for
future development as CPUID and MSRs are closely related, so it makes
handling those much easier if they are inside the same object (ie: a
change to a CPUID bit might expose or hide an MSR).

In this patch series libxl and other in tree users have been switched to
use the new interface, so it shouldn't result in any functional change
from a user point of view.

Note there are still some missing pieces likely. The way to modify CPUID
data is not ideal, as it requires fetching a leaf and modifying it
directly. We might want some kind of interface in order to set specific
CPUID features more easily, but that's to be discussed, and would be
done as a follow up series.

There are two functions kind of related that I've left alone:

int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                          uint32_t *nr_features, uint32_t *featureset);

We might want to rename those to also use the xc_cpu_* prefix at least?
Using xc_cpu_policy_* would be wrong here IMO, as such functions don't
use the newly introduced xc_cpu_policy_t object.

Thanks, Roger.

Roger Pau Monne (21):
  libxl: don't ignore the return value from xc_cpuid_apply_policy
  libs/guest: rename xc_get_cpu_policy_size to xc_cpu_policy_get_size
  libs/guest: introduce xc_cpu_policy_t
  libs/guest: introduce helper to fetch a system cpu policy
  libs/guest: introduce helper to fetch a domain cpu policy
  libs/guest: introduce helper to serialize a cpu policy
  tools: switch existing users of xc_get_{system,domain}_cpu_policy
  libs/guest: introduce a helper to apply a cpu policy to a domain
  libs/guest: allow fetching a specific CPUID leaf from a cpu policy
  libs/guest: allow fetching a specific MSR entry from a cpu policy
  libs/guest: allow updating a cpu policy CPUID data
  libs/guest: allow updating a cpu policy MSR data
  libs/guest: switch users of xc_set_domain_cpu_policy
  libs/guest: introduce helper to check cpu policy compatibility
  libs/guest: obtain a compatible cpu policy from two input ones
  libs/guest: make a cpu policy compatible with older Xen versions
  libs/guest: introduce helper set cpu topology in cpu policy
  libs/guest: rework xc_cpuid_xend_policy
  libs/guest: apply a featureset into a cpu policy
  libs/{light,guest}: implement xc_cpuid_apply_policy in libxl
  libs/guest: (re)move xc_cpu_policy_apply_cpuid

 tools/include/libxl.h               |   4 +-
 tools/include/xen-tools/libs.h      |   5 +
 tools/include/xenctrl.h             | 107 ++--
 tools/libs/guest/Makefile           |   2 +-
 tools/libs/guest/xg_cpuid_x86.c     | 849 +++++++++++++++++++---------
 tools/libs/guest/xg_sr_common_x86.c |  45 +-
 tools/libs/light/libxl_cpuid.c      | 229 +++++++-
 tools/libs/light/libxl_create.c     |   5 +-
 tools/libs/light/libxl_dom.c        |   2 +-
 tools/libs/light/libxl_internal.h   |  32 +-
 tools/libs/light/libxl_nocpuid.c    |   5 +-
 tools/misc/xen-cpuid.c              |  23 +-
 12 files changed, 960 insertions(+), 348 deletions(-)

-- 
2.30.1


