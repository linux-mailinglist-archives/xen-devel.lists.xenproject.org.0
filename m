Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F574D043D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 17:37:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286311.485792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRGLl-0008Rb-B5; Mon, 07 Mar 2022 16:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286311.485792; Mon, 07 Mar 2022 16:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRGLl-0008PZ-7b; Mon, 07 Mar 2022 16:36:45 +0000
Received: by outflank-mailman (input) for mailman id 286311;
 Mon, 07 Mar 2022 16:36:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gfv=TS=citrix.com=prvs=0582ef7ee=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRGLj-0008PS-L8
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 16:36:43 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c41cbb11-9e34-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 17:36:42 +0100 (CET)
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
X-Inumbo-ID: c41cbb11-9e34-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646671002;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xb0kFfnto/nHPlv85TFWuPM5uNwXbNRtvGh0hQ7z3UA=;
  b=cbBsR8rkldmFnAHe2fa+4JQWQZ98vy/h555kStG5LEaTAs013i1zH0Z5
   hdKFKfBvK57JyzkvyojoSBhz9rrHatHeAiVTHoQ8l6CKYZtsMJo52jnzh
   zuLyWJfF4qVAxz6HZ53ucnrlnWq0XsEcMldxTLhjs9miSYT7XW6gcBCkj
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65562399
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zS1uZ630kwvdVIe0xPbD5Txxkn2cJEfYwER7XKvMYLTBsI5bpzIAz
 zZNUW2FbPneMGukL9twOdnipkIAsZfSyoM1TAA6pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUw3oDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1rma2xcVsoOpHu29g+eARlAyxMBoBJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u250QR62PN
 qL1bxJlUkWZXTl0IG4MJ5YZm9qMlGTnUSZX/Qf9Sa0fvDGIkV0ZPKLWGNDYYMCQTMNZ2EORv
 Hvb/n/RCwsfcteYzFKtzHWogePemDLhb6gbHra46/1CjUWawyoYDxh+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasoRo0S9dWVeog52mlyKDZ/gKYDWgsVSNaZZots8pebT430
 l6Emfv5CDopt6eaIVqG7audpz62PSkTLEcBaDUCQA9D5MPsyLzflTqWEIwlSvTsyISoR3egm
 FhmsRTSmZ01of8K7/m6+WzlwA6PjYX0XgMH3SjYCzfNAhxCWKapYImh6F7+5PlGLZqEQlTpg
 EXoi/Ry/8hVU8jTyXXlrPElWejwuq3baGG0bUtHQsF5nwlB7UJPamy5DNtWAE5yevgJdjbyC
 KM4kVMAvcQDVJdGgEIeXm5QNyjI5fW6fTgGfqqNBjarXnSWXFXblByCnWbKgwjQfLEEyMnTw
 6uzf8e2Fmo9Aq961jewTOp1+eZ1mn5jlD2LGsurn0jPPV+iiJm9E+ttDbdzRrphsPPsTPv9q
 b6zyPdmOz0ACbajM0E7AKYYLEwQLGhTOHwFg5c/SwJ3GSI/QDtJI6aImdsJItU594wMz7eg1
 iztCydwlQuk7VWaeFriV5yWQO62NXqJhSlgZnJE0JfB8yVLXLtDG49EL8pnJeR8rbc7pRO2J
 tFcE/i97j10Ym2v0xwWbIXnrZwkcxKuhAmUODGibiR5dJllLzElMPe7Fucz3EHi1haKiPY=
IronPort-HdrOrdr: A9a23:bYOFnKkg/+RmSc6UO2Ae4Pj2ULnpDfPOimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftW7dyRaVxeBZnPDfKljbdREWmdQtt5
 uIH5IObeEYSGIK8foSgzPIYurIouP3iZxA7N22pxwGLXAIV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1F9TrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJrJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUUHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2XackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPW9yV0qp/1WH/ebcHkjaRny9Mws/U42uonVrdUlCvgUlLJd1pAZDyHo/I6M0k9
 gsfJ4Y0Y2mdfVmHp6VNN1xMfdfNVa9My4kEFjiV2gPR5t3ck4klfbMkcAIDaeRCdg18Kc=
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="65562399"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yt1qmLdI7qwwGvoesuOHaDtVVWJ+hAdaSlcVPwUolGbuuEtGFeuopZ6IEXQJC1OWhYZ5dqw6XneMkm8ncfTE+S+VQLxPBERVU4ZfvPH+hbmdqHXID6oGByxnKh29bLQTray2hDvvBprPeYPU798biqpmSlStLZqW6V+kzcP2dxpFy3myrGitzEn8WTYngSekRDpt3ZQFHmOk4UErzHJGXJS0yc7JDuGJzBH+354ZynBVsWlYF0yOtWW3ZQ5fE6UMQXd/jdAk9F7gw1jGvGJXlr1/KPszSq7k3M8II38TWtUHF5fTRNlqx04etXfOOENtJIcHHdG4CgEZ5naZSH+OCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3xROm6DFkdCKIDAqiL7E57MvhGKHu1iWupBBogtGJY=;
 b=gxA08lQCSCcm1UB2DHIPHJZG4mCKqLx8qvaXZzID9AF51LNio+OZJZF7TR2dp50rdMsnq87Z7OfHtA9hkpdcWsJcaep/6tzfBFA+C3BmhhkL8nP2iMdrPOWUs8t8qKyNp7JjSOWTUt3ij6SbtN50xlV93Ybkz3ftSUvnUyOIL1+cqODNFntal68aP3DTu6L74DoTumQedtKUHIG6I5lI7QeZ495f76YkUbPHk/jQT+U5ciGRxAVAx7gnvFBjg1AxJ9oDTZFHOwACl7Mvf3Fe56DYPWmxTPoMnNn5wMjZ7GkrzQbvm9Tbe2MlC/Xxkbny4Dv7r9zwyU+Tec+LPjScoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3xROm6DFkdCKIDAqiL7E57MvhGKHu1iWupBBogtGJY=;
 b=Ehz2dkrTAu5EqSuZguCohO1DhZSm0Pngn203euOP7WJqPY3EcKvZdYSnj06EVjBRR6jAtnSAZqDv4IklO+uPp4eTTsVVily8ZK27SpGV8QCE87NofXuH/c6jczOyfXJRBJmzqdssEFgttl9B+n43CiPSjKnApg8e65x0k1AW5SI=
Date: Mon, 7 Mar 2022 17:36:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] livepatch: set -f{function,data}-sections compiler
 option
Message-ID: <YiY0jMinvZf8sBaK@Air-de-Roger>
References: <20220307155558.72876-1-roger.pau@citrix.com>
 <984284e3-c423-16ec-5ad7-c4211ebddb70@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <984284e3-c423-16ec-5ad7-c4211ebddb70@suse.com>
X-ClientProxiedBy: LO4P123CA0182.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e1aa21d-9c82-45fc-84b9-08da0058a448
X-MS-TrafficTypeDiagnostic: MWHPR03MB2589:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB25892E6ACC11CA54065901798F089@MWHPR03MB2589.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N1/FG9U3AkvCNlcMCIOOrffTikGMEQ0Gi4lKG8nhjF9fm/6avIm9w/hJDGBKLLQYPSdzfKdDWOSCQU6QW8r16j99zBd4G8ADejx87LIH35abRsHlSXRQzLhrtkDUOz31HZ7wWZLyJ2NXmg0LrXG9Y2kPdbvzb6R4FlBSh20WBBT9/KtYCzJJ7JoFBeJrlxNGXz/82Zct2JcfZYd7JmzZx7s3I4+4RFHobjfyhi/UGyigezwgcXTTQm7iVYWKOxddtAAWdeINQ4Ey6+WLBj1wHVuvPHjNKcddGc8E8EehPopjZcTTQtykfCOKRBTa0CaGEtsEC0EPCDUqPpwolMl9AM89qbeUE1CcXKDQ+XR+eS362Hj6H0FlBczEDLK74VT3Pw8qqpcNA8On3TxRsnS4X3tt+SghMUTkvEiGxMvg5SsRPhZNjlY+EO5B1sMNNhyOQFquXAY0P2XrPiLsBlkQeTETLvQ8AfEZJa7B4C6qmhXt8QXorLWXE9DYAsEWZnO725TQnRxYObWJruZM3V0ypitOLlJgX0vBscP3VOZtbMdcHzuCaiThi/Iv7czG4CUwV1ksI6oE1zWjHeXX5XKpmitGbr/HjPWvSA/y0BWWb5UvkgB7Tp/2zDEJYfKADELaWxA6fNS9ELE5yY+50mPB0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66556008)(33716001)(186003)(66476007)(85182001)(4326008)(8676002)(26005)(66946007)(8936002)(316002)(508600001)(6486002)(54906003)(6916009)(5660300002)(53546011)(6506007)(86362001)(9686003)(6512007)(6666004)(82960400001)(2906002)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWdyVm5VbnU3SXJLbFdiUVFsY0ZzeXl6ZVpMMDdTRVZQTFluOUE2cWExeG5m?=
 =?utf-8?B?RW1sZTQ5clBseThMVlNhOHQwTkhnV3YxMDhpUkk3ZCtYNFRnNmlqZjhBaDZF?=
 =?utf-8?B?NWg5Y0NtOFJxVkpwQ3Q2eVZoUFZtcHAzYmJkMFFNUUozYnVkdExjamlOY0pp?=
 =?utf-8?B?Z1NPMWJqQTE2V3FTbXVEbnRjYUppdVlSZDBFMWN0TW0yQ1JENXVWcEtzWWxK?=
 =?utf-8?B?MnVzNXUvZkFycWxVVkl4TmpjTnVkNDRua3VmU1NuRmZUVXBWVVVtdEhEdVVi?=
 =?utf-8?B?R3JyT0ZNbk9hYzlBaDNidFF2V0RWaDlYd1JPZTlxcHlsa3h4Y0s4QkVzbHBm?=
 =?utf-8?B?N3VyUTJCTjhBU21KZCtHTnFzbVBROCtIdHlmY1ptaURzYXBwdlovYWVIUHJU?=
 =?utf-8?B?NXgrOWU1ZDc0MG0yRUxsd2N5NVVBeE43SzR6Nnp6RzU1b2taSG1CekVDSUNN?=
 =?utf-8?B?dVV1RzFxVkN1NU8wUGZZYXZ1c3NEUzk3ZXJGTElhOU1SUFZacGNuWjZLa0Iz?=
 =?utf-8?B?Z2hWa2ZKTGp6QytVc0ZaVkhnWURqcHZheFRPeXd3cm80d3ZqREpvcE1yb3Fm?=
 =?utf-8?B?dFJnNnZVRndabWk1ZUlYSXk1SlI0MnZ2cWxFdnRMaFA2ZFpZaFVYYlEwMDJJ?=
 =?utf-8?B?eUI5bHFwM1JxTG1JQjBHZmFIU1dOS2xGdGQvYTJnVm1EOXFheUpNTUVaTldj?=
 =?utf-8?B?dlBUcGFWOWRjdEcvVlpPSDVWdnpkbjJ5MzZ5b2pzY3JGbnZnV3J6WVFZVkZh?=
 =?utf-8?B?K1NWQjNtMXFnako4NWEwOXAzTXFib3hPVmVLQUhUb2pQdndMRUY2K3J0R1R2?=
 =?utf-8?B?bjRwR2RjaFRGN3ZkL1ZvYjJnNk9OV05KVzZzcHJpUFp3dWsxWk5kSTFRWk5Q?=
 =?utf-8?B?WDFaMjF2RGNqTVJLQ1FHRkYxdXV2RkhpcUh5NTVldUl5cHZZYnlhbThxa3hS?=
 =?utf-8?B?S0wyODJ2a0s4SWtUWXBiUzlBM0U0YzVKUnZjTkVHc3lXNGRkUnQzcm4xQno1?=
 =?utf-8?B?Vys5OE0xeGR3U2tnVldvcFBGS1pRcEM5c2tuOThRTFpuU0E5eGFXdjRFRHY4?=
 =?utf-8?B?eXNxUUphNzFVODAvOEFOOVBlSVRTUHl2WEFSWEV1bFVLaVZLcXcva1VYbWdr?=
 =?utf-8?B?ZHZ5bHNJRDdyNzhQSFhQMnRhQ1FKQkYyamVvOVdBY1MwRTZRT2FPa2FxT3I2?=
 =?utf-8?B?dXd1OGFQcUZtMHplNVZNeTZ3R081SEhUcG9zd3BDY0FQMmhmZTdjNENiMnFL?=
 =?utf-8?B?VkRwejFoWWRidGNacjNrNmlXWVQvWlcvQVA3TS84Qm9wbE1jREJ0b3pDcGl2?=
 =?utf-8?B?MzFXK1hYaDd5Q2RvaUdKSTFaTGpheFRRUXFiWFhXMlVETys4ODZlRlQ3eHd2?=
 =?utf-8?B?cGNxaFo3bFNoWS9BbjVSaTZLczRINm5nQU5HajFTb2VNZmtTMUNJSHJxR3dv?=
 =?utf-8?B?UDU2Q0E0aGUyUUdnUG1BS1FMZnhSQzVUSm8wTDFhQ1ZFMTJ0T2pNRVhmSWNp?=
 =?utf-8?B?S1gwbCtkT3F1azJHb2F2RVRFQ1ZuT2pnMkM2NEwrSlA4SCswWVA2UGdvWWRC?=
 =?utf-8?B?SmpobEdxa3NuMkJkQU12Mml0dFlCUU1TTVRteVNZYnlkS3ZYUFZuTEZEYzJa?=
 =?utf-8?B?Wk9tVk9nT3g5dGI5dzd1QXk0Z3hBemVSQXo5L0ttN0FCdEZBaDByVThCVmUz?=
 =?utf-8?B?OUIrZktjdFpjRnVZejJJd1NSZmJCSHgxcWtVMnplMVIyd2RYN3VqYW4yMnM1?=
 =?utf-8?B?blRrOUpPbkh4dVNxL2RmZTRKSnBxZ21wYitCVlhhL2pkYzZCOVVWa0tvdnpH?=
 =?utf-8?B?QXEvOUxnREpnZFNVQmlrb1lKSEo3TWlINHQvTCtXUDZYT2pYdXBoRm5tQnNQ?=
 =?utf-8?B?UmljODBGU0pPM3o3RXFHa0ZnZ3FvR0gvazRSMzZKcjJSTGNrcEpuRWpqczUy?=
 =?utf-8?B?Q3Z1Ri9OWS9pQlNIZVpQcy9aRXk3OUlWRXl0TUllcHJrVWI1Z0xadzluSWRF?=
 =?utf-8?B?aUd0WHlqdXZiTXptRjB6THd3ZTBzYTR3YWFBeHR1SjlWOEZ1dzVxTXhhY3J3?=
 =?utf-8?B?RzJYNHYxVW9HMHFQZmtQRmJlUnEzeURJTWZSTUFENzQ1Tmx1NTJnZVZCbkhw?=
 =?utf-8?B?Q0g3VjdYcXVVZnM1V3JNS0tuK1FhZ1VmUWllN1ZXMldNNHNvOUJ4aFgzNzBa?=
 =?utf-8?Q?ReprZSK4/+k4ZwC6HBy9rEE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1aa21d-9c82-45fc-84b9-08da0058a448
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:36:34.1402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CB3CayHQi/QH6Mc9pkm8HdsmRsqomGZ7l2WfABCdqZVXfgMwrnEk5abHCTTfdJ+oSrD4tfyTFWy0somMqmVgXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2589
X-OriginatorOrg: citrix.com

On Mon, Mar 07, 2022 at 05:28:20PM +0100, Jan Beulich wrote:
> On 07.03.2022 16:55, Roger Pau Monne wrote:
> > If livepatching support is enabled build the hypervisor with
> > -f{function,data}-sections compiler options, which is required by the
> > livepatching tools to detect changes and create livepatches.
> > 
> > This shouldn't result in any functional change on the hypervisor
> > binary image, but does however require some changes in the linker
> > script in order to handle that each function and data item will now be
> > placed into its own section in object files. As a result add catch-all
> > for .text, .data and .bss in order to merge each individual item
> > section into the final image.
> > 
> > The main difference will be that .text.startup will end up being part
> > of .text rather than .init, and thus won't be freed. .text.exit will
> > also be part of .text rather than dropped. Overall this could make the
> > image bigger, and package some .text code in a sub-optimal way.
> > 
> > Note that placement of the sections inside of .text is also slightly
> > adjusted to be more similar to the position found in the default GNU
> > ld linker script. This requires having a separate section for the
> > header in order to place it at the begging of the output image,
> > followed with the unlikely and related sections, and finally the main
> > .text section.
> > 
> > On Arm the .data.read_mostly needs to be moved ahead of the .data
> > section like it's already done on x86, and the alignment needs to be
> > set to PAGE_SIZE so it doesn't end up being placed at the tail of a
> > read-only page from the previous section. While there move the
> > alignment of the .data section ahead of the section declaration, like
> > it's done for other sections.
> > 
> > The benefit of having CONFIG_LIVEPATCH enable those compiler option
> > is that the livepatch build tools no longer need to fiddle with the
> > build system in order to enable them. Note the current livepatch tools
> > are broken after the recent build changes due to the way they
> > attempt to set  -f{function,data}-sections.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> The x86 part of this looks fine to me, just one other remark:
> 
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -350,10 +350,14 @@ source "common/sched/Kconfig"
> >  config CRYPTO
> >  	bool
> >  
> > +config CC_SPLIT_SECTIONS
> > +	bool
> 
> I think this wants to live higher up in the file, perhaps between
> ALTERNATIVE_CALL and HAS_ALTERNATIVE. (CRYPTO, as seen in context
> here, imo also would better live higher up.) Or alternatively it may
> want to move to xen/Kconfig, next to CC_HAS_VISIBILITY_ATTRIBUTE.

I was tempted to place it in xen/Kconfig. The logic for the current
suggested placement is to be closer to it's current only user
(LIVEPATCH), but I'm not opposed to moving it somewhere else if
there's consensus.

Thanks, Roger.

