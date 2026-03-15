Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDxVAN3ntmmRKQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 15 Mar 2026 18:09:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 322E32919CD
	for <lists+xen-devel@lfdr.de>; Sun, 15 Mar 2026 18:09:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255256.1550359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w1oww-0004wE-BS; Sun, 15 Mar 2026 17:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255256.1550359; Sun, 15 Mar 2026 17:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w1oww-0004tE-55; Sun, 15 Mar 2026 17:08:22 +0000
Received: by outflank-mailman (input) for mailman id 1255256;
 Sun, 15 Mar 2026 17:08:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hpBg=BP=oss.qualcomm.com=vijayanand.jitta@srs-se1.protection.inumbo.net>)
 id 1w1owu-0004t7-7L
 for xen-devel@lists.xenproject.org; Sun, 15 Mar 2026 17:08:20 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f054677-2091-11f1-b164-2bf370ae4941;
 Sun, 15 Mar 2026 18:08:17 +0100 (CET)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62F6TFuS1106578
 for <xen-devel@lists.xenproject.org>; Sun, 15 Mar 2026 17:08:16 GMT
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw04235dw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 15 Mar 2026 17:08:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2aec8d85199so19160875ad.0
 for <xen-devel@lists.xenproject.org>; Sun, 15 Mar 2026 10:08:15 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2aece56c393sm78973035ad.17.2026.03.15.10.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2026 10:08:13 -0700 (PDT)
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
X-Inumbo-ID: 8f054677-2091-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=thJzkvW9uOc7ANNbvpiJj/
	JZWbmF086MfCsEV/kb1PM=; b=Amnfi7m0rPnXRh+qwWteFyKXFGRtWdWJPLHVgi
	3X3StFtnBtdGAP3Vk7NREEwWfihYkgnwEA7QAWFi46mPrZp9eA2/lUA8HlJX9TxU
	lq7Id5YO7BlZHa7YPPEqihviIVmDqJV8GytlpdfCGy41/Gfmd22lP3iZ0sd/ADBS
	9uenNtpdCqDzntK2Ia1c0NA1NyblfMJ8+sTAvMGgpjkVDlvZv/IO76Wsgwo7NZRu
	7bAm9wy+Qx/3iT8JyCoPTl3FkAvGAvMMQiVUlHw5/gomHywQN/V2INbXM5FWDeUC
	eX4WYAy3dJqalyon/Ax8+4aiFxj2d6Bmr6g1IQfy3Kpvw6qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773594495; x=1774199295; darn=lists.xenproject.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=thJzkvW9uOc7ANNbvpiJj/JZWbmF086MfCsEV/kb1PM=;
        b=VqUlM+lX5yvHBQos8dtApwtE4+GmCPbJPiWFcGQzMuxb3E2D38Q9vez8kgAgPW62m9
         +4nR0Oda5tW10wpe9aMUHPyrCIznzPkZSlZ8Sp6sTCeGWDBi0A+gIzxpCw9ipv4l7pvQ
         ao1YlgSvnVRXWJR4VL1MyN5+8rGLZI5EO5TvZIAIbK8LP+M7J09LIKPHDR35GWNLoBv3
         RZpiIQT1mXdrY7apU1vYg31FFJbaoYBhhSE2/60o7Fz/p5KPz4GU6bFiDzg3irHxW6S5
         YR6ZhCUw5csrxgB8ov5/0904Qf+ZSHsq9inPMWy7QGUr+5I8xNtcERE1Fano3u0lHV8N
         D0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773594495; x=1774199295;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thJzkvW9uOc7ANNbvpiJj/JZWbmF086MfCsEV/kb1PM=;
        b=b25NJUgRWEpavm6Hlhxgrzk6CY7RtG76zSVMuolhDLJ3qQPqBHB2mnnGawoJU/FanN
         m8YQLXoNudGK1lrV85TM3IUBzp0zxbjtF0KlLWmL/ctunVkzltHDKP6Lssslg3+EKeps
         BSwWjewtcz5TRDyWuOo5J+O3IMZIVOt2o9gBuA9H46yQqLkKpBKW3gbFCNGr+udC02bL
         53ZTcbi5tOJoD4tvpivPX4ZlSfuahkopAYd8JOR5ftrX2wOR7IfWp7QHbYBqpQ/GnsVI
         K4SJB8XS0qmw5r3867ruR0wy31226yKgiUBVM+5PK22fI4JeSOfrnNkAb/KJSs6qA7Ad
         5UWg==
X-Forwarded-Encrypted: i=1; AJvYcCVUeoqWiq6rUGm1tZuS6gN07fxQ/sQqOjq3Swv8An01mdA3U4lo47eTQdECE7ygTOjW9807EEcYQWs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrZSnh2Rs3lNBLXImyF/PARNcLPerSpfNyuicviDTinAvvSoCs
	VpL69s15hHxJaxIzPBMY4U5KcpJ+vlaozj8Xrihm4CxuaM3Jpgm856Hj1WST8EIJIWCGPbBO2LT
	0/CKN/6KnLTQ8sISRdQnPcsu+akj2AtF4n8Z5a/SR0hWJIg0PV6dOCAaTNRx1LKVNe/m6mA==
X-Gm-Gg: ATEYQzyvSIRranRt1zca/WqptubG0v8BiVc9rHS9CeAJQzEQG1MxsXEIMm0QLJeEIjD
	1s6h+YLp9Bd36MCrbju4i9VYvIH1WD2LbEHkGc31o+bqhVgksoPHJiJ+1EJDenZkbeGoqHghDwa
	e+PYuEIFaTjYYK8BI5wZ2t4UKtlg5Gp20hqsxDBhwPaMR+WsYcn9MkScPgjRDLSyVBz08MGhesT
	OtT5GutugjSrV73UAVwiWT/kn2MjsR8wfGdN4+9r9dNHkIMDCXzG5Ty8DBIylnms24wDCbOIlJ+
	zsz2g6gX4uJiOom7Li9OJN7aSCjUn4rayRrrq7JTwxAdIWnD/1Lm9wW8dBSCGauljma7/8oAc7y
	jqJn4kkkDwyRaQMj41n5wua+3KNzOGWMyia9wEmJRJLJQuuuCSWD+75pv
X-Received: by 2002:a17:903:1b68:b0:2b0:5306:5f20 with SMTP id d9443c01a7336-2b0530674cemr17093155ad.18.1773594494908;
        Sun, 15 Mar 2026 10:08:14 -0700 (PDT)
X-Received: by 2002:a17:903:1b68:b0:2b0:5306:5f20 with SMTP id d9443c01a7336-2b0530674cemr17092635ad.18.1773594494295;
        Sun, 15 Mar 2026 10:08:14 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Sun, 15 Mar 2026 22:37:43 +0530
Subject: [PATCH v2] of/iommu: support multiple iommu-map entries per input
 ID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-iommu_multi_map-v2-1-51b98cb79331@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAF7ntmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDY0NT3cz83NzS+NzSnJLM+NzEAl2LZMskcwsTS4PE5FQloK6CotS0zAq
 widGxtbUA+zWOvmEAAAA=
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Marc Zyngier <maz@kernel.org>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        linux-arm-msm@vger.kernel.org,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773594484; l=11143;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=SoPi6EZR36E7NYzW7ROn+VXlsuvtsMeKrxme0hCMUPk=;
 b=xJyzCudAB+iilqpGW9jjZhvmYkMUYUWeUOH6tnG/x8TC/YIZ05rxJXUEds5TaDqR7UknSPvcR
 OdGCrfnovcbBbST29yWlUwSy457WFOvR6FoxeZZsHPtfMKGP1PCqCGz
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE1MDEzNSBTYWx0ZWRfX3fEKTBVtNwpT
 +26OC0b5Tw6XsDtWAhvbtqWOVjNWj6dqqbzJ7hQEuNtHs6/btWxRqvGy/U0/pb82tEsRnbOsvWU
 9gifU9WJSVplij/l/xwXNLzx34yxMYOoReAmd0iZJhYLbenFPfhVW8O33rAUvUZszLSamqUfJlG
 4hNQ021EHsg3AJ7ZIV6Km7B7wc76wEZ+uJ3Z3vGrLJBjdJqvvRVQ5j0Abih2oWx9p2jIe0aeS9+
 v+hhORIKqG2UKFQmIlta+J58MvzW6vZcBkNQG9OjZH2pSSoFhjJy9H3DzCc0/IqNC0q826OMZY4
 Nc0gCINTO7ZZ7lEpXFtExlzy5N2Ir49UG2xqFkHb4t8nkkfZNpI/skxbOp38Ty3a2tCE5bZesN2
 2fJXowzJtlcAgkJ9yk7Rq2hwVU1kOjerPuxtScX1se9T96nPQvKt/eHmkz+xbys8L1t7Dbd/WPM
 OaPeXUZ0LGSj/Cg1uNg==
X-Proofpoint-GUID: EqZjFfSRRNYEbVfiDr_xlHalRxNLFdG5
X-Authority-Analysis: v=2.4 cv=SJJPlevH c=1 sm=1 tr=0 ts=69b6e780 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=kIQn9afXKFv-EtykHQIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: EqZjFfSRRNYEbVfiDr_xlHalRxNLFdG5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-15_06,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603150135
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:maz@kernel.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:vijayanand.jitta@oss.qualcomm.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,iommu_spec.np:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_TO(0.00)[8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 322E32919CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When multiple mappings are present for an input ID, linux matches
just the first one. There is a usecase [1] where all the mappings
are to be maintained in parallel for an iommu-map entry of a same
input id.

Add a next_offset iterator parameter to of_map_iommu_id() and
refactor of_map_id() internals into a static helper to carry it.
Update of_iommu_configure_dev_id() to loop over all matching
entries to support this case. All other callers pass NULL and
are unaffected.

[1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/

Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
On Qualcomm kaanapali, the VPU hardware has multiple internal blocks
that generate different stream IDs for the same input ID. The device
tree encodes them as separate iommu-map entries sharing the same input
ID:

  iommu-map = <0x100 &apps_smmu 0x1940 0x1>,
              <0x100 &apps_smmu 0x1a20 0x1>, ...

This requires multiple iommu-map entries per device.
of_iommu_configure_dev_id() currently stops at the first match,
so only one stream ID gets registered with the IOMMU.

The v1 series [1] addressed this with a callback threaded through
of_map_id().

This patch uses a next_offset iterator on of_map_iommu_id() instead,
keeping of_map_id() unchanged, and updates of_iommu_configure_dev_id()
to loop over all matching entries.

This patch also depends on iommu-cells series [4].

Changes since v1:
      - Split patches 2/7 [2] and 3/7 [3] out into this standalone series.
      - Dropped the callback (of_map_id_cb / of_map_id_arg) entirely.
      - Replaced with a next_offset iterator on of_map_iommu_id()
    	only; of_map_id() public API is unchanged.
      - of_iommu_configure_dev_id() now loops explicitly; no
        bus-type heuristic (dev_is_platform()) needed.

[1] https://lore.kernel.org/all/20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260126-kaanapali-iris-v1-2-e2646246bfc1@oss.qualcomm.com/
[3] https://lore.kernel.org/all/20260126-kaanapali-iris-v1-3-e2646246bfc1@oss.qualcomm.com/
[4] https://lore.kernel.org/all/ce25b963-0e8e-4411-a406-7b466eadb1f9@oss.qualcomm.com/

Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
 drivers/iommu/of_iommu.c              | 20 +++++++----
 drivers/of/base.c                     | 65 ++++++++++++++++++++++++++++++-----
 drivers/pci/controller/dwc/pci-imx6.c |  2 +-
 drivers/pci/controller/pcie-apple.c   |  2 +-
 drivers/xen/grant-dma-ops.c           |  2 +-
 include/linux/of.h                    |  4 +--
 6 files changed, 75 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index a18bb60f6f3d..947eedd9a88b 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -46,14 +46,22 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
 				     const u32 *id)
 {
 	struct of_phandle_args iommu_spec = {};
-	int err;
+	int offset = 0, err;
+	bool found = false;
 
-	err = of_map_iommu_id(master_np, *id, &iommu_spec);
-	if (err)
-		return err;
+	while (!(err = of_map_iommu_id(master_np, *id, &iommu_spec, &offset))) {
+		err = of_iommu_xlate(dev, &iommu_spec);
+		of_node_put(iommu_spec.np);
+		iommu_spec.np = NULL;
+		if (err)
+			return err;
+		found = true;
+	}
+
+	/* -ENODEV means all entries exhausted; success if at least one was processed */
+	if (err == -ENODEV && found)
+		return 0;
 
-	err = of_iommu_xlate(dev, &iommu_spec);
-	of_node_put(iommu_spec.np);
 	return err;
 }
 
diff --git a/drivers/of/base.c b/drivers/of/base.c
index 9c44eb6d445d..71175e670757 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2146,13 +2146,13 @@ static bool of_check_bad_map(const __be32 *map, int len)
  *
  * Return: 0 on success or a standard error code on failure.
  */
-int of_map_id(const struct device_node *np, u32 id,
-	       const char *map_name, const char *cells_name,
-	       const char *map_mask_name,
-	       struct of_phandle_args *arg)
+static int of_map_id_next(const struct device_node *np, u32 id,
+			  const char *map_name, const char *cells_name,
+			  const char *map_mask_name,
+			  struct of_phandle_args *arg, int *next_offset)
 {
 	u32 map_mask, masked_id;
-	int map_bytes, map_len, offset = 0;
+	int map_bytes, map_len, offset = next_offset ? *next_offset : 0;
 	bool bad_map = false;
 	const __be32 *map = NULL;
 
@@ -2161,7 +2161,7 @@ int of_map_id(const struct device_node *np, u32 id,
 
 	map = of_get_property(np, map_name, &map_bytes);
 	if (!map) {
-		if (arg->np)
+		if (arg->np || next_offset)
 			return -ENODEV;
 		/* Otherwise, no map implies no translation */
 		arg->args[0] = id;
@@ -2262,9 +2262,16 @@ int of_map_id(const struct device_node *np, u32 id,
 		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
 			np, map_name, map_mask, id_base, be32_to_cpup(out_base),
 			id_len, id, id_off + be32_to_cpup(out_base));
+
+		if (next_offset)
+			*next_offset = offset;	/* caller resumes from here */
 		return 0;
 	}
 
+	/* no (more) matches found in the map */
+	if (next_offset)
+		return -ENODEV;
+
 	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
 		id, arg->np);
 
@@ -2276,6 +2283,38 @@ int of_map_id(const struct device_node *np, u32 id,
 	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
 	return -EINVAL;
 }
+
+/**
+ * of_map_id - Translate an ID through a downstream mapping.
+ * @np: root complex device node.
+ * @id: device ID to map.
+ * @map_name: property name of the map to use.
+ * @cells_name: property name of target specifier cells.
+ * @map_mask_name: optional property name of the mask to use.
+ * @arg: pointer to a &struct of_phandle_args. On input, @arg->np may be
+ *	set to a target device node to match, or NULL to match any. On
+ *	success, @arg->np will be set to the matched target node (with a
+ *	reference held), @arg->args_count will be set to the number of
+ *	output specifier cells as defined by @cells_name in the target node,
+ *	and @arg->args[0..args_count-1] will contain the translated output
+ *	specifier values.
+ *
+ * Given a device ID, look up the appropriate implementation-defined
+ * platform ID and/or the target device which receives transactions on that
+ * ID, as per the "iommu-map" and "msi-map" bindings. If @arg->np points to
+ * a non-NULL device node, only entries targeting that node will be matched;
+ * if it is NULL, it will receive the device node of the first matching
+ * target phandle, with a reference held.
+ *
+ * Return: 0 on success or a standard error code on failure.
+ */
+int of_map_id(const struct device_node *np, u32 id,
+	      const char *map_name, const char *cells_name,
+	      const char *map_mask_name,
+	      struct of_phandle_args *arg)
+{
+	return of_map_id_next(np, id, map_name, cells_name, map_mask_name, arg, NULL);
+}
 EXPORT_SYMBOL_GPL(of_map_id);
 
 /**
@@ -2285,15 +2324,23 @@ EXPORT_SYMBOL_GPL(of_map_id);
  * @arg: pointer to a &struct of_phandle_args for the result. On success,
  *	@arg->np holds a reference to the target node that the caller must
  *	release with of_node_put().
+ * @next_offset: if non-NULL, on success it is set to the map offset just
+ *	past the matched entry. Pass this value back on the next call to
+ *	resume scanning from where the previous call left off, allowing all
+ *	matching entries for the same @id to be iterated. Pass NULL (or a
+ *	pointer to 0) to find only the first match.
  *
- * Convenience wrapper around of_map_id() using "iommu-map" and "iommu-map-mask".
+ * Wrapper around the internal iommu-map scanner using "iommu-map" and
+ * "iommu-map-mask". When @next_offset is non-NULL, returns -ENODEV once
+ * all matching entries have been exhausted.
  *
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_iommu_id(const struct device_node *np, u32 id,
-		    struct of_phandle_args *arg)
+		    struct of_phandle_args *arg, int *next_offset)
 {
-	return of_map_id(np, id, "iommu-map", "#iommu-cells", "iommu-map-mask", arg);
+	return of_map_id_next(np, id, "iommu-map", "#iommu-cells",
+			      "iommu-map-mask", arg, next_offset);
 }
 EXPORT_SYMBOL_GPL(of_map_iommu_id);
 
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 5f8a11774eb5..0d7f5e6d037a 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1146,7 +1146,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
 	u32 sid = 0;
 
 	target = NULL;
-	err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec);
+	err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec, NULL);
 	if (!err_i) {
 		target = iommu_spec.np;
 		sid_i = iommu_spec.args[0];
diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 2e86f8fd300b..c780e3f9d14d 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -765,7 +765,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
 	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
 		pci_name(pdev->bus->self), port->idx);
 
-	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
+	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec, NULL);
 	if (err)
 		return err;
 
diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 36547d7cf1d6..062beb5825f5 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -325,7 +325,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
 		struct pci_dev *pdev = to_pci_dev(dev);
 		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
 
-		if (of_map_iommu_id(np, rid, &iommu_spec)) {
+		if (of_map_iommu_id(np, rid, &iommu_spec, NULL)) {
 			dev_dbg(dev, "Cannot translate ID\n");
 			return -ESRCH;
 		}
diff --git a/include/linux/of.h b/include/linux/of.h
index 953f2dbe0e86..990849f00e74 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -467,7 +467,7 @@ int of_map_id(const struct device_node *np, u32 id,
 	       struct of_phandle_args *arg);
 
 int of_map_iommu_id(const struct device_node *np, u32 id,
-		    struct of_phandle_args *arg);
+		    struct of_phandle_args *arg, int *next_offset);
 
 int of_map_msi_id(const struct device_node *np, u32 id,
 		  struct of_phandle_args *arg);
@@ -943,7 +943,7 @@ static inline int of_map_id(const struct device_node *np, u32 id,
 }
 
 static inline int of_map_iommu_id(const struct device_node *np, u32 id,
-				  struct of_phandle_args *arg)
+				  struct of_phandle_args *arg, int *next_offset)
 {
 	return -EINVAL;
 }

---
base-commit: 9e94742cffb7541f55fa904a40c1ca9d836d303d
change-id: 20260315-iommu_multi_map-8c9b78490ace

Best regards,
-- 
Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>


