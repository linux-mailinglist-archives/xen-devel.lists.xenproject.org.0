Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B72488D7583
	for <lists+xen-devel@lfdr.de>; Sun,  2 Jun 2024 15:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734478.1140610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDkqQ-0000Fp-HN; Sun, 02 Jun 2024 13:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734478.1140610; Sun, 02 Jun 2024 13:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDkqQ-0000Cg-En; Sun, 02 Jun 2024 13:01:54 +0000
Received: by outflank-mailman (input) for mailman id 734478;
 Sun, 02 Jun 2024 13:01:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bftg=NE=samsung.com=nj.shetty@srs-se1.protection.inumbo.net>)
 id 1sDkqN-0000Ca-HR
 for xen-devel@lists.xenproject.org; Sun, 02 Jun 2024 13:01:52 +0000
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4222c35b-20e0-11ef-b4bb-af5377834399;
 Sun, 02 Jun 2024 15:01:46 +0200 (CEST)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240602130141epoutp04ef44592810056b03551e42c3bcf5e24b~VMYn1wsGl2490224902epoutp04M
 for <xen-devel@lists.xenproject.org>; Sun,  2 Jun 2024 13:01:41 +0000 (GMT)
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20240602130140epcas5p25c2d695eda36cf366a0a4a4a01c4d72e~VMYnNGZ7q1672216722epcas5p2-;
 Sun,  2 Jun 2024 13:01:40 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.183]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4VscSM49VPz4x9Ps; Sun,  2 Jun
 2024 13:01:39 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 1B.21.08853.33D6C566; Sun,  2 Jun 2024 22:01:39 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20240531140203epcas5p1fed913b6729b684e0916dfd62787be13~Ul6w9HJG72010620106epcas5p1W;
 Fri, 31 May 2024 14:02:03 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240531140203epsmtrp1d3e14a45850cff935f0c63202c392ca7~Ul6w8M3W40787407874epsmtrp1N;
 Fri, 31 May 2024 14:02:03 +0000 (GMT)
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 35.7D.18846.B58D9566; Fri, 31 May 2024 23:02:03 +0900 (KST)
Received: from nj.shetty?samsung.com (unknown [107.99.41.245]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240531140201epsmtip127bef841828dca583bedc8f707b5bfe0~Ul6uqPXcn2218222182epsmtip19;
 Fri, 31 May 2024 14:02:01 +0000 (GMT)
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
X-Inumbo-ID: 4222c35b-20e0-11ef-b4bb-af5377834399
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240602130141epoutp04ef44592810056b03551e42c3bcf5e24b~VMYn1wsGl2490224902epoutp04M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1717333301;
	bh=rHCZCFCbAOCe+0obDysUSNu4wORZPi6NKPSAyIbFDII=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SKRqhHmfBSPkcAIqZvms8GLmHDo2PwGcOTDGLPbSti0I/AVPzEX3DbCyTMq5p0VfY
	 G3MlwRC4bK5x8QDJZbX4sDElfRe+jHDX+V3f+0TZ0rGxg9GMBwd4Pau0mHmFtxPILu
	 hnmwyKfX+W6O1XXAzG1BwU2eozdlCtGVS0illt5w=
X-AuditID: b6c32a44-d67ff70000002295-79-665c6d33bd5b
Date: Fri, 31 May 2024 13:55:01 +0000
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, Richard Weinberger <richard@nod.at>, Anton
	Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg
	<johannes@sipsolutions.net>, Josef Bacik <josef@toxicpanda.com>, Ilya
	Dryomov <idryomov@gmail.com>, Dongsheng Yang <dongsheng.yang@easystack.cn>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	nbd@other.debian.org, ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org, Bart Van Assche
	<bvanassche@acm.org>
Subject: Re: [PATCH 13/14] block: remove unused queue limits API
Message-ID: <20240531135501.c3yes3jbg7dl3g5w@nj.shetty@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20240531074837.1648501-14-hch@lst.de>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf1RTZRg+371328UaXSYcPyA8eD1WQsAWY1xIFI8cuxzMFvpHPw+N7bIR
	+9U2JLEQTKoxCQjiwIIpVCJoioAIEnCCgwocwYJE6ICa48gPicEy6EirwYbH/573ed/nfb/n
	e78PR3lzbD88VW1gdGqJkmRvwJq7t78YEq56L4VfXBhAPSy7iFFnxwvYVKntH5SyjX6NUKWW
	YUDVnu1BqDuWL9jUQv0iRq3cE1DtY8GUaaSFTeXX7aNqrjkQ6vHkjwhV3PoQUGWD37GopaZi
	JNaLHhpOoB/Unkbp2eJCQOdeeoZuNY9z6KEb6XTj90fpbtswRreNZrPpUctH9MLkGEb/9vdn
	KF2Q34zRhY0XWbS9YbP4uXfSdigYiYzRBTJqqUaWqpbHkAkHkvYkRYj4ghBBFBVJBqolKiaG
	jNsnDtmbqnRaJAMPSZTpTkos0evJsJ07dJp0AxOo0OgNMSSjlSm1Qm2oXqLSp6vloWrGEC3g
	81+JcBZ+kKa4XDoFtEbWx01/5nGyQQeWBzxwSAjhlyvL7DywAecRbQA2LPZwXMEigPMDd8GT
	4NJVK7Iu+aOxAnElWgHsnx3CXIEdwKqiCbBahRHb4LlyCysP4DibCIb9/+GrtDdBwsmZG2td
	UeIuBud+6ljrupGIhY9Kbq1pucQeONE6jbqwF+wtt2KrfTyIcDifd3hVCwkbDvN/nuK4ThQH
	/6276ja0Ec5ca3LzfnC64HM3zoC1JWfYLvFxAM0jZuBK7IK5fQVrw1BCAevn7G4+AH7Tdx5x
	8Z4w//G6fS5ssazjrfDchVNsF/aFt5Zy3JiG1ok+9xWdB3B2YBgtBJvNTxkyPzXPhaOh0XaM
	ZXYaRQl/WOPAXXA7vHAl7BRg1QFfRqtXyRlphFagZjKerFmqUTWAtXcfFNcCbp90hHYBBAdd
	AOIo6c39KuvdFB5XJjmcyeg0Sbp0JaPvAhHOBRWhfj5SjfPjqA1JAmEUXygSiYRR4SIBuYk7
	m1sp4xFyiYFJYxgto1vXIbiHXzbiFfns7jSrDakcXzkoDYqt3zL1a8eRm1s4C6I7jClr28jr
	XP83tZ1hh2bzOMZXl+vGgnrt3sKZxF3enUm+Ro71jUd6n5qdwX9JM+9Z7NU+g4tG0w9bPzkx
	ai17O96abD16OqJNMcWoxidr24ubxcrMhIrfddoMqV6crJtJmV8uqRT7H7Dw9zvOvHAzsQo+
	32Lq2XSlyDjQzSn7BXn/2GAv6Xm/IUv4rcCRfV22d8kUudumO1jd451TwXopueStFc/5+M7+
	/ZdfSwF4dahg4cPpHMeRsZL4cB56XK6hh5GeyHL5g1hWP2uhShVwn/fpbVWDyaPmut0+Fn2y
	3X/y5aBEEtMrJIIgVKeX/A8paUBugAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsWy7bCSnG70jcg0g1vHTS3ezNjIYrH6bj+b
	xbQPP5ktPtycxGQxbd4VRouVq48yWdyf185m8XHDJxaLPw8NLfbe0rbovr6DzaJ3lY/F8uP/
	mCx+P13LZDF55xtGixnnF7NafN8ymclB0OPyFW+P5yuXMXu8njyB0aN1K7fHzll32T0uny31
	2Lyk3uPwhyssHrtvNrB53JxX6PHx6S0Wj6vfmpk9+nu3sXhM2LyR1ePzJrkA/igum5TUnMyy
	1CJ9uwSujD/7bQt2M1V8enaMrYGxi6mLkZNDQsBE4tHmOUA2F4eQwHZGiSnbN7FDJCQllv09
	wgxhC0us/PecHaLoI6PEnJPnWUESLAKqEmtmzgOyOTjYBLQlTv/nAAmLCChJPH11lhGknlng
	GYtE39JLjCAJYQEHia9TroHZvALOEvd2vgRbICQQJdE96SQTRFxQ4uTMJywgNrOAmcS8zQ+Z
	QeYzC0hLLP/HAWJyChhLvO+qnMAoMAtJwywkDbMQGhYwMq9iFE0tKM5Nz00uMNQrTswtLs1L
	10vOz93ECI5LraAdjMvW/9U7xMjEwXiIUYKDWUmE91d6RJoQb0piZVVqUX58UWlOavEhRmkO
	FiVxXuWczhQhgfTEktTs1NSC1CKYLBMHp1QDU92Ng1vsGPLZ9/Q3P6mtF/45JfwVp+XRWxsW
	apxjUN5zSTn9x97PQjtt5hWJVNTdbBAvnpmak8O3T19A1IH3/3uhr9PzeZwuyp+6p5068b/2
	Hb7Ddlpxl3Z8eJcsea0gdc5h+U3zNBmru1/vKYx7nXojdu2t/6/CL3/+I/p8qtLl3847l/5I
	+hpaaCMbIiBwtjV3+znPnq+mtwT3cV5/6Nhav/KTjWQiry5nqdvE889vHWljnrvFWmF3widZ
	Jh5PsaeyPenOihs/rz4wo6X+69O0LY+uO5zK4zue1bpstc3vov3FFnpScyVmdtadnPWge7ag
	6hZ7nlV37kiItZ5dy7z6pSATKw+vXcq5aeV3NZVYijMSDbWYi4oTAW59SSg6AwAA
X-CMS-MailID: 20240531140203epcas5p1fed913b6729b684e0916dfd62787be13
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----4kURd6qQA_jt7Hem8gQqXiu1-FVD8qSeML2_RvQot6TDP4ZY=_48cac_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240531140203epcas5p1fed913b6729b684e0916dfd62787be13
References: <20240531074837.1648501-1-hch@lst.de>
	<20240531074837.1648501-14-hch@lst.de>
	<CGME20240531140203epcas5p1fed913b6729b684e0916dfd62787be13@epcas5p1.samsung.com>

------4kURd6qQA_jt7Hem8gQqXiu1-FVD8qSeML2_RvQot6TDP4ZY=_48cac_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On 31/05/24 09:48AM, Christoph Hellwig wrote:
>Remove all APIs that are unused now that sd and sr have been converted
>to the atomic queue limits API.
>
>Signed-off-by: Christoph Hellwig <hch@lst.de>
>Reviewed-by: Bart Van Assche <bvanassche@acm.org>
>---
Reviewed-by: Nitesh Shetty <nj.shetty@samsung.com>

------4kURd6qQA_jt7Hem8gQqXiu1-FVD8qSeML2_RvQot6TDP4ZY=_48cac_
Content-Type: text/plain; charset="utf-8"


------4kURd6qQA_jt7Hem8gQqXiu1-FVD8qSeML2_RvQot6TDP4ZY=_48cac_--

